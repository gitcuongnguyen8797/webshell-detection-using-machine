<?php
/**
 * WP_Privacy_Policy_Content class.
 *
 * @package WordPress
 * @subpackage Administration
 * @since 4.9.6
 */

#[AllowDynamicProperties]
final class WP_Privacy_Policy_Content {

	private static $policy_content = array();

	/**
	 * Constructor
	 *
	 * @since 4.9.6
	 */
	private function __construct() {}

	/**
	 * Add content to the postbox shown when editing the privacy policy.
	 *
	 * Plugins and themes should suggest text for inclusion in the site's privacy policy.
	 * The suggested text should contain information about any functionality that affects user privacy,
	 * and will be shown in the Suggested Privacy Policy Content postbox.
	 *
	 * Intended for use from `wp_add_privacy_policy_content()`.
	 *
	 * @since 4.9.6
	 *
	 * @param string $plugin_name The name of the plugin or theme that is suggesting content for the site's privacy policy.
	 * @param string $policy_text The suggested content for inclusion in the policy.
	 */
	public static function add( $plugin_name, $policy_text ) {
		if ( empty( $plugin_name ) || empty( $policy_text ) ) {
			return;
		}

		$data = array(
			'plugin_name' => $plugin_name,
			'policy_text' => $policy_text,
		);

		if ( ! in_array( $data, self::$policy_content, true ) ) {
			self::$policy_content[] = $data;
		}
	}

	/**
	 * Quick check if any privacy info has changed.
	 *
	 * @since 4.9.6
	 */
	public static function text_change_check() {

		$policy_page_id = (int) get_option( 'wp_page_for_privacy_policy' );

		// The site doesn't have a privacy policy.
		if ( empty( $policy_page_id ) ) {
			return false;
		}

		if ( ! current_user_can( 'edit_post', $policy_page_id ) ) {
			return false;
		}

		$old = (array) get_post_meta( $policy_page_id, '_wp_suggested_privacy_policy_content' );

		// Updates are not relevant if the user has not reviewed any suggestions yet.
		if ( empty( $old ) ) {
			return false;
		}

		$cached = get_option( '_wp_suggested_policy_text_has_changed' );

		/*
		 * When this function is called before `admin_init`, `self::$policy_content`
		 * has not been populated yet, so use the cached result from the last
		 * execution instead.
		 */
		if ( ! did_action( 'admin_init' ) ) {
			return 'changed' === $cached;
		}

		$new = self::$policy_content;

		// Remove the extra values added to the meta.
		foreach ( $old as $key => $data ) {
			if ( ! is_array( $data ) || ! empty( $data['removed'] ) ) {
				unset( $old[ $key ] );
				continue;
			}

			$old[ $key ] = array(
				'plugin_name' => $data['plugin_name'],
				'policy_text' => $data['policy_text'],
			);
		}

		// Normalize the order of texts, to facilitate comparison.
		sort( $old );
		sort( $new );

		// The == operator (equal, not identical) was used intentionally.
		// See https://www.php.net/manual/en/language.operators.array.php
		if ( $new != $old ) {
			// A plugin was activated or deactivated, or some policy text has changed.
			// Show a notice on the relevant screens to inform the admin.
			add_action( 'admin_notices', array( 'WP_Privacy_Policy_Content', 'policy_text_changed_notice' ) );
			$state = 'changed';
		} else {
			$state = 'not-changed';
		}

		// Cache the result for use before `admin_init` (see above).
		if ( $cached !== $state ) {
			update_option( '_wp_suggested_policy_text_has_changed', $state );
		}

		return 'changed' === $state;
	}

	/**
	 * Output a warning when some privacy info has changed.
	 *
	 * @since 4.9.6
	 *
	 * @global WP_Post $post Global post object.
	 */
	public static function policy_text_changed_notice() {
		global $post;

		$screen = get_current_screen()->id;

		if ( 'privacy' !== $screen ) {
			return;
		}

		?><?php
				printf(
					/* translators: %s: Privacy Policy Guide URL. */
					__( 'The suggested privacy policy text has changed. Please <a href="%s">review the guide</a> and update your privacy policy.' ),
					esc_url( admin_url( 'privacy-policy-guide.php?tab=policyguide' ) )
				);
			?><?php
	}

	/**
	 * Update the cached policy info when the policy page is updated.
	 *
	 * @since 4.9.6
	 * @access private
	 *
	 * @param int $post_id The ID of the updated post.
	 */
	public static function _policy_page_updated( $post_id ) {
		$policy_page_id = (int) get_option( 'wp_page_for_privacy_policy' );

		if ( ! $policy_page_id || $policy_page_id !== (int) $post_id ) {
			return;
		}

		// Remove updated|removed status.
		$old          = (array) get_post_meta( $policy_page_id, '_wp_suggested_privacy_policy_content' );
		$done         = array();
		$update_cache = false;

		foreach ( $old as $old_key => $old_data ) {
			if ( ! empty( $old_data['removed'] ) ) {
				// Remove the old policy text.
				$update_cache = true;
				continue;
			}

			if ( ! empty( $old_data['updated'] ) ) {
				// 'updated' is now 'added'.
				$done[]       = array(
					'plugin_name' => $old_data['plugin_name'],
					'policy_text' => $old_data['policy_text'],
					'added'       => $old_data['updated'],
				);
				$update_cache = true;
			} else {
				$done[] = $old_data;
			}
		}

		if ( $update_cache ) {
			delete_post_meta( $policy_page_id, '_wp_suggested_privacy_policy_content' );
			// Update the cache.
			foreach ( $done as $data ) {
				add_post_meta( $policy_page_id, '_wp_suggested_privacy_policy_content', $data );
			}
		}
	}

	/**
	 * Check for updated, added or removed privacy policy information from plugins.
	 *
	 * Caches the current info in post_meta of the policy page.
	 *
	 * @since 4.9.6
	 *
	 * @return array The privacy policy text/information added by core and plugins.
	 */
	public static function get_suggested_policy_text() {
		$policy_page_id = (int) get_option( 'wp_page_for_privacy_policy' );
		$checked        = array();
		$time           = time();
		$update_cache   = false;
		$new            = self::$policy_content;
		$old            = array();

		if ( $policy_page_id ) {
			$old = (array) get_post_meta( $policy_page_id, '_wp_suggested_privacy_policy_content' );
		}

		// Check for no-changes and updates.
		foreach ( $new as $new_key => $new_data ) {
			foreach ( $old as $old_key => $old_data ) {
				$found = false;

				if ( $new_data['policy_text'] === $old_data['policy_text'] ) {
					// Use the new plugin name in case it was changed, translated, etc.
					if ( $old_data['plugin_name'] !== $new_data['plugin_name'] ) {
						$old_data['plugin_name'] = $new_data['plugin_name'];
						$update_cache            = true;
					}

					// A plugin was re-activated.
					if ( ! empty( $old_data['removed'] ) ) {
						unset( $old_data['removed'] );
						$old_data['added'] = $time;
						$update_cache      = true;
					}

					$checked[] = $old_data;
					$found     = true;
				} elseif ( $new_data['plugin_name'] === $old_data['plugin_name'] ) {
					// The info for the policy was updated.
					$checked[]    = array(
						'plugin_name' => $new_data['plugin_name'],
						'policy_text' => $new_data['policy_text'],
						'updated'     => $time,
					);
					$found        = true;
					$update_cache = true;
				}

				if ( $found ) {
					unset( $new[ $new_key ], $old[ $old_key ] );
					continue 2;
				}
			}
		}

		if ( ! empty( $new ) ) {
			// A plugin was activated.
			foreach ( $new as $new_data ) {
				if ( ! empty( $new_data['plugin_name'] ) && ! empty( $new_data['policy_text'] ) ) {
					$new_data['added'] = $time;
					$checked[]         = $new_data;
				}
			}
			$update_cache = true;
		}

		if ( ! empty( $old ) ) {
			// A plugin was deactivated.
			foreach ( $old as $old_data ) {
				if ( ! empty( $old_data['plugin_name'] ) && ! empty( $old_data['policy_text'] ) ) {
					$data = array(
						'plugin_name' => $old_data['plugin_name'],
						'policy_text' => $old_data['policy_text'],
						'removed'     => $time,
					);

					$checked[] = $data;
				}
			}
			$update_cache = true;
		}

		if ( $update_cache && $policy_page_id ) {
			delete_post_meta( $policy_page_id, '_wp_suggested_privacy_policy_content' );
			// Update the cache.
			foreach ( $checked as $data ) {
				add_post_meta( $policy_page_id, '_wp_suggested_privacy_policy_content', $data );
			}
		}

		return $checked;
	}

	/**
	 * Add a notice with a link to the guide when editing the privacy policy page.
	 *
	 * @since 4.9.6
	 * @since 5.0.0 The `$post` parameter was made optional.
	 *
	 * @global WP_Post $post Global post object.
	 *
	 * @param WP_Post|null $post The currently edited post. Default null.
	 */
	public static function notice( $post = null ) {
		if ( is_null( $post ) ) {
			global $post;
		} else {
			$post = get_post( $post );
		}

		if ( ! ( $post instanceof WP_Post ) ) {
			return;
		}

		if ( ! current_user_can( 'manage_privacy_options' ) ) {
			return;
		}

		$current_screen = get_current_screen();
		$policy_page_id = (int) get_option( 'wp_page_for_privacy_policy' );

		if ( 'post' !== $current_screen->base || $policy_page_id !== $post->ID ) {
			return;
		}

		$message = __( 'Need help putting together your new Privacy Policy page? Check out our guide for recommendations on what content to include, along with policies suggested by your plugins and theme.' );
		$url     = esc_url( admin_url( 'options-privacy.php?tab=policyguide' ) );
		$label   = __( 'View Privacy Policy Guide.' );

		if ( get_current_screen()->is_block_editor() ) {
			wp_enqueue_script( 'wp-notices' );
			$action = array(
				'url'   => $url,
				'label' => $label,
			);
			wp_add_inline_script(
				'wp-notices',
				sprintf(
					'wp.data.dispatch( "core/notices" ).createWarningNotice( "%s", { actions: [ %s ], isDismissible: false } )',
					$message,
					wp_json_encode( $action )
				),
				'after'
			);
		} else {
			?><?php
				echo $message;
				printf(
					' <a href="%s" target="_blank">%s <span class="screen-reader-text">%s</span></a>',
					$url,
					$label,
					/* translators: Hidden accessibility text. */
					__( '(opens in a new tab)' )
				);
				?><?php
		}
	}

	/**
	 * Output the privacy policy guide together with content from the theme and plugins.
	 *
	 * @since 4.9.6
	 */
	public static function privacy_policy_guide() {

		$content_array = self::get_suggested_policy_text();
		$content       = '';
		$date_format   = __( 'F j, Y' );

		foreach ( $content_array as $section ) {
			$class   = '';
			$meta    = '';
			$removed = '';

			if ( ! empty( $section['removed'] ) ) {
				$badge_class = ' red';
				$date        = date_i18n( $date_format, $section['removed'] );
				/* translators: %s: Date of plugin deactivation. */
				$badge_title = sprintf( __( 'Removed %s.' ), $date );

				/* translators: %s: Date of plugin deactivation. */
				$removed = __( 'You deactivated this plugin on %s and may no longer need this policy.' );
				$removed = '<div class="notice notice-info inline"><p>' . sprintf( $removed, $date ) . '</p></div>';
			} elseif ( ! empty( $section['updated'] ) ) {
				$badge_class = ' blue';
				$date        = date_i18n( $date_format, $section['updated'] );
				/* translators: %s: Date of privacy policy text update. */
				$badge_title = sprintf( __( 'Updated %s.' ), $date );
			}

			$plugin_name = esc_html( $section['plugin_name'] );

			$sanitized_policy_name = sanitize_title_with_dashes( $plugin_name );
			?><?php echo $sanitized_policy_name; ?><?php echo $plugin_name; ?><?php if ( ! empty( $section['removed'] ) || ! empty( $section['updated'] ) ) : ?><?php echo $badge_class; ?><?php echo $badge_title; ?><?php endif; ?><?php echo $sanitized_policy_name; ?><?php
				echo $removed;
				echo $section['policy_text'];
				?><?php if ( empty( $section['removed'] ) ) : ?><?php _e( 'Copied!' ); ?><?php _e( 'Copy suggested policy text to clipboard' ); ?><?php
							/* translators: Hidden accessibility text. %s: Plugin name. */
							printf( __( 'Copy suggested policy text from %s.' ), $plugin_name );
							?><?php endif; ?>