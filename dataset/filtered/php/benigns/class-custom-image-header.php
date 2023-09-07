<?php
/**
 * The custom header image script.
 *
 * @package WordPress
 * @subpackage Administration
 */

/**
 * The custom header image class.
 *
 * @since 2.1.0
 */
#[AllowDynamicProperties]
class Custom_Image_Header {

	/**
	 * Callback for administration header.
	 *
	 * @var callable
	 * @since 2.1.0
	 */
	public $admin_header_callback;

	/**
	 * Callback for header div.
	 *
	 * @var callable
	 * @since 3.0.0
	 */
	public $admin_image_div_callback;

	/**
	 * Holds default headers.
	 *
	 * @var array
	 * @since 3.0.0
	 */
	public $default_headers = array();

	/**
	 * Used to trigger a success message when settings updated and set to true.
	 *
	 * @since 3.0.0
	 * @var bool
	 */
	private $updated;

	/**
	 * Constructor - Register administration header callback.
	 *
	 * @since 2.1.0
	 * @param callable $admin_header_callback
	 * @param callable $admin_image_div_callback Optional custom image div output callback.
	 */
	public function __construct( $admin_header_callback, $admin_image_div_callback = '' ) {
		$this->admin_header_callback    = $admin_header_callback;
		$this->admin_image_div_callback = $admin_image_div_callback;

		add_action( 'admin_menu', array( $this, 'init' ) );

		add_action( 'customize_save_after', array( $this, 'customize_set_last_used' ) );
		add_action( 'wp_ajax_custom-header-crop', array( $this, 'ajax_header_crop' ) );
		add_action( 'wp_ajax_custom-header-add', array( $this, 'ajax_header_add' ) );
		add_action( 'wp_ajax_custom-header-remove', array( $this, 'ajax_header_remove' ) );
	}

	/**
	 * Set up the hooks for the Custom Header admin page.
	 *
	 * @since 2.1.0
	 */
	public function init() {
		$page = add_theme_page( __( 'Header' ), __( 'Header' ), 'edit_theme_options', 'custom-header', array( $this, 'admin_page' ) );

		if ( ! $page ) {
			return;
		}

		add_action( "admin_print_scripts-{$page}", array( $this, 'js_includes' ) );
		add_action( "admin_print_styles-{$page}", array( $this, 'css_includes' ) );
		add_action( "admin_head-{$page}", array( $this, 'help' ) );
		add_action( "admin_head-{$page}", array( $this, 'take_action' ), 50 );
		add_action( "admin_head-{$page}", array( $this, 'js' ), 50 );

		if ( $this->admin_header_callback ) {
			add_action( "admin_head-{$page}", $this->admin_header_callback, 51 );
		}
	}

	/**
	 * Adds contextual help.
	 *
	 * @since 3.0.0
	 */
	public function help() {
		get_current_screen()->add_help_tab(
			array(
				'id'      => 'overview',
				'title'   => __( 'Overview' ),
				'content' =>
					'<p>' . __( 'This screen is used to customize the header section of your theme.' ) . '</p>' .
					'<p>' . __( 'You can choose from the theme&#8217;s default header images, or use one of your own. You can also customize how your Site Title and Tagline are displayed.' ) . '<p>',
			)
		);

		get_current_screen()->add_help_tab(
			array(
				'id'      => 'set-header-image',
				'title'   => __( 'Header Image' ),
				'content' =>
					'<p>' . __( 'You can set a custom image header for your site. Simply upload the image and crop it, and the new header will go live immediately. Alternatively, you can use an image that has already been uploaded to your Media Library by clicking the &#8220;Choose Image&#8221; button.' ) . '</p>' .
					'<p>' . __( 'Some themes come with additional header images bundled. If you see multiple images displayed, select the one you would like and click the &#8220;Save Changes&#8221; button.' ) . '</p>' .
					'<p>' . __( 'If your theme has more than one default header image, or you have uploaded more than one custom header image, you have the option of having WordPress display a randomly different image on each page of your site. Click the &#8220;Random&#8221; radio button next to the Uploaded Images or Default Images section to enable this feature.' ) . '</p>' .
					'<p>' . __( 'If you do not want a header image to be displayed on your site at all, click the &#8220;Remove Header Image&#8221; button at the bottom of the Header Image section of this page. If you want to re-enable the header image later, you just have to select one of the other image options and click &#8220;Save Changes&#8221;.' ) . '</p>',
			)
		);

		get_current_screen()->add_help_tab(
			array(
				'id'      => 'set-header-text',
				'title'   => __( 'Header Text' ),
				'content' =>
					'<p>' . sprintf(
						/* translators: %s: URL to General Settings screen. */
						__( 'For most themes, the header text is your Site Title and Tagline, as defined in the <a href="%s">General Settings</a> section.' ),
						admin_url( 'options-general.php' )
					) .
					'</p>' .
					'<p>' . __( 'In the Header Text section of this page, you can choose whether to display this text or hide it. You can also choose a color for the text by clicking the Select Color button and either typing in a legitimate HTML hex value, e.g. &#8220;#ff0000&#8221; for red, or by choosing a color using the color picker.' ) . '</p>' .
					'<p>' . __( 'Do not forget to click &#8220;Save Changes&#8221; when you are done!' ) . '</p>',
			)
		);

		get_current_screen()->set_help_sidebar(
			'<p><strong>' . __( 'For more information:' ) . '</strong></p>' .
			'<p>' . __( '<a href="https://codex.wordpress.org/Appearance_Header_Screen">Documentation on Custom Header</a>' ) . '</p>' .
			'<p>' . __( '<a href="https://wordpress.org/support/forums/">Support forums</a>' ) . '</p>'
		);
	}

	/**
	 * Get the current step.
	 *
	 * @since 2.6.0
	 *
	 * @return int Current step.
	 */
	public function step() {
		if ( ! isset( $_GET['step'] ) ) {
			return 1;
		}

		$step = (int) $_GET['step'];
		if ( $step < 1 || 3 < $step ||
			( 2 === $step && ! wp_verify_nonce( $_REQUEST['_wpnonce-custom-header-upload'], 'custom-header-upload' ) ) ||
			( 3 === $step && ! wp_verify_nonce( $_REQUEST['_wpnonce'], 'custom-header-crop-image' ) )
		) {
			return 1;
		}

		return $step;
	}

	/**
	 * Set up the enqueue for the JavaScript files.
	 *
	 * @since 2.1.0
	 */
	public function js_includes() {
		$step = $this->step();

		if ( ( 1 === $step || 3 === $step ) ) {
			wp_enqueue_media();
			wp_enqueue_script( 'custom-header' );
			if ( current_theme_supports( 'custom-header', 'header-text' ) ) {
				wp_enqueue_script( 'wp-color-picker' );
			}
		} elseif ( 2 === $step ) {
			wp_enqueue_script( 'imgareaselect' );
		}
	}

	/**
	 * Set up the enqueue for the CSS files
	 *
	 * @since 2.7.0
	 */
	public function css_includes() {
		$step = $this->step();

		if ( ( 1 === $step || 3 === $step ) && current_theme_supports( 'custom-header', 'header-text' ) ) {
			wp_enqueue_style( 'wp-color-picker' );
		} elseif ( 2 === $step ) {
			wp_enqueue_style( 'imgareaselect' );
		}
	}

	/**
	 * Execute custom header modification.
	 *
	 * @since 2.6.0
	 */
	public function take_action() {
		if ( ! current_user_can( 'edit_theme_options' ) ) {
			return;
		}

		if ( empty( $_POST ) ) {
			return;
		}

		$this->updated = true;

		if ( isset( $_POST['resetheader'] ) ) {
			check_admin_referer( 'custom-header-options', '_wpnonce-custom-header-options' );

			$this->reset_header_image();

			return;
		}

		if ( isset( $_POST['removeheader'] ) ) {
			check_admin_referer( 'custom-header-options', '_wpnonce-custom-header-options' );

			$this->remove_header_image();

			return;
		}

		if ( isset( $_POST['text-color'] ) && ! isset( $_POST['display-header-text'] ) ) {
			check_admin_referer( 'custom-header-options', '_wpnonce-custom-header-options' );

			set_theme_mod( 'header_textcolor', 'blank' );
		} elseif ( isset( $_POST['text-color'] ) ) {
			check_admin_referer( 'custom-header-options', '_wpnonce-custom-header-options' );

			$_POST['text-color'] = str_replace( '#', '', $_POST['text-color'] );

			$color = preg_replace( '/[^0-9a-fA-F]/', '', $_POST['text-color'] );

			if ( strlen( $color ) === 6 || strlen( $color ) === 3 ) {
				set_theme_mod( 'header_textcolor', $color );
			} elseif ( ! $color ) {
				set_theme_mod( 'header_textcolor', 'blank' );
			}
		}

		if ( isset( $_POST['default-header'] ) ) {
			check_admin_referer( 'custom-header-options', '_wpnonce-custom-header-options' );

			$this->set_header_image( $_POST['default-header'] );

			return;
		}
	}

	/**
	 * Process the default headers
	 *
	 * @since 3.0.0
	 *
	 * @global array $_wp_default_headers
	 */
	public function process_default_headers() {
		global $_wp_default_headers;

		if ( ! isset( $_wp_default_headers ) ) {
			return;
		}

		if ( ! empty( $this->default_headers ) ) {
			return;
		}

		$this->default_headers    = $_wp_default_headers;
		$template_directory_uri   = get_template_directory_uri();
		$stylesheet_directory_uri = get_stylesheet_directory_uri();

		foreach ( array_keys( $this->default_headers ) as $header ) {
			$this->default_headers[ $header ]['url'] = sprintf(
				$this->default_headers[ $header ]['url'],
				$template_directory_uri,
				$stylesheet_directory_uri
			);

			$this->default_headers[ $header ]['thumbnail_url'] = sprintf(
				$this->default_headers[ $header ]['thumbnail_url'],
				$template_directory_uri,
				$stylesheet_directory_uri
			);
		}
	}

	/**
	 * Display UI for selecting one of several default headers.
	 *
	 * Show the random image option if this theme has multiple header images.
	 * Random image option is on by default if no header has been set.
	 *
	 * @since 3.0.0
	 *
	 * @param string $type The header type. One of 'default' (for the Uploaded Images control)
	 *                     or 'uploaded' (for the Uploaded Images control).
	 */
	public function show_header_selector( $type = 'default' ) {
		if ( 'default' === $type ) {
			$headers = $this->default_headers;
		} else {
			$headers = get_uploaded_header_images();
			$type    = 'uploaded';
		}

		if ( 1 < count( $headers ) ) {
			echo '<div class="random-header">';
			echo '<label><input name="default-header" type="radio" value="random-' . $type . '-image"' . checked( is_random_header_image( $type ), true, false ) . ' />';
			_e( '<strong>Random:</strong> Show a different image on each page.' );
			echo '</label>';
			echo '</div>';
		}

		echo '<div class="available-headers">';

		foreach ( $headers as $header_key => $header ) {
			$header_thumbnail = $header['thumbnail_url'];
			$header_url       = $header['url'];
			$header_alt_text  = empty( $header['alt_text'] ) ? '' : $header['alt_text'];

			echo '<div class="default-header">';
			echo '<label><input name="default-header" type="radio" value="' . esc_attr( $header_key ) . '" ' . checked( $header_url, get_theme_mod( 'header_image' ), false ) . ' />';
			$width = '';
			if ( ! empty( $header['attachment_id'] ) ) {
				$width = ' width="230"';
			}
			echo '<img src="' . esc_url( set_url_scheme( $header_thumbnail ) ) . '" alt="' . esc_attr( $header_alt_text ) . '"' . $width . ' /></label>';
			echo '</div>';
		}

		echo '<div class="clear"></div></div>';
	}

	/**
	 * Execute JavaScript depending on step.
	 *
	 * @since 2.1.0
	 */
	public function js() {
		$step = $this->step();

		if ( ( 1 === $step || 3 === $step ) && current_theme_supports( 'custom-header', 'header-text' ) ) {
			$this->js_1();
		} elseif ( 2 === $step ) {
			$this->js_2();
		}
	}

	/**
	 * Display JavaScript based on Step 1 and 3.
	 *
	 * @since 2.6.0
	 */
	public function js_1() {
		$default_color = '';
		if ( current_theme_supports( 'custom-header', 'default-text-color' ) ) {
			$default_color = get_theme_support( 'custom-header', 'default-text-color' );
			if ( $default_color && false === strpos( $default_color, '#' ) ) {
				$default_color = '#' . $default_color;
			}
		}
		?><?php echo esc_js( $default_color ); ?><?php if ( ! display_header_text() ) : ?><?php endif; ?><?php
	}

	/**
	 * Display JavaScript based on Step 2.
	 *
	 * @since 2.6.0
	 */
	public function js_2() {

		?><?php echo absint( get_theme_support( 'custom-header', 'width' ) ); ?><?php echo absint( get_theme_support( 'custom-header', 'height' ) ); ?><?php
			if ( ! current_theme_supports( 'custom-header', 'flex-height' )
				&& ! current_theme_supports( 'custom-header', 'flex-width' )
			) {
				?><?php
			}
			if ( ! current_theme_supports( 'custom-header', 'flex-height' ) ) {
				?><?php echo get_theme_support( 'custom-header', 'height' ); ?><?php
			}
			if ( ! current_theme_supports( 'custom-header', 'flex-width' ) ) {
				?><?php echo get_theme_support( 'custom-header', 'width' ); ?><?php
			}
			?><?php
	}

	/**
	 * Display first step of custom header image page.
	 *
	 * @since 2.1.0
	 */
	public function step_1() {
		$this->process_default_headers();
		?><?php _e( 'Custom Header' ); ?><?php if ( current_user_can( 'customize' ) ) { ?><?php
			printf(
				/* translators: %s: URL to header image configuration in Customizer. */
				__( 'You can now manage and live-preview Custom Header in the <a href="%s">Customizer</a>.' ),
				admin_url( 'customize.php?autofocus[control]=header_image' )
			);
			?><?php } ?><?php if ( ! empty( $this->updated ) ) { ?><?php
			/* translators: %s: Home URL. */
			printf( __( 'Header updated. <a href="%s">Visit your site</a> to see how it looks.' ), esc_url( home_url( '/' ) ) );
			?><?php } ?><?php _e( 'Header Image' ); ?><?php if ( get_custom_header() || display_header_text() ) : ?><?php _e( 'Preview' ); ?><?php
			if ( $this->admin_image_div_callback ) {
				call_user_func( $this->admin_image_div_callback );
			} else {
				$custom_header = get_custom_header();
				$header_image  = get_header_image();

				if ( $header_image ) {
					$header_image_style = 'background-image:url(' . esc_url( $header_image ) . ');';
				} else {
					$header_image_style = '';
				}

				if ( $custom_header->width ) {
					$header_image_style .= 'max-width:' . $custom_header->width . 'px;';
				}
				if ( $custom_header->height ) {
					$header_image_style .= 'height:' . $custom_header->height . 'px;';
				}
				?><?php echo $header_image_style; ?><?php
				if ( display_header_text() ) {
					$style = ' style="color:#' . get_header_textcolor() . ';"';
				} else {
					$style = ' style="display:none;"';
				}
				?><?php echo $style; ?><?php bloginfo( 'url' ); ?><?php bloginfo( 'name' ); ?><?php echo $style; ?><?php bloginfo( 'description' ); ?><?php } ?><?php endif; ?><?php if ( current_user_can( 'upload_files' ) && current_theme_supports( 'custom-header', 'uploads' ) ) : ?><?php _e( 'Select Image' ); ?><?php _e( 'You can select an image to be shown at the top of your site by uploading from your computer or choosing from your media library. After selecting an image you will be able to crop it.' ); ?><?php
			if ( ! current_theme_supports( 'custom-header', 'flex-height' )
				&& ! current_theme_supports( 'custom-header', 'flex-width' )
			) {
				printf(
					/* translators: 1: Image width in pixels, 2: Image height in pixels. */
					__( 'Images of exactly <strong>%1$d &times; %2$d pixels</strong> will be used as-is.' ) . '<br />',
					get_theme_support( 'custom-header', 'width' ),
					get_theme_support( 'custom-header', 'height' )
				);
			} elseif ( current_theme_supports( 'custom-header', 'flex-height' ) ) {
				if ( ! current_theme_supports( 'custom-header', 'flex-width' ) ) {
					printf(
						/* translators: %s: Size in pixels. */
						__( 'Images should be at least %s wide.' ) . ' ',
						sprintf(
							/* translators: %d: Custom header width. */
							'<strong>' . __( '%d pixels' ) . '</strong>',
							get_theme_support( 'custom-header', 'width' )
						)
					);
				}
			} elseif ( current_theme_supports( 'custom-header', 'flex-width' ) ) {
				if ( ! current_theme_supports( 'custom-header', 'flex-height' ) ) {
					printf(
						/* translators: %s: Size in pixels. */
						__( 'Images should be at least %s tall.' ) . ' ',
						sprintf(
							/* translators: %d: Custom header height. */
							'<strong>' . __( '%d pixels' ) . '</strong>',
							get_theme_support( 'custom-header', 'height' )
						)
					);
				}
			}

			if ( current_theme_supports( 'custom-header', 'flex-height' )
				|| current_theme_supports( 'custom-header', 'flex-width' )
			) {
				if ( current_theme_supports( 'custom-header', 'width' ) ) {
					printf(
						/* translators: %s: Size in pixels. */
						__( 'Suggested width is %s.' ) . ' ',
						sprintf(
							/* translators: %d: Custom header width. */
							'<strong>' . __( '%d pixels' ) . '</strong>',
							get_theme_support( 'custom-header', 'width' )
						)
					);
				}

				if ( current_theme_supports( 'custom-header', 'height' ) ) {
					printf(
						/* translators: %s: Size in pixels. */
						__( 'Suggested height is %s.' ) . ' ',
						sprintf(
							/* translators: %d: Custom header height. */
							'<strong>' . __( '%d pixels' ) . '</strong>',
							get_theme_support( 'custom-header', 'height' )
						)
					);
				}
			}
			?><?php echo esc_url( add_query_arg( 'step', 2 ) ); ?><?php _e( 'Choose an image from your computer:' ); ?><?php wp_nonce_field( 'custom-header-upload', '_wpnonce-custom-header-upload' ); ?><?php submit_button( __( 'Upload' ), '', 'submit', false ); ?><?php
			$modal_update_href = add_query_arg(
				array(
					'page'                          => 'custom-header',
					'step'                          => 2,
					'_wpnonce-custom-header-upload' => wp_create_nonce( 'custom-header-upload' ),
				),
				admin_url( 'themes.php' )
			);
			?><?php _e( 'Or choose an image from your media library:' ); ?><?php echo esc_url( $modal_update_href ); ?><?php esc_attr_e( 'Choose a Custom Header' ); ?><?php esc_attr_e( 'Set as header' ); ?><?php _e( 'Choose Image' ); ?><?php endif; ?><?php echo esc_url( add_query_arg( 'step', 1 ) ); ?><?php submit_button( null, 'screen-reader-text', 'save-header-options', false ); ?><?php if ( get_uploaded_header_images() ) : ?><?php _e( 'Uploaded Images' ); ?><?php _e( 'You can choose one of your previously uploaded headers, or show a random one.' ); ?><?php
			$this->show_header_selector( 'uploaded' );
			?><?php
	endif;
		if ( ! empty( $this->default_headers ) ) :
			?><?php _e( 'Default Images' ); ?><?php if ( current_theme_supports( 'custom-header', 'uploads' ) ) : ?><?php _e( 'If you don&lsquo;t want to upload your own image, you can use one of these cool headers, or show a random one.' ); ?><?php else : ?><?php _e( 'You can use one of these cool headers or show a random one on each page.' ); ?><?php endif; ?><?php
			$this->show_header_selector( 'default' );
			?><?php
	endif;
		if ( get_header_image() ) :
			?><?php _e( 'Remove Image' ); ?><?php _e( 'This will remove the header image. You will not be able to restore any customizations.' ); ?><?php submit_button( __( 'Remove Header Image' ), '', 'removeheader', false ); ?><?php
	endif;

		$default_image = sprintf(
			get_theme_support( 'custom-header', 'default-image' ),
			get_template_directory_uri(),
			get_stylesheet_directory_uri()
		);

		if ( $default_image && get_header_image() !== $default_image ) :
			?><?php _e( 'Reset Image' ); ?><?php _e( 'This will restore the original header image. You will not be able to restore any customizations.' ); ?><?php submit_button( __( 'Restore Original Header Image' ), '', 'resetheader', false ); ?><?php endif; ?><?php if ( current_theme_supports( 'custom-header', 'header-text' ) ) : ?><?php _e( 'Header Text' ); ?><?php _e( 'Header Text' ); ?><?php checked( display_header_text() ); ?><?php _e( 'Show header text with your image.' ); ?><?php _e( 'Text Color' ); ?><?php
			$default_color = '';
			if ( current_theme_supports( 'custom-header', 'default-text-color' ) ) {
				$default_color = get_theme_support( 'custom-header', 'default-text-color' );
				if ( $default_color && false === strpos( $default_color, '#' ) ) {
					$default_color = '#' . $default_color;
				}
			}

			$default_color_attr = $default_color ? ' data-default-color="' . esc_attr( $default_color ) . '"' : '';

			$header_textcolor = display_header_text() ? get_header_textcolor() : get_theme_support( 'custom-header', 'default-text-color' );
			if ( $header_textcolor && false === strpos( $header_textcolor, '#' ) ) {
				$header_textcolor = '#' . $header_textcolor;
			}

			echo '<input type="text" name="text-color" id="text-color" value="' . esc_attr( $header_textcolor ) . '"' . $default_color_attr . ' />';
			if ( $default_color ) {
				/* translators: %s: Default text color. */
				echo ' <span class="description hide-if-js">' . sprintf( _x( 'Default: %s', 'color' ), esc_html( $default_color ) ) . '</span>';
			}
			?><?php
endif;

		/**
		 * Fires just before the submit button in the custom header options form.
		 *
		 * @since 3.1.0
		 */
		do_action( 'custom_header_options' );

		wp_nonce_field( 'custom-header-options', '_wpnonce-custom-header-options' );
		?><?php submit_button( null, 'primary', 'save-header-options' ); ?><?php
	}

	/**
	 * Display second step of custom header image page.
	 *
	 * @since 2.1.0
	 */
	public function step_2() {
		check_admin_referer( 'custom-header-upload', '_wpnonce-custom-header-upload' );

		if ( ! current_theme_supports( 'custom-header', 'uploads' ) ) {
			wp_die(
				'<h1>' . __( 'Something went wrong.' ) . '</h1>' .
				'<p>' . __( 'The active theme does not support uploading a custom header image.' ) . '</p>',
				403
			);
		}

		if ( empty( $_POST ) && isset( $_GET['file'] ) ) {
			$attachment_id = absint( $_GET['file'] );
			$file          = get_attached_file( $attachment_id, true );
			$url           = wp_get_attachment_image_src( $attachment_id, 'full' );
			$url           = $url[0];
		} elseif ( isset( $_POST ) ) {
			$data          = $this->step_2_manage_upload();
			$attachment_id = $data['attachment_id'];
			$file          = $data['file'];
			$url           = $data['url'];
		}

		if ( file_exists( $file ) ) {
			list( $width, $height, $type, $attr ) = wp_getimagesize( $file );
		} else {
			$data   = wp_get_attachment_metadata( $attachment_id );
			$height = isset( $data['height'] ) ? (int) $data['height'] : 0;
			$width  = isset( $data['width'] ) ? (int) $data['width'] : 0;
			unset( $data );
		}

		$max_width = 0;

		// For flex, limit size of image displayed to 1500px unless theme says otherwise.
		if ( current_theme_supports( 'custom-header', 'flex-width' ) ) {
			$max_width = 1500;
		}

		if ( current_theme_supports( 'custom-header', 'max-width' ) ) {
			$max_width = max( $max_width, get_theme_support( 'custom-header', 'max-width' ) );
		}

		$max_width = max( $max_width, get_theme_support( 'custom-header', 'width' ) );

		// If flexible height isn't supported and the image is the exact right size.
		if ( ! current_theme_supports( 'custom-header', 'flex-height' )
			&& ! current_theme_supports( 'custom-header', 'flex-width' )
			&& (int) get_theme_support( 'custom-header', 'width' ) === $width
			&& (int) get_theme_support( 'custom-header', 'height' ) === $height
		) {
			// Add the metadata.
			if ( file_exists( $file ) ) {
				wp_update_attachment_metadata( $attachment_id, wp_generate_attachment_metadata( $attachment_id, $file ) );
			}

			$this->set_header_image( compact( 'url', 'attachment_id', 'width', 'height' ) );

			/**
			 * Fires after the header image is set or an error is returned.
			 *
			 * @since 2.1.0
			 *
			 * @param string $file          Path to the file.
			 * @param int    $attachment_id Attachment ID.
			 */
			do_action( 'wp_create_file_in_uploads', $file, $attachment_id ); // For replication.

			return $this->finished();
		} elseif ( $width > $max_width ) {
			$oitar = $width / $max_width;

			$image = wp_crop_image(
				$attachment_id,
				0,
				0,
				$width,
				$height,
				$max_width,
				$height / $oitar,
				false,
				str_replace( wp_basename( $file ), 'midsize-' . wp_basename( $file ), $file )
			);

			if ( ! $image || is_wp_error( $image ) ) {
				wp_die( __( 'Image could not be processed. Please go back and try again.' ), __( 'Image Processing Error' ) );
			}

			/** This filter is documented in wp-admin/includes/class-custom-image-header.php */
			$image = apply_filters( 'wp_create_file_in_uploads', $image, $attachment_id ); // For replication.

			$url    = str_replace( wp_basename( $url ), wp_basename( $image ), $url );
			$width  = $width / $oitar;
			$height = $height / $oitar;
		} else {
			$oitar = 1;
		}
		?><?php _e( 'Crop Header Image' ); ?><?php echo esc_url( add_query_arg( 'step', 3 ) ); ?><?php _e( 'Choose the part of the image you want to use as your header.' ); ?><?php _e( 'You need JavaScript to choose a part of the image.' ); ?><?php echo esc_url( $url ); ?><?php echo $width; ?><?php echo $height; ?><?php echo esc_attr( $width ); ?><?php echo esc_attr( $height ); ?><?php echo esc_attr( $attachment_id ); ?><?php echo esc_attr( $oitar ); ?><?php if ( empty( $_POST ) && isset( $_GET['file'] ) ) { ?><?php } ?><?php wp_nonce_field( 'custom-header-crop-image' ); ?><?php submit_button( __( 'Crop and Publish' ), 'primary', 'submit', false ); ?><?php
		if ( isset( $oitar ) && 1 === $oitar
			&& ( current_theme_supports( 'custom-header', 'flex-height' )
				|| current_theme_supports( 'custom-header', 'flex-width' ) )
		) {
			submit_button( __( 'Skip Cropping, Publish Image as Is' ), '', 'skip-cropping', false );
		}
		?>