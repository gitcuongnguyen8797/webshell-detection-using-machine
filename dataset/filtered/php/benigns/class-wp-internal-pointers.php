<?php
/**
 * Administration API: WP_Internal_Pointers class
 *
 * @package WordPress
 * @subpackage Administration
 * @since 4.4.0
 */

/**
 * Core class used to implement an internal admin pointers API.
 *
 * @since 3.3.0
 */
#[AllowDynamicProperties]
final class WP_Internal_Pointers {
	/**
	 * Initializes the new feature pointers.
	 *
	 * @since 3.3.0
	 *
	 * All pointers can be disabled using the following:
	 *     remove_action( 'admin_enqueue_scripts', array( 'WP_Internal_Pointers', 'enqueue_scripts' ) );
	 *
	 * Individual pointers (e.g. wp390_widgets) can be disabled using the following:
	 *
	 *    function yourprefix_remove_pointers() {
	 *        remove_action(
	 *            'admin_print_footer_scripts',
	 *            array( 'WP_Internal_Pointers', 'pointer_wp390_widgets' )
	 *        );
	 *    }
	 *    add_action( 'admin_enqueue_scripts', 'yourprefix_remove_pointers', 11 );
	 *
	 * @param string $hook_suffix The current admin page.
	 */
	public static function enqueue_scripts( $hook_suffix ) {
		/*
		 * Register feature pointers
		 *
		 * Format:
		 *     array(
		 *         hook_suffix => pointer callback
		 *     )
		 *
		 * Example:
		 *     array(
		 *         'themes.php' => 'wp390_widgets'
		 *     )
		 */
		$registered_pointers = array(
			// None currently.
		);

		// Check if screen related pointer is registered.
		if ( empty( $registered_pointers[ $hook_suffix ] ) ) {
			return;
		}

		$pointers = (array) $registered_pointers[ $hook_suffix ];

		/*
		 * Specify required capabilities for feature pointers
		 *
		 * Format:
		 *     array(
		 *         pointer callback => Array of required capabilities
		 *     )
		 *
		 * Example:
		 *     array(
		 *         'wp390_widgets' => array( 'edit_theme_options' )
		 *     )
		 */
		$caps_required = array(
			// None currently.
		);

		// Get dismissed pointers.
		$dismissed = explode( ',', (string) get_user_meta( get_current_user_id(), 'dismissed_wp_pointers', true ) );

		$got_pointers = false;
		foreach ( array_diff( $pointers, $dismissed ) as $pointer ) {
			if ( isset( $caps_required[ $pointer ] ) ) {
				foreach ( $caps_required[ $pointer ] as $cap ) {
					if ( ! current_user_can( $cap ) ) {
						continue 2;
					}
				}
			}

			// Bind pointer print function.
			add_action( 'admin_print_footer_scripts', array( 'WP_Internal_Pointers', 'pointer_' . $pointer ) );
			$got_pointers = true;
		}

		if ( ! $got_pointers ) {
			return;
		}

		// Add pointers script and style to queue.
		wp_enqueue_style( 'wp-pointer' );
		wp_enqueue_script( 'wp-pointer' );
	}

	/**
	 * Print the pointer JavaScript data.
	 *
	 * @since 3.3.0
	 *
	 * @param string $pointer_id The pointer ID.
	 * @param string $selector The HTML elements, on which the pointer should be attached.
	 * @param array  $args Arguments to be passed to the pointer JS (see wp-pointer.js).
	 */
	private static function print_js( $pointer_id, $selector, $args ) {
		if ( empty( $pointer_id ) || empty( $selector ) || empty( $args ) || empty( $args['content'] ) ) {
			return;
		}

		?><?php echo wp_json_encode( $args ); ?><?php echo $pointer_id; ?><?php echo $selector; ?>