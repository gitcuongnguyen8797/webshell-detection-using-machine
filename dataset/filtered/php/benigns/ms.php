<?php
/**
 * Multisite administration functions.
 *
 * @package WordPress
 * @subpackage Multisite
 * @since 3.0.0
 */

/**
 * Determines whether uploaded file exceeds space quota.
 *
 * @since 3.0.0
 *
 * @param array $file An element from the `$_FILES` array for a given file.
 * @return array The `$_FILES` array element with 'error' key set if file exceeds quota. 'error' is empty otherwise.
 */
function check_upload_size( $file ) {
	if ( get_site_option( 'upload_space_check_disabled' ) ) {
		return $file;
	}

	if ( $file['error'] > 0 ) { // There's already an error.
		return $file;
	}

	if ( defined( 'WP_IMPORTING' ) ) {
		return $file;
	}

	$space_left = get_upload_space_available();

	$file_size = filesize( $file['tmp_name'] );
	if ( $space_left < $file_size ) {
		/* translators: %s: Required disk space in kilobytes. */
		$file['error'] = sprintf( __( 'Not enough space to upload. %s KB needed.' ), number_format( ( $file_size - $space_left ) / KB_IN_BYTES ) );
	}

	if ( $file_size > ( KB_IN_BYTES * get_site_option( 'fileupload_maxk', 1500 ) ) ) {
		/* translators: %s: Maximum allowed file size in kilobytes. */
		$file['error'] = sprintf( __( 'This file is too big. Files must be less than %s KB in size.' ), get_site_option( 'fileupload_maxk', 1500 ) );
	}

	if ( upload_is_user_over_quota( false ) ) {
		$file['error'] = __( 'You have used your space quota. Please delete files before uploading.' );
	}

	if ( $file['error'] > 0 && ! isset( $_POST['html-upload'] ) && ! wp_doing_ajax() ) {
		wp_die( $file['error'] . ' <a href="javascript:history.go(-1)">' . __( 'Back' ) . '</a>' );
	}

	return $file;
}

/**
 * Deletes a site.
 *
 * @since 3.0.0
 * @since 5.1.0 Use wp_delete_site() internally to delete the site row from the database.
 *
 * @global wpdb $wpdb WordPress database abstraction object.
 *
 * @param int  $blog_id Site ID.
 * @param bool $drop    True if site's database tables should be dropped. Default false.
 */
function wpmu_delete_blog( $blog_id, $drop = false ) {
	global $wpdb;

	$blog_id = (int) $blog_id;

	$switch = false;
	if ( get_current_blog_id() !== $blog_id ) {
		$switch = true;
		switch_to_blog( $blog_id );
	}

	$blog = get_site( $blog_id );

	$current_network = get_network();

	// If a full blog object is not available, do not destroy anything.
	if ( $drop && ! $blog ) {
		$drop = false;
	}

	// Don't destroy the initial, main, or root blog.
	if ( $drop
		&& ( 1 === $blog_id || is_main_site( $blog_id )
			|| ( $blog->path === $current_network->path && $blog->domain === $current_network->domain ) )
	) {
		$drop = false;
	}

	$upload_path = trim( get_option( 'upload_path' ) );

	// If ms_files_rewriting is enabled and upload_path is empty, wp_upload_dir is not reliable.
	if ( $drop && get_site_option( 'ms_files_rewriting' ) && empty( $upload_path ) ) {
		$drop = false;
	}

	if ( $drop ) {
		wp_delete_site( $blog_id );
	} else {
		/** This action is documented in wp-includes/ms-blogs.php */
		do_action_deprecated( 'delete_blog', array( $blog_id, false ), '5.1.0' );

		$users = get_users(
			array(
				'blog_id' => $blog_id,
				'fields'  => 'ids',
			)
		);

		// Remove users from this blog.
		if ( ! empty( $users ) ) {
			foreach ( $users as $user_id ) {
				remove_user_from_blog( $user_id, $blog_id );
			}
		}

		update_blog_status( $blog_id, 'deleted', 1 );

		/** This action is documented in wp-includes/ms-blogs.php */
		do_action_deprecated( 'deleted_blog', array( $blog_id, false ), '5.1.0' );
	}

	if ( $switch ) {
		restore_current_blog();
	}
}

/**
 * Deletes a user from the network and remove from all sites.
 *
 * @since 3.0.0
 *
 * @todo Merge with wp_delete_user()?
 *
 * @global wpdb $wpdb WordPress database abstraction object.
 *
 * @param int $id The user ID.
 * @return bool True if the user was deleted, false otherwise.
 */
function wpmu_delete_user( $id ) {
	global $wpdb;

	if ( ! is_numeric( $id ) ) {
		return false;
	}

	$id   = (int) $id;
	$user = new WP_User( $id );

	if ( ! $user->exists() ) {
		return false;
	}

	// Global super-administrators are protected, and cannot be deleted.
	$_super_admins = get_super_admins();
	if ( in_array( $user->user_login, $_super_admins, true ) ) {
		return false;
	}

	/**
	 * Fires before a user is deleted from the network.
	 *
	 * @since MU (3.0.0)
	 * @since 5.5.0 Added the `$user` parameter.
	 *
	 * @param int     $id   ID of the user about to be deleted from the network.
	 * @param WP_User $user WP_User object of the user about to be deleted from the network.
	 */
	do_action( 'wpmu_delete_user', $id, $user );

	$blogs = get_blogs_of_user( $id );

	if ( ! empty( $blogs ) ) {
		foreach ( $blogs as $blog ) {
			switch_to_blog( $blog->userblog_id );
			remove_user_from_blog( $id, $blog->userblog_id );

			$post_ids = $wpdb->get_col( $wpdb->prepare( "SELECT ID FROM $wpdb->posts WHERE post_author = %d", $id ) );
			foreach ( (array) $post_ids as $post_id ) {
				wp_delete_post( $post_id );
			}

			// Clean links.
			$link_ids = $wpdb->get_col( $wpdb->prepare( "SELECT link_id FROM $wpdb->links WHERE link_owner = %d", $id ) );

			if ( $link_ids ) {
				foreach ( $link_ids as $link_id ) {
					wp_delete_link( $link_id );
				}
			}

			restore_current_blog();
		}
	}

	$meta = $wpdb->get_col( $wpdb->prepare( "SELECT umeta_id FROM $wpdb->usermeta WHERE user_id = %d", $id ) );
	foreach ( $meta as $mid ) {
		delete_metadata_by_mid( 'user', $mid );
	}

	$wpdb->delete( $wpdb->users, array( 'ID' => $id ) );

	clean_user_cache( $user );

	/** This action is documented in wp-admin/includes/user.php */
	do_action( 'deleted_user', $id, null, $user );

	return true;
}

/**
 * Checks whether a site has used its allotted upload space.
 *
 * @since MU (3.0.0)
 *
 * @param bool $display_message Optional. If set to true and the quota is exceeded,
 *                              a warning message is displayed. Default true.
 * @return bool True if user is over upload space quota, otherwise false.
 */
function upload_is_user_over_quota( $display_message = true ) {
	if ( get_site_option( 'upload_space_check_disabled' ) ) {
		return false;
	}

	$space_allowed = get_space_allowed();
	if ( ! is_numeric( $space_allowed ) ) {
		$space_allowed = 10; // Default space allowed is 10 MB.
	}
	$space_used = get_space_used();

	if ( ( $space_allowed - $space_used ) < 0 ) {
		if ( $display_message ) {
			printf(
				/* translators: %s: Allowed space allocation. */
				__( 'Sorry, you have used your space allocation of %s. Please delete some files to upload more files.' ),
				size_format( $space_allowed * MB_IN_BYTES )
			);
		}
		return true;
	} else {
		return false;
	}
}

/**
 * Displays the amount of disk space used by the current site. Not used in core.
 *
 * @since MU (3.0.0)
 */
function display_space_usage() {
	$space_allowed = get_space_allowed();
	$space_used    = get_space_used();

	$percent_used = ( $space_used / $space_allowed ) * 100;

	$space = size_format( $space_allowed * MB_IN_BYTES );
	?><?php
		/* translators: Storage space that's been used. 1: Percentage of used space, 2: Total space allowed in megabytes or gigabytes. */
		printf( __( 'Used: %1$s%% of %2$s' ), number_format( $percent_used ), $space );
	?><?php
}

/**
 * Gets the remaining upload space for this site.
 *
 * @since MU (3.0.0)
 *
 * @param int $size Current max size in bytes.
 * @return int Max size in bytes.
 */
function fix_import_form_size( $size ) {
	if ( upload_is_user_over_quota( false ) ) {
		return 0;
	}
	$available = get_upload_space_available();
	return min( $size, $available );
}

/**
 * Displays the site upload space quota setting form on the Edit Site Settings screen.
 *
 * @since 3.0.0
 *
 * @param int $id The ID of the site to display the setting for.
 */
function upload_space_setting( $id ) {
	switch_to_blog( $id );
	$quota = get_option( 'blog_upload_space' );
	restore_current_blog();

	if ( ! $quota ) {
		$quota = '';
	}

	?><?php _e( 'Site Upload Space Quota' ); ?><?php echo $quota; ?><?php
				/* translators: Hidden accessibility text. */
				_e( 'Size in megabytes' );
				?><?php _e( 'MB (Leave blank for network default)' ); ?><?php
}

/**
 * Cleans the user cache for a specific user.
 *
 * @since 3.0.0
 *
 * @param int $id The user ID.
 * @return int|false The ID of the refreshed user or false if the user does not exist.
 */
function refresh_user_details( $id ) {
	$id = (int) $id;

	$user = get_userdata( $id );
	if ( ! $user ) {
		return false;
	}

	clean_user_cache( $user );

	return $id;
}

/**
 * Returns the language for a language code.
 *
 * @since 3.0.0
 *
 * @param string $code Optional. The two-letter language code. Default empty.
 * @return string The language corresponding to $code if it exists. If it does not exist,
 *                then the first two letters of $code is returned.
 */
function format_code_lang( $code = '' ) {
	$code       = strtolower( substr( $code, 0, 2 ) );
	$lang_codes = array(
		'aa' => 'Afar',
		'ab' => 'Abkhazian',
		'af' => 'Afrikaans',
		'ak' => 'Akan',
		'sq' => 'Albanian',
		'am' => 'Amharic',
		'ar' => 'Arabic',
		'an' => 'Aragonese',
		'hy' => 'Armenian',
		'as' => 'Assamese',
		'av' => 'Avaric',
		'ae' => 'Avestan',
		'ay' => 'Aymara',
		'az' => 'Azerbaijani',
		'ba' => 'Bashkir',
		'bm' => 'Bambara',
		'eu' => 'Basque',
		'be' => 'Belarusian',
		'bn' => 'Bengali',
		'bh' => 'Bihari',
		'bi' => 'Bislama',
		'bs' => 'Bosnian',
		'br' => 'Breton',
		'bg' => 'Bulgarian',
		'my' => 'Burmese',
		'ca' => 'Catalan; Valencian',
		'ch' => 'Chamorro',
		'ce' => 'Chechen',
		'zh' => 'Chinese',
		'cu' => 'Church Slavic; Old Slavonic; Church Slavonic; Old Bulgarian; Old Church Slavonic',
		'cv' => 'Chuvash',
		'kw' => 'Cornish',
		'co' => 'Corsican',
		'cr' => 'Cree',
		'cs' => 'Czech',
		'da' => 'Danish',
		'dv' => 'Divehi; Dhivehi; Maldivian',
		'nl' => 'Dutch; Flemish',
		'dz' => 'Dzongkha',
		'en' => 'English',
		'eo' => 'Esperanto',
		'et' => 'Estonian',
		'ee' => 'Ewe',
		'fo' => 'Faroese',
		'fj' => 'Fijjian',
		'fi' => 'Finnish',
		'fr' => 'French',
		'fy' => 'Western Frisian',
		'ff' => 'Fulah',
		'ka' => 'Georgian',
		'de' => 'German',
		'gd' => 'Gaelic; Scottish Gaelic',
		'ga' => 'Irish',
		'gl' => 'Galician',
		'gv' => 'Manx',
		'el' => 'Greek, Modern',
		'gn' => 'Guarani',
		'gu' => 'Gujarati',
		'ht' => 'Haitian; Haitian Creole',
		'ha' => 'Hausa',
		'he' => 'Hebrew',
		'hz' => 'Herero',
		'hi' => 'Hindi',
		'ho' => 'Hiri Motu',
		'hu' => 'Hungarian',
		'ig' => 'Igbo',
		'is' => 'Icelandic',
		'io' => 'Ido',
		'ii' => 'Sichuan Yi',
		'iu' => 'Inuktitut',
		'ie' => 'Interlingue',
		'ia' => 'Interlingua (International Auxiliary Language Association)',
		'id' => 'Indonesian',
		'ik' => 'Inupiaq',
		'it' => 'Italian',
		'jv' => 'Javanese',
		'ja' => 'Japanese',
		'kl' => 'Kalaallisut; Greenlandic',
		'kn' => 'Kannada',
		'ks' => 'Kashmiri',
		'kr' => 'Kanuri',
		'kk' => 'Kazakh',
		'km' => 'Central Khmer',
		'ki' => 'Kikuyu; Gikuyu',
		'rw' => 'Kinyarwanda',
		'ky' => 'Kirghiz; Kyrgyz',
		'kv' => 'Komi',
		'kg' => 'Kongo',
		'ko' => 'Korean',
		'kj' => 'Kuanyama; Kwanyama',
		'ku' => 'Kurdish',
		'lo' => 'Lao',
		'la' => 'Latin',
		'lv' => 'Latvian',
		'li' => 'Limburgan; Limburger; Limburgish',
		'ln' => 'Lingala',
		'lt' => 'Lithuanian',
		'lb' => 'Luxembourgish; Letzeburgesch',
		'lu' => 'Luba-Katanga',
		'lg' => 'Ganda',
		'mk' => 'Macedonian',
		'mh' => 'Marshallese',
		'ml' => 'Malayalam',
		'mi' => 'Maori',
		'mr' => 'Marathi',
		'ms' => 'Malay',
		'mg' => 'Malagasy',
		'mt' => 'Maltese',
		'mo' => 'Moldavian',
		'mn' => 'Mongolian',
		'na' => 'Nauru',
		'nv' => 'Navajo; Navaho',
		'nr' => 'Ndebele, South; South Ndebele',
		'nd' => 'Ndebele, North; North Ndebele',
		'ng' => 'Ndonga',
		'ne' => 'Nepali',
		'nn' => 'Norwegian Nynorsk; Nynorsk, Norwegian',
		'nb' => 'Bokmål, Norwegian, Norwegian Bokmål',
		'no' => 'Norwegian',
		'ny' => 'Chichewa; Chewa; Nyanja',
		'oc' => 'Occitan, Provençal',
		'oj' => 'Ojibwa',
		'or' => 'Oriya',
		'om' => 'Oromo',
		'os' => 'Ossetian; Ossetic',
		'pa' => 'Panjabi; Punjabi',
		'fa' => 'Persian',
		'pi' => 'Pali',
		'pl' => 'Polish',
		'pt' => 'Portuguese',
		'ps' => 'Pushto',
		'qu' => 'Quechua',
		'rm' => 'Romansh',
		'ro' => 'Romanian',
		'rn' => 'Rundi',
		'ru' => 'Russian',
		'sg' => 'Sango',
		'sa' => 'Sanskrit',
		'sr' => 'Serbian',
		'hr' => 'Croatian',
		'si' => 'Sinhala; Sinhalese',
		'sk' => 'Slovak',
		'sl' => 'Slovenian',
		'se' => 'Northern Sami',
		'sm' => 'Samoan',
		'sn' => 'Shona',
		'sd' => 'Sindhi',
		'so' => 'Somali',
		'st' => 'Sotho, Southern',
		'es' => 'Spanish; Castilian',
		'sc' => 'Sardinian',
		'ss' => 'Swati',
		'su' => 'Sundanese',
		'sw' => 'Swahili',
		'sv' => 'Swedish',
		'ty' => 'Tahitian',
		'ta' => 'Tamil',
		'tt' => 'Tatar',
		'te' => 'Telugu',
		'tg' => 'Tajik',
		'tl' => 'Tagalog',
		'th' => 'Thai',
		'bo' => 'Tibetan',
		'ti' => 'Tigrinya',
		'to' => 'Tonga (Tonga Islands)',
		'tn' => 'Tswana',
		'ts' => 'Tsonga',
		'tk' => 'Turkmen',
		'tr' => 'Turkish',
		'tw' => 'Twi',
		'ug' => 'Uighur; Uyghur',
		'uk' => 'Ukrainian',
		'ur' => 'Urdu',
		'uz' => 'Uzbek',
		've' => 'Venda',
		'vi' => 'Vietnamese',
		'vo' => 'Volapük',
		'cy' => 'Welsh',
		'wa' => 'Walloon',
		'wo' => 'Wolof',
		'xh' => 'Xhosa',
		'yi' => 'Yiddish',
		'yo' => 'Yoruba',
		'za' => 'Zhuang; Chuang',
		'zu' => 'Zulu',
	);

	/**
	 * Filters the language codes.
	 *
	 * @since MU (3.0.0)
	 *
	 * @param string[] $lang_codes Array of key/value pairs of language codes where key is the short version.
	 * @param string   $code       A two-letter designation of the language.
	 */
	$lang_codes = apply_filters( 'lang_codes', $lang_codes, $code );
	return strtr( $code, $lang_codes );
}

/**
 * Displays an access denied message when a user tries to view a site's dashboard they
 * do not have access to.
 *
 * @since 3.2.0
 * @access private
 */
function _access_denied_splash() {
	if ( ! is_user_logged_in() || is_network_admin() ) {
		return;
	}

	$blogs = get_blogs_of_user( get_current_user_id() );

	if ( wp_list_filter( $blogs, array( 'userblog_id' => get_current_blog_id() ) ) ) {
		return;
	}

	$blog_name = get_bloginfo( 'name' );

	if ( empty( $blogs ) ) {
		wp_die(
			sprintf(
				/* translators: 1: Site title. */
				__( 'You attempted to access the "%1$s" dashboard, but you do not currently have privileges on this site. If you believe you should be able to access the "%1$s" dashboard, please contact your network administrator.' ),
				$blog_name
			),
			403
		);
	}

	$output = '<p>' . sprintf(
		/* translators: 1: Site title. */
		__( 'You attempted to access the "%1$s" dashboard, but you do not currently have privileges on this site. If you believe you should be able to access the "%1$s" dashboard, please contact your network administrator.' ),
		$blog_name
	) . '</p>';
	$output .= '<p>' . __( 'If you reached this screen by accident and meant to visit one of your own sites, here are some shortcuts to help you find your way.' ) . '</p>';

	$output .= '<h3>' . __( 'Your Sites' ) . '</h3>';
	$output .= '<table>';

	foreach ( $blogs as $blog ) {
		$output .= '<tr>';
		$output .= "<td>{$blog->blogname}</td>";
		$output .= '<td><a href="' . esc_url( get_admin_url( $blog->userblog_id ) ) . '">' . __( 'Visit Dashboard' ) . '</a> | ' .
			'<a href="' . esc_url( get_home_url( $blog->userblog_id ) ) . '">' . __( 'View Site' ) . '</a></td>';
		$output .= '</tr>';
	}

	$output .= '</table>';

	wp_die( $output, 403 );
}

/**
 * Checks if the current user has permissions to import new users.
 *
 * @since 3.0.0
 *
 * @param string $permission A permission to be checked. Currently not used.
 * @return bool True if the user has proper permissions, false if they do not.
 */
function check_import_new_users( $permission ) {
	if ( ! current_user_can( 'manage_network_users' ) ) {
		return false;
	}

	return true;
}
// See "import_allow_fetch_attachments" and "import_attachment_size_limit" filters too.

/**
 * Generates and displays a drop-down of available languages.
 *
 * @since 3.0.0
 *
 * @param string[] $lang_files Optional. An array of the language files. Default empty array.
 * @param string   $current    Optional. The current language code. Default empty.
 */
function mu_dropdown_languages( $lang_files = array(), $current = '' ) {
	$flag   = false;
	$output = array();

	foreach ( (array) $lang_files as $val ) {
		$code_lang = basename( $val, '.mo' );

		if ( 'en_US' === $code_lang ) { // American English.
			$flag          = true;
			$ae            = __( 'American English' );
			$output[ $ae ] = '<option value="' . esc_attr( $code_lang ) . '"' . selected( $current, $code_lang, false ) . '> ' . $ae . '</option>';
		} elseif ( 'en_GB' === $code_lang ) { // British English.
			$flag          = true;
			$be            = __( 'British English' );
			$output[ $be ] = '<option value="' . esc_attr( $code_lang ) . '"' . selected( $current, $code_lang, false ) . '> ' . $be . '</option>';
		} else {
			$translated            = format_code_lang( $code_lang );
			$output[ $translated ] = '<option value="' . esc_attr( $code_lang ) . '"' . selected( $current, $code_lang, false ) . '> ' . esc_html( $translated ) . '</option>';
		}
	}

	if ( false === $flag ) { // WordPress English.
		$output[] = '<option value=""' . selected( $current, '', false ) . '>' . __( 'English' ) . '</option>';
	}

	// Order by name.
	uksort( $output, 'strnatcasecmp' );

	/**
	 * Filters the languages available in the dropdown.
	 *
	 * @since MU (3.0.0)
	 *
	 * @param string[] $output     Array of HTML output for the dropdown.
	 * @param string[] $lang_files Array of available language files.
	 * @param string   $current    The current language code.
	 */
	$output = apply_filters( 'mu_dropdown_languages', $output, $lang_files, $current );

	echo implode( "\n\t", $output );
}

/**
 * Displays an admin notice to upgrade all sites after a core upgrade.
 *
 * @since 3.0.0
 *
 * @global int    $wp_db_version WordPress database version.
 * @global string $pagenow       The filename of the current screen.
 *
 * @return void|false Void on success. False if the current user is not a super admin.
 */
function site_admin_notice() {
	global $wp_db_version, $pagenow;

	if ( ! current_user_can( 'upgrade_network' ) ) {
		return false;
	}

	if ( 'upgrade.php' === $pagenow ) {
		return;
	}

	if ( (int) get_site_option( 'wpmu_upgrade_site' ) !== $wp_db_version ) {
		echo "<div class='update-nag notice notice-warning inline'>" . sprintf(
			/* translators: %s: URL to Upgrade Network screen. */
			__( 'Thank you for Updating! Please visit the <a href="%s">Upgrade Network</a> page to update all your sites.' ),
			esc_url( network_admin_url( 'upgrade.php' ) )
		) . '</div>';
	}
}

/**
 * Avoids a collision between a site slug and a permalink slug.
 *
 * In a subdirectory installation this will make sure that a site and a post do not use the
 * same subdirectory by checking for a site with the same name as a new post.
 *
 * @since 3.0.0
 *
 * @param array $data    An array of post data.
 * @param array $postarr An array of posts. Not currently used.
 * @return array The new array of post data after checking for collisions.
 */
function avoid_blog_page_permalink_collision( $data, $postarr ) {
	if ( is_subdomain_install() ) {
		return $data;
	}
	if ( 'page' !== $data['post_type'] ) {
		return $data;
	}
	if ( ! isset( $data['post_name'] ) || '' === $data['post_name'] ) {
		return $data;
	}
	if ( ! is_main_site() ) {
		return $data;
	}
	if ( isset( $data['post_parent'] ) && $data['post_parent'] ) {
		return $data;
	}

	$post_name = $data['post_name'];
	$c         = 0;

	while ( $c < 10 && get_id_from_blogname( $post_name ) ) {
		$post_name .= mt_rand( 1, 10 );
		$c++;
	}

	if ( $post_name !== $data['post_name'] ) {
		$data['post_name'] = $post_name;
	}

	return $data;
}

/**
 * Handles the display of choosing a user's primary site.
 *
 * This displays the user's primary site and allows the user to choose
 * which site is primary.
 *
 * @since 3.0.0
 */
function choose_primary_blog() {
	?><?php /* translators: My Sites label. */ ?><?php _e( 'Primary Site' ); ?><?php
		$all_blogs    = get_blogs_of_user( get_current_user_id() );
		$primary_blog = (int) get_user_meta( get_current_user_id(), 'primary_blog', true );
		if ( count( $all_blogs ) > 1 ) {
			$found = false;
			?><?php
				foreach ( (array) $all_blogs as $blog ) {
					if ( $blog->userblog_id === $primary_blog ) {
						$found = true;
					}
					?><?php echo $blog->userblog_id; ?><?php selected( $primary_blog, $blog->userblog_id ); ?><?php echo esc_url( get_home_url( $blog->userblog_id ) ); ?><?php
				}
				?><?php
			if ( ! $found ) {
				$blog = reset( $all_blogs );
				update_user_meta( get_current_user_id(), 'primary_blog', $blog->userblog_id );
			}
		} elseif ( 1 === count( $all_blogs ) ) {
			$blog = reset( $all_blogs );
			echo esc_url( get_home_url( $blog->userblog_id ) );
			if ( $blog->userblog_id !== $primary_blog ) { // Set the primary blog again if it's out of sync with blog list.
				update_user_meta( get_current_user_id(), 'primary_blog', $blog->userblog_id );
			}
		} else {
			_e( 'Not available' );
		}
		?><?php
}

/**
 * Determines whether or not this network from this page can be edited.
 *
 * By default editing of network is restricted to the Network Admin for that `$network_id`.
 * This function allows for this to be overridden.
 *
 * @since 3.1.0
 *
 * @param int $network_id The network ID to check.
 * @return bool True if network can be edited, false otherwise.
 */
function can_edit_network( $network_id ) {
	if ( get_current_network_id() === (int) $network_id ) {
		$result = true;
	} else {
		$result = false;
	}

	/**
	 * Filters whether this network can be edited from this page.
	 *
	 * @since 3.1.0
	 *
	 * @param bool $result     Whether the network can be edited from this page.
	 * @param int  $network_id The network ID to check.
	 */
	return apply_filters( 'can_edit_network', $result, $network_id );
}

/**
 * Prints thickbox image paths for Network Admin.
 *
 * @since 3.1.0
 *
 * @access private
 */
function _thickbox_path_admin_subfolder() {
	?><?php echo esc_js( includes_url( 'js/thickbox/loadingAnimation.gif', 'relative' ) ); ?><?php
}

/**
 * @param array $users
 */
function confirm_delete_users( $users ) {
	$current_user = wp_get_current_user();
	if ( ! is_array( $users ) || empty( $users ) ) {
		return false;
	}
	?><?php esc_html_e( 'Users' ); ?><?php if ( 1 === count( $users ) ) : ?><?php _e( 'You have chosen to delete the user from all networks and sites.' ); ?><?php else : ?><?php _e( 'You have chosen to delete the following users from all networks and sites.' ); ?><?php endif; ?><?php
	wp_nonce_field( 'ms-users-delete' );
	$site_admins = get_super_admins();
	$admin_out   = '<option value="' . esc_attr( $current_user->ID ) . '">' . $current_user->user_login . '</option>';
	?><?php
	$allusers = (array) $_POST['allusers'];
	foreach ( $allusers as $user_id ) {
		if ( '' !== $user_id && '0' !== $user_id ) {
			$delete_user = get_userdata( $user_id );

			if ( ! current_user_can( 'delete_user', $delete_user->ID ) ) {
				wp_die(
					sprintf(
						/* translators: %s: User login. */
						__( 'Warning! User %s cannot be deleted.' ),
						$delete_user->user_login
					)
				);
			}

			if ( in_array( $delete_user->user_login, $site_admins, true ) ) {
				wp_die(
					sprintf(
						/* translators: %s: User login. */
						__( 'Warning! User cannot be deleted. The user %s is a network administrator.' ),
						'<em>' . $delete_user->user_login . '</em>'
					)
				);
			}
			?><?php echo $delete_user->user_login; ?><?php echo '<input type="hidden" name="user[]" value="' . esc_attr( $user_id ) . '" />' . "\n"; ?><?php
			$blogs = get_blogs_of_user( $user_id, true );

			if ( ! empty( $blogs ) ) {
				?><?php
				printf(
					/* translators: %s: User login. */
					__( 'What should be done with content owned by %s?' ),
					'<em>' . $delete_user->user_login . '</em>'
				);
				?><?php
				foreach ( (array) $blogs as $key => $details ) {
					$blog_users = get_users(
						array(
							'blog_id' => $details->userblog_id,
							'fields'  => array( 'ID', 'user_login' ),
						)
					);

					if ( is_array( $blog_users ) && ! empty( $blog_users ) ) {
						$user_site     = "<a href='" . esc_url( get_home_url( $details->userblog_id ) ) . "'>{$details->blogname}</a>";
						$user_dropdown = '<label for="reassign_user" class="screen-reader-text">' .
								/* translators: Hidden accessibility text. */
								__( 'Select a user' ) .
							'</label>';
						$user_dropdown .= "<select name='blog[$user_id][$key]' id='reassign_user'>";
						$user_list      = '';

						foreach ( $blog_users as $user ) {
							if ( ! in_array( (int) $user->ID, $allusers, true ) ) {
								$user_list .= "<option value='{$user->ID}'>{$user->user_login}</option>";
							}
						}

						if ( '' === $user_list ) {
							$user_list = $admin_out;
						}

						$user_dropdown .= $user_list;
						$user_dropdown .= "</select>\n";
						?><?php
								/* translators: %s: Link to user's site. */
								printf( __( 'Site: %s' ), $user_site );
								?><?php echo $details->userblog_id . '][' . $delete_user->ID; ?><?php _e( 'Delete all content.' ); ?><?php echo $details->userblog_id . '][' . $delete_user->ID; ?><?php _e( 'Attribute all content to:' ); ?><?php echo $user_dropdown; ?><?php
					}
				}
				echo '</fieldset></td></tr>';
			} else {
				?><?php _e( 'User has no sites or content and will be deleted.' ); ?><?php } ?><?php
		}
	}

	?><?php
	/** This action is documented in wp-admin/users.php */
	do_action( 'delete_user_form', $current_user, $allusers );

	if ( 1 === count( $users ) ) :
		?><?php _e( 'Once you hit &#8220;Confirm Deletion&#8221;, the user will be permanently removed.' ); ?><?php else : ?><?php _e( 'Once you hit &#8220;Confirm Deletion&#8221;, these users will be permanently removed.' ); ?><?php
	endif;

	submit_button( __( 'Confirm Deletion' ), 'primary' );
	?><?php
	return true;
}

/**
 * Prints JavaScript in the header on the Network Settings screen.
 *
 * @since 4.1.0
 */
function network_settings_add_js() {
	?>