<?php
/**
 * Edit comment form for inclusion in another file.
 *
 * @package WordPress
 * @subpackage Administration
 */

// Don't load directly.
if ( ! defined( 'ABSPATH' ) ) {
	die( '-1' );
}

/**
 * @global WP_Comment $comment Global comment object.
 */
global $comment;
?><?php wp_nonce_field( 'update-comment_' . $comment->comment_ID ); ?><?php _e( 'Edit Comment' ); ?><?php echo esc_attr( $comment->comment_ID ); ?><?php echo esc_attr( $comment->comment_post_ID ); ?><?php
if ( 'approved' === wp_get_comment_status( $comment ) && $comment->comment_post_ID > 0 ) :
	$comment_link = get_comment_link( $comment );
	?><?php _ex( 'Permalink:', 'comment' ); ?><?php echo esc_url( $comment_link ); ?><?php echo esc_html( $comment_link ); ?><?php endif; ?><?php _e( 'Author' ); ?><?php
	/* translators: Hidden accessibility text. */
	_e( 'Comment Author' );
	?><?php _e( 'Name' ); ?><?php echo esc_attr( $comment->comment_author ); ?><?php _e( 'Email' ); ?><?php echo esc_attr( $comment->comment_author_email ); ?><?php _e( 'URL' ); ?><?php echo esc_attr( $comment->comment_author_url ); ?><?php
	/* translators: Hidden accessibility text. */
	_e( 'Comment' );
	?><?php
	$quicktags_settings = array( 'buttons' => 'strong,em,link,block,del,ins,img,ul,ol,li,code,close' );
	wp_editor(
		$comment->comment_content,
		'content',
		array(
			'media_buttons' => false,
			'tinymce'       => false,
			'quicktags'     => $quicktags_settings,
		)
	);
	wp_nonce_field( 'closedpostboxes', 'closedpostboxesnonce', false );
	?><?php _e( 'Save' ); ?><?php _e( 'Status:' ); ?><?php
switch ( $comment->comment_approved ) {
	case '1':
		_e( 'Approved' );
		break;
	case '0':
		_e( 'Pending' );
		break;
	case 'spam':
		_e( 'Spam' );
		break;
}
?><?php
	/* translators: Hidden accessibility text. */
	_e( 'Comment status' );
	?><?php checked( $comment->comment_approved, '1' ); ?><?php _ex( 'Approved', 'comment status' ); ?><?php checked( $comment->comment_approved, '0' ); ?><?php _ex( 'Pending', 'comment status' ); ?><?php checked( $comment->comment_approved, 'spam' ); ?><?php _ex( 'Spam', 'comment status' ); ?><?php
$submitted = sprintf(
	/* translators: 1: Comment date, 2: Comment time. */
	__( '%1$s at %2$s' ),
	/* translators: Publish box date format, see https://www.php.net/manual/datetime.format.php */
	date_i18n( _x( 'M j, Y', 'publish box date format' ), strtotime( $comment->comment_date ) ),
	/* translators: Publish box time format, see https://www.php.net/manual/datetime.format.php */
	date_i18n( _x( 'H:i', 'publish box time format' ), strtotime( $comment->comment_date ) )
);
?><?php
/* translators: %s: Comment date. */
printf( __( 'Submitted on: %s' ), '<b>' . $submitted . '</b>' );
?><?php _e( 'Edit' ); ?><?php
	/* translators: Hidden accessibility text. */
	_e( 'Edit date and time' );
	?><?php
	/* translators: Hidden accessibility text. */
	_e( 'Date and time' );
	?><?php
/**
 * @global string $action
 */
global $action;

touch_time( ( 'editcomment' === $action ), 0 );
?><?php
$post_id = $comment->comment_post_ID;
if ( current_user_can( 'edit_post', $post_id ) ) {
	$post_link  = "<a href='" . esc_url( get_edit_post_link( $post_id ) ) . "'>";
	$post_link .= esc_html( get_the_title( $post_id ) ) . '</a>';
} else {
	$post_link = esc_html( get_the_title( $post_id ) );
}
?><?php
	printf(
		/* translators: %s: Post link. */
		__( 'In response to: %s' ),
		'<b>' . $post_link . '</b>'
	);
	?><?php
if ( $comment->comment_parent ) :
	$parent = get_comment( $comment->comment_parent );
	if ( $parent ) :
		$parent_link = esc_url( get_comment_link( $parent ) );
		$name        = get_comment_author( $parent );
		?><?php
		printf(
			/* translators: %s: Comment link. */
			__( 'In reply to: %s' ),
			'<b><a href="' . $parent_link . '">' . $name . '</a></b>'
		);
		?><?php
endif;
endif;
?><?php
	/**
	 * Filters miscellaneous actions for the edit comment form sidebar.
	 *
	 * @since 4.3.0
	 *
	 * @param string     $html    Output HTML to display miscellaneous action.
	 * @param WP_Comment $comment Current comment object.
	 */
	echo apply_filters( 'edit_comment_misc_actions', '', $comment );
?><?php echo "<a class='submitdelete deletion' href='" . wp_nonce_url( 'comment.php?action=' . ( ! EMPTY_TRASH_DAYS ? 'deletecomment' : 'trashcomment' ) . "&amp;c=$comment->comment_ID&amp;_wp_original_http_referer=" . urlencode( wp_get_referer() ), 'delete-comment_' . $comment->comment_ID ) . "'>" . ( ! EMPTY_TRASH_DAYS ? __( 'Delete Permanently' ) : __( 'Move to Trash' ) ) . "</a>\n"; ?><?php submit_button( __( 'Update' ), 'primary large', 'save', false ); ?><?php
/** This action is documented in wp-admin/includes/meta-boxes.php */
do_action( 'add_meta_boxes', 'comment', $comment );

/**
 * Fires when comment-specific meta boxes are added.
 *
 * @since 3.0.0
 *
 * @param WP_Comment $comment Comment object.
 */
do_action( 'add_meta_boxes_comment', $comment );

do_meta_boxes( null, 'normal', $comment );

$referer = wp_get_referer();
?><?php echo esc_attr( $comment->comment_ID ); ?><?php echo esc_attr( $comment->comment_post_ID ); ?><?php echo $referer ? esc_url( $referer ) : ''; ?><?php wp_original_referer_field( true, 'previous' ); ?><?php if ( ! wp_is_mobile() ) : ?>