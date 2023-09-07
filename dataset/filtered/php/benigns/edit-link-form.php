<?php
/**
 * Edit links form for inclusion in administration panels.
 *
 * @package WordPress
 * @subpackage Administration
 */

// Don't load directly.
if ( ! defined( 'ABSPATH' ) ) {
	die( '-1' );
}

if ( ! empty( $link_id ) ) {
	/* translators: %s: URL to Links screen. */
	$heading      = sprintf( __( '<a href="%s">Links</a> / Edit Link' ), 'link-manager.php' );
	$submit_text  = __( 'Update Link' );
	$form_name    = 'editlink';
	$nonce_action = 'update-bookmark_' . $link_id;
} else {
	/* translators: %s: URL to Links screen. */
	$heading      = sprintf( __( '<a href="%s">Links</a> / Add New Link' ), 'link-manager.php' );
	$submit_text  = __( 'Add Link' );
	$form_name    = 'addlink';
	$nonce_action = 'add-bookmark';
}

require_once ABSPATH . 'wp-admin/includes/meta-boxes.php';

add_meta_box( 'linksubmitdiv', __( 'Save' ), 'link_submit_meta_box', null, 'side', 'core' );
add_meta_box( 'linkcategorydiv', __( 'Categories' ), 'link_categories_meta_box', null, 'normal', 'core' );
add_meta_box( 'linktargetdiv', __( 'Target' ), 'link_target_meta_box', null, 'normal', 'core' );
add_meta_box( 'linkxfndiv', __( 'Link Relationship (XFN)' ), 'link_xfn_meta_box', null, 'normal', 'core' );
add_meta_box( 'linkadvanceddiv', __( 'Advanced' ), 'link_advanced_meta_box', null, 'normal', 'core' );

/** This action is documented in wp-admin/includes/meta-boxes.php */
do_action( 'add_meta_boxes', 'link', $link );

/**
 * Fires when link-specific meta boxes are added.
 *
 * @since 3.0.0
 *
 * @param object $link Link object.
 */
do_action( 'add_meta_boxes_link', $link );

/** This action is documented in wp-admin/includes/meta-boxes.php */
do_action( 'do_meta_boxes', 'link', 'normal', $link );
/** This action is documented in wp-admin/includes/meta-boxes.php */
do_action( 'do_meta_boxes', 'link', 'advanced', $link );
/** This action is documented in wp-admin/includes/meta-boxes.php */
do_action( 'do_meta_boxes', 'link', 'side', $link );

add_screen_option(
	'layout_columns',
	array(
		'max'     => 2,
		'default' => 2,
	)
);

get_current_screen()->add_help_tab(
	array(
		'id'      => 'overview',
		'title'   => __( 'Overview' ),
		'content' =>
		'<p>' . __( 'You can add or edit links on this screen by entering information in each of the boxes. Only the link&#8217;s web address and name (the text you want to display on your site as the link) are required fields.' ) . '</p>' .
		'<p>' . __( 'The boxes for link name, web address, and description have fixed positions, while the others may be repositioned using drag and drop. You can also hide boxes you do not use in the Screen Options tab, or minimize boxes by clicking on the title bar of the box.' ) . '</p>' .
		'<p>' . __( 'XFN stands for <a href="https://gmpg.org/xfn/">XHTML Friends Network</a>, which is optional. WordPress allows the generation of XFN attributes to show how you are related to the authors/owners of the site to which you are linking.' ) . '</p>',
	)
);

get_current_screen()->set_help_sidebar(
	'<p><strong>' . __( 'For more information:' ) . '</strong></p>' .
	'<p>' . __( '<a href="https://codex.wordpress.org/Links_Add_New_Screen">Documentation on Creating Links</a>' ) . '</p>' .
	'<p>' . __( '<a href="https://wordpress.org/support/forums/">Support forums</a>' ) . '</p>'
);

require_once ABSPATH . 'wp-admin/admin-header.php';
?><?php
echo esc_html( $title );
?><?php echo esc_html_x( 'Add New', 'link' ); ?><?php if ( isset( $_GET['added'] ) ) : ?><?php _e( 'Link added.' ); ?><?php endif; ?><?php echo esc_attr( $form_name ); ?><?php echo esc_attr( $form_name ); ?><?php
if ( ! empty( $link_added ) ) {
	echo $link_added;
}

wp_nonce_field( $nonce_action );
wp_nonce_field( 'closedpostboxes', 'closedpostboxesnonce', false );
wp_nonce_field( 'meta-box-order', 'meta-box-order-nonce', false );
?><?php echo ( 1 === get_current_screen()->get_columns() ) ? '1' : '2'; ?><?php _ex( 'Name', 'link name' ); ?><?php echo esc_attr( $link->link_name ); ?><?php _e( 'Example: Nifty blogging software' ); ?><?php _e( 'Web Address' ); ?><?php echo esc_attr( $link->link_url ); ?><?php _e( 'Example: <code>https://wordpress.org/</code> &#8212; do not forget the <code>https://</code>' ); ?><?php _e( 'Description' ); ?><?php echo isset( $link->link_description ) ? esc_attr( $link->link_description ) : ''; ?><?php _e( 'This will be shown when someone hovers over the link in the blogroll, or optionally below the link.' ); ?><?php

/** This action is documented in wp-admin/includes/meta-boxes.php */
do_action( 'submitlink_box' );
$side_meta_boxes = do_meta_boxes( 'link', 'side', $link );

?><?php

do_meta_boxes( null, 'normal', $link );

do_meta_boxes( null, 'advanced', $link );

?><?php

if ( $link_id ) :
	?><?php echo (int) $link_id; ?><?php echo (int) $cat_id; ?><?php else : ?><?php endif; ?>