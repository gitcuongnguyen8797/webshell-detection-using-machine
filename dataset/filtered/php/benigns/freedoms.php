<?php
/**
 * Your Rights administration panel.
 *
 * @package WordPress
 * @subpackage Administration
 */

/** WordPress Administration Bootstrap */
require_once __DIR__ . '/admin.php';

// This file was used to also display the Privacy tab on the About screen from 4.9.6 until 5.3.0.
if ( isset( $_GET['privacy-notice'] ) ) {
	wp_redirect( admin_url( 'privacy.php' ), 301 );
	exit;
}

// Used in the HTML title tag.
$title = __( 'Freedoms' );

list( $display_version ) = explode( '-', get_bloginfo( 'version' ) );

require_once ABSPATH . 'wp-admin/admin-header.php';
?><?php _e( 'The Four Freedoms' ); ?><?php _e( 'WordPress is free and open source software' ); ?><?php esc_attr_e( 'Secondary menu' ); ?><?php _e( 'What&#8217;s New' ); ?><?php _e( 'Credits' ); ?><?php _e( 'Freedoms' ); ?><?php _e( 'Privacy' ); ?><?php
		printf(
			/* translators: %s: https://wordpress.org/about/license/ */
			__( 'WordPress comes with some awesome, worldview-changing rights courtesy of its <a href="%s">license</a>, the GPL.' ),
			__( 'https://wordpress.org/about/license/' )
		);
		?><?php echo esc_url( admin_url( 'images/freedom-1.svg?ver=6.1' ) ); ?><?php _e( 'The 1st Freedom' ); ?><?php _e( 'To run the program for any purpose.' ); ?><?php echo esc_url( admin_url( 'images/freedom-2.svg?ver=6.1' ) ); ?><?php _e( 'The 2nd Freedom' ); ?><?php _e( 'To study how the program works and change it to make it do what you wish.' ); ?><?php echo esc_url( admin_url( 'images/freedom-3.svg?ver=6.1' ) ); ?><?php _e( 'The 3rd Freedom' ); ?><?php _e( 'To redistribute.' ); ?><?php echo esc_url( admin_url( 'images/freedom-4.svg?ver=6.1' ) ); ?><?php _e( 'The 4th Freedom' ); ?><?php _e( 'To distribute copies of your modified versions to others.' ); ?><?php
			printf(
				/* translators: %s: https://wordpressfoundation.org/trademark-policy/ */
				__( 'WordPress grows when people like you tell their friends about it, and the thousands of businesses and services that are built on and around WordPress share that fact with their users. We are flattered every time someone spreads the good word, just make sure to <a href="%s">check out our trademark guidelines</a> first.' ),
				'https://wordpressfoundation.org/trademark-policy/'
			);
			?><?php
			$plugins_url = current_user_can( 'activate_plugins' ) ? admin_url( 'plugins.php' ) : __( 'https://wordpress.org/plugins/' );
			$themes_url  = current_user_can( 'switch_themes' ) ? admin_url( 'themes.php' ) : __( 'https://wordpress.org/themes/' );
			printf(
				/* translators: 1: URL to Plugins screen, 2: URL to Themes screen, 3: https://wordpress.org/about/license/ */
				__( 'Every plugin and theme in WordPress.org&#8217;s directory is 100%% GPL or a similarly free and compatible license, so you can feel safe finding <a href="%1$s">plugins</a> and <a href="%2$s">themes</a> there. If you get a plugin or theme from another source, make sure to <a href="%3$s">ask them if it&#8217;s GPL</a> first. If they do not respect the WordPress license, it is not recommended to use them.' ),
				$plugins_url,
				$themes_url,
				__( 'https://wordpress.org/about/license/' )
			);
			?><?php require_once ABSPATH . 'wp-admin/admin-footer.php'; ?>