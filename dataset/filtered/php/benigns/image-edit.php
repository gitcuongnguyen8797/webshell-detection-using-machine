<?php
/**
 * WordPress Image Editor
 *
 * @package WordPress
 * @subpackage Administration
 */

/**
 * Loads the WP image-editing interface.
 *
 * @since 2.9.0
 *
 * @param int          $post_id Attachment post ID.
 * @param false|object $msg     Optional. Message to display for image editor updates or errors.
 *                              Default false.
 */
function wp_image_editor( $post_id, $msg = false ) {
	$nonce     = wp_create_nonce( "image_editor-$post_id" );
	$meta      = wp_get_attachment_metadata( $post_id );
	$thumb     = image_get_intermediate_size( $post_id, 'thumbnail' );
	$sub_sizes = isset( $meta['sizes'] ) && is_array( $meta['sizes'] );
	$note      = '';

	if ( isset( $meta['width'], $meta['height'] ) ) {
		$big = max( $meta['width'], $meta['height'] );
	} else {
		die( __( 'Image data does not exist. Please re-upload the image.' ) );
	}

	$sizer = $big > 400 ? 400 / $big : 1;

	$backup_sizes = get_post_meta( $post_id, '_wp_attachment_backup_sizes', true );
	$can_restore  = false;
	if ( ! empty( $backup_sizes ) && isset( $backup_sizes['full-orig'], $meta['file'] ) ) {
		$can_restore = wp_basename( $meta['file'] ) !== $backup_sizes['full-orig']['file'];
	}

	if ( $msg ) {
		if ( isset( $msg->error ) ) {
			$note = "<div class='notice notice-error' tabindex='-1' role='alert'><p>$msg->error</p></div>";
		} elseif ( isset( $msg->msg ) ) {
			$note = "<div class='notice notice-success' tabindex='-1' role='alert'><p>$msg->msg</p></div>";
		}
	}
	$edit_custom_sizes = false;
	/**
	 * Filters whether custom sizes are available options for image editing.
	 *
	 * @since 6.0.0
	 *
	 * @param bool|string[] $edit_custom_sizes True if custom sizes can be edited or array of custom size names.
	 */
	$edit_custom_sizes = apply_filters( 'edit_custom_thumbnail_sizes', $edit_custom_sizes );
	?><?php echo $post_id; ?><?php echo $note; ?><?php echo "$post_id, '$nonce'"; ?><?php esc_html_e( 'Crop' ); ?><?php

			// On some setups GD library does not provide imagerotate() - Ticket #11536.
			if ( wp_image_editor_supports(
				array(
					'mime_type' => get_post_mime_type( $post_id ),
					'methods'   => array( 'rotate' ),
				)
			) ) {
				$note_no_rotate = '';
				?><?php echo "$post_id, '$nonce'"; ?><?php esc_html_e( 'Rotate left' ); ?><?php echo "$post_id, '$nonce'"; ?><?php esc_html_e( 'Rotate right' ); ?><?php
			} else {
				$note_no_rotate = '<p class="note-no-rotate"><em>' . __( 'Image rotation is not supported by your web host.' ) . '</em></p>';
				?><?php } ?><?php echo "$post_id, '$nonce'"; ?><?php esc_html_e( 'Flip vertical' ); ?><?php echo "$post_id, '$nonce'"; ?><?php esc_html_e( 'Flip horizontal' ); ?><?php echo $post_id; ?><?php echo "$post_id, '$nonce'"; ?><?php esc_html_e( 'Undo' ); ?><?php echo $post_id; ?><?php echo "$post_id, '$nonce'"; ?><?php esc_html_e( 'Redo' ); ?><?php echo $note_no_rotate; ?><?php echo $post_id; ?><?php echo $sizer; ?><?php echo $post_id; ?><?php echo $post_id; ?><?php echo $post_id; ?><?php echo $post_id; ?><?php echo isset( $meta['width'] ) ? $meta['width'] : 0; ?><?php echo $post_id; ?><?php echo isset( $meta['height'] ) ? $meta['height'] : 0; ?><?php echo $post_id; ?><?php echo $post_id; ?><?php echo $post_id; ?><?php echo esc_url( admin_url( 'admin-ajax.php', 'relative' ) ) . '?action=imgedit-preview&amp;_ajax_nonce=' . $nonce . '&amp;postid=' . $post_id . '&amp;rand=' . rand( 1, 99999 ); ?><?php echo $post_id; ?><?php esc_attr_e( 'Cancel' ); ?><?php echo "$post_id, '$nonce'"; ?><?php esc_attr_e( 'Save' ); ?><?php _e( 'Scale Image' ); ?><?php
			/* translators: Hidden accessibility text. */
			esc_html_e( 'Scale Image Help' );
			?><?php _e( 'You can proportionally scale the original image. For best results, scaling should be done before you crop, flip, or rotate. Images can only be scaled down, not up.' ); ?><?php if ( isset( $meta['width'], $meta['height'] ) ) : ?><?php
			printf(
				/* translators: %s: Image width and height in pixels. */
				__( 'Original dimensions %s' ),
				'<span class="imgedit-original-dimensions">' . $meta['width'] . ' &times; ' . $meta['height'] . '</span>'
			);
			?><?php endif; ?><?php _e( 'New dimensions:' ); ?><?php echo $post_id; ?><?php
			/* translators: Hidden accessibility text. */
			_e( 'scale width' );
			?><?php echo $post_id; ?><?php echo $post_id; ?><?php echo $post_id; ?><?php echo isset( $meta['width'] ) ? $meta['width'] : 0; ?><?php echo $post_id; ?><?php
			/* translators: Hidden accessibility text. */
			_e( 'scale height' );
			?><?php echo $post_id; ?><?php echo $post_id; ?><?php echo $post_id; ?><?php echo isset( $meta['height'] ) ? $meta['height'] : 0; ?><?php echo $post_id; ?><?php echo "$post_id, '$nonce'"; ?><?php esc_attr_e( 'Scale' ); ?><?php if ( $can_restore ) { ?><?php _e( 'Restore original image' ); ?><?php
			_e( 'Discard any changes and restore the original image.' );

			if ( ! defined( 'IMAGE_EDIT_OVERWRITE' ) || ! IMAGE_EDIT_OVERWRITE ) {
				echo ' ' . __( 'Previously edited copies of the image will not be deleted.' );
			}
			?><?php echo "$post_id, '$nonce'"; ?><?php esc_attr_e( 'Restore image' ); ?><?php echo $can_restore; ?><?php } ?><?php _e( 'Image Crop' ); ?><?php
			/* translators: Hidden accessibility text. */
			esc_html_e( 'Image Crop Help' );
			?><?php _e( 'To crop the image, click on it and drag to make your selection.' ); ?><?php _e( 'Crop Aspect Ratio' ); ?><?php _e( 'The aspect ratio is the relationship between the width and height. You can preserve the aspect ratio by holding down the shift key while resizing your selection. Use the input box to specify the aspect ratio, e.g. 1:1 (square), 4:3, 16:9, etc.' ); ?><?php _e( 'Crop Selection' ); ?><?php _e( 'Once you have made your selection, you can adjust it by entering the size in pixels. The minimum selection size is the thumbnail size as set in the Media settings.' ); ?><?php _e( 'Aspect ratio:' ); ?><?php echo $post_id; ?><?php
			/* translators: Hidden accessibility text. */
			_e( 'crop ratio width' );
			?><?php echo $post_id; ?><?php echo $post_id; ?><?php echo $post_id; ?><?php echo $post_id; ?><?php
			/* translators: Hidden accessibility text. */
			_e( 'crop ratio height' );
			?><?php echo $post_id; ?><?php echo $post_id; ?><?php echo $post_id; ?><?php echo $post_id; ?><?php _e( 'Selection:' ); ?><?php echo $post_id; ?><?php
			/* translators: Hidden accessibility text. */
			_e( 'selection width' );
			?><?php echo $post_id; ?><?php echo $post_id; ?><?php echo $post_id; ?><?php echo $post_id; ?><?php
			/* translators: Hidden accessibility text. */
			_e( 'selection height' );
			?><?php echo $post_id; ?><?php echo $post_id; ?><?php echo $post_id; ?><?php
	if ( $thumb && $sub_sizes ) {
		$thumb_img = wp_constrain_dimensions( $thumb['width'], $thumb['height'], 160, 120 );
		?><?php _e( 'Thumbnail Settings' ); ?><?php
			/* translators: Hidden accessibility text. */
			esc_html_e( 'Thumbnail Settings Help' );
			?><?php _e( 'You can edit the image while preserving the thumbnail. For example, you may wish to have a square thumbnail that displays just a section of the image.' ); ?><?php echo $thumb['url']; ?><?php echo $thumb_img[0]; ?><?php echo $thumb_img[1]; ?><?php _e( 'Current thumbnail' ); ?><?php echo $post_id; ?><?php _e( 'Apply changes to:' ); ?><?php echo $post_id; ?><?php _e( 'All image sizes' ); ?><?php echo $post_id; ?><?php _e( 'Thumbnail' ); ?><?php echo $post_id; ?><?php _e( 'All sizes except thumbnail' ); ?><?php
		if ( $edit_custom_sizes ) {
			if ( ! is_array( $edit_custom_sizes ) ) {
				$edit_custom_sizes = get_intermediate_image_sizes();
			}
			foreach ( array_unique( $edit_custom_sizes ) as $key => $size ) {
				if ( array_key_exists( $size, $meta['sizes'] ) ) {
					if ( 'thumbnail' === $size ) {
						continue;
					}
					?><?php echo esc_attr( $key ); ?><?php echo $post_id; ?><?php echo esc_attr( $size ); ?><?php echo esc_attr( $key ); ?><?php echo esc_html( $size ); ?><?php
				}
			}
		}
		?><?php } ?><?php echo $post_id; ?><?php echo $post_id; ?><?php _e( "There are unsaved changes that will be lost. 'OK' to continue, 'Cancel' to return to the Image Editor." ); ?>