<?php
/**
 * Server-side file upload handler from wp-plupload or other asynchronous upload methods.
 *
 * @package WordPress
 * @subpackage Administration
 */

if ( isset( $_REQUEST['action'] ) && 'upload-attachment' === $_REQUEST['action'] ) {
	define( 'DOING_AJAX', true );
}

if ( ! defined( 'WP_ADMIN' ) ) {
	define( 'WP_ADMIN', true );
}

if ( defined( 'ABSPATH' ) ) {
	require_once ABSPATH . 'wp-load.php';
} else {
	require_once dirname( __DIR__ ) . '/wp-load.php';
}

require_once ABSPATH . 'wp-admin/admin.php';

header( 'Content-Type: text/plain; charset=' . get_option( 'blog_charset' ) );

if ( isset( $_REQUEST['action'] ) && 'upload-attachment' === $_REQUEST['action'] ) {
	require ABSPATH . 'wp-admin/includes/ajax-actions.php';

	send_nosniff_header();
	nocache_headers();

	wp_ajax_upload_attachment();
	die( '0' );
}

if ( ! current_user_can( 'upload_files' ) ) {
	wp_die( __( 'Sorry, you are not allowed to upload files.' ) );
}

// Just fetch the detail form for that attachment.
if ( isset( $_REQUEST['attachment_id'] ) && (int) $_REQUEST['attachment_id'] && $_REQUEST['fetch'] ) {
	$id   = (int) $_REQUEST['attachment_id'];
	$post = get_post( $id );
	if ( 'attachment' !== $post->post_type ) {
		wp_die( __( 'Invalid post type.' ) );
	}

	switch ( $_REQUEST['fetch'] ) {
		case 3:
			?><?php
					$thumb_url = wp_get_attachment_image_src( $id, 'thumbnail', true );
					if ( $thumb_url ) {
						echo '<img class="pinkynail" src="' . esc_url( $thumb_url[0] ) . '" alt="" />';
					}

					// Title shouldn't ever be empty, but use filename just in case.
					$file     = get_attached_file( $post->ID );
					$file_url = wp_get_attachment_url( $post->ID );
					$title    = $post->post_title ? $post->post_title : wp_basename( $file );
					?><?php echo esc_html( wp_html_excerpt( $title, 60, '&hellip;' ) ); ?><?php echo wp_basename( $file ); ?><?php echo $file_url; ?><?php _e( 'Copy URL to clipboard' ); ?><?php _e( 'Copied!' ); ?><?php
					if ( current_user_can( 'edit_post', $id ) ) {
						echo '<a class="edit-attachment" href="' . esc_url( get_edit_post_link( $id ) ) . '">' . _x( 'Edit', 'media item' ) . '</a>';
					} else {
						echo '<span class="edit-attachment">' . _x( 'Success', 'media item' ) . '</span>';
					}
					?>