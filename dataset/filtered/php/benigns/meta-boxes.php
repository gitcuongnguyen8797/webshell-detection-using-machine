<?php
/**
 * WordPress Administration Meta Boxes API.
 *
 * @package WordPress
 * @subpackage Administration
 */

//
// Post-related Meta Boxes.
//

/**
 * Displays post submit form fields.
 *
 * @since 2.7.0
 *
 * @global string $action
 *
 * @param WP_Post $post Current post object.
 * @param array   $args {
 *     Array of arguments for building the post submit meta box.
 *
 *     @type string   $id       Meta box 'id' attribute.
 *     @type string   $title    Meta box title.
 *     @type callable $callback Meta box display callback.
 *     @type array    $args     Extra meta box arguments.
 * }
 */
function post_submit_meta_box( $post, $args = array() ) {
	global $action;

	$post_id          = (int) $post->ID;
	$post_type        = $post->post_type;
	$post_type_object = get_post_type_object( $post_type );
	$can_publish      = current_user_can( $post_type_object->cap->publish_posts );
	?><?php // Hidden submit button early on so that the browser chooses the right button when form is submitted with Return key. ?><?php submit_button( __( 'Save' ), '', 'save' ); ?><?php
			if ( ! in_array( $post->post_status, array( 'publish', 'future', 'pending' ), true ) ) {
				$private_style = '';
				if ( 'private' === $post->post_status ) {
					$private_style = 'style="display:none"';
				}
				?><?php echo $private_style; ?><?php esc_attr_e( 'Save Draft' ); ?><?php } elseif ( 'pending' === $post->post_status && $can_publish ) { ?><?php esc_attr_e( 'Save as Pending' ); ?><?php } ?><?php
		if ( is_post_type_viewable( $post_type_object ) ) :
			?><?php
				$preview_link = esc_url( get_preview_post_link( $post ) );
				if ( 'publish' === $post->post_status ) {
					$preview_button_text = __( 'Preview Changes' );
				} else {
					$preview_button_text = __( 'Preview' );
				}

				$preview_button = sprintf(
					'%1$s<span class="screen-reader-text"> %2$s</span>',
					$preview_button_text,
					/* translators: Hidden accessibility text. */
					__( '(opens in a new tab)' )
				);
				?><?php echo $preview_link; ?><?php echo $post_id; ?><?php echo $preview_button; ?><?php
		endif;

		/**
		 * Fires after the Save Draft (or Save as Pending) and Preview (or Preview Changes) buttons
		 * in the Publish meta box.
		 *
		 * @since 4.4.0
		 *
		 * @param WP_Post $post WP_Post object for the current post.
		 */
		do_action( 'post_submitbox_minor_actions', $post );
		?><?php _e( 'Status:' ); ?><?php
				switch ( $post->post_status ) {
					case 'private':
						_e( 'Privately Published' );
						break;
					case 'publish':
						_e( 'Published' );
						break;
					case 'future':
						_e( 'Scheduled' );
						break;
					case 'pending':
						_e( 'Pending Review' );
						break;
					case 'draft':
					case 'auto-draft':
						_e( 'Draft' );
						break;
				}
				?><?php
			if ( 'publish' === $post->post_status || 'private' === $post->post_status || $can_publish ) {
				$private_style = '';
				if ( 'private' === $post->post_status ) {
					$private_style = 'style="display:none"';
				}
				?><?php echo $private_style; ?><?php _e( 'Edit' ); ?><?php
					/* translators: Hidden accessibility text. */
					_e( 'Edit status' );
					?><?php echo esc_attr( ( 'auto-draft' === $post->post_status ) ? 'draft' : $post->post_status ); ?><?php
						/* translators: Hidden accessibility text. */
						_e( 'Set status' );
						?><?php if ( 'publish' === $post->post_status ) : ?><?php selected( $post->post_status, 'publish' ); ?><?php _e( 'Published' ); ?><?php elseif ( 'private' === $post->post_status ) : ?><?php selected( $post->post_status, 'private' ); ?><?php _e( 'Privately Published' ); ?><?php elseif ( 'future' === $post->post_status ) : ?><?php selected( $post->post_status, 'future' ); ?><?php _e( 'Scheduled' ); ?><?php endif; ?><?php selected( $post->post_status, 'pending' ); ?><?php _e( 'Pending Review' ); ?><?php if ( 'auto-draft' === $post->post_status ) : ?><?php selected( $post->post_status, 'auto-draft' ); ?><?php _e( 'Draft' ); ?><?php else : ?><?php selected( $post->post_status, 'draft' ); ?><?php _e( 'Draft' ); ?><?php endif; ?><?php _e( 'OK' ); ?><?php _e( 'Cancel' ); ?><?php
			}
			?><?php _e( 'Visibility:' ); ?><?php
				if ( 'private' === $post->post_status ) {
					$post->post_password = '';
					$visibility          = 'private';
					$visibility_trans    = __( 'Private' );
				} elseif ( ! empty( $post->post_password ) ) {
					$visibility       = 'password';
					$visibility_trans = __( 'Password protected' );
				} elseif ( 'post' === $post_type && is_sticky( $post_id ) ) {
					$visibility       = 'public';
					$visibility_trans = __( 'Public, Sticky' );
				} else {
					$visibility       = 'public';
					$visibility_trans = __( 'Public' );
				}

				echo esc_html( $visibility_trans );
				?><?php if ( $can_publish ) { ?><?php _e( 'Edit' ); ?><?php
					/* translators: Hidden accessibility text. */
					_e( 'Edit visibility' );
					?><?php echo esc_attr( $post->post_password ); ?><?php if ( 'post' === $post_type ) : ?><?php checked( is_sticky( $post_id ) ); ?><?php endif; ?><?php echo esc_attr( $visibility ); ?><?php checked( $visibility, 'public' ); ?><?php _e( 'Public' ); ?><?php if ( 'post' === $post_type && current_user_can( 'edit_others_posts' ) ) : ?><?php checked( is_sticky( $post_id ) ); ?><?php _e( 'Stick this post to the front page' ); ?><?php endif; ?><?php checked( $visibility, 'password' ); ?><?php _e( 'Password protected' ); ?><?php _e( 'Password:' ); ?><?php echo esc_attr( $post->post_password ); ?><?php checked( $visibility, 'private' ); ?><?php _e( 'Private' ); ?><?php _e( 'OK' ); ?><?php _e( 'Cancel' ); ?><?php } ?><?php
		/* translators: Publish box date string. 1: Date, 2: Time. See https://www.php.net/manual/datetime.format.php */
		$date_string = __( '%1$s at %2$s' );
		/* translators: Publish box date format, see https://www.php.net/manual/datetime.format.php */
		$date_format = _x( 'M j, Y', 'publish box date format' );
		/* translators: Publish box time format, see https://www.php.net/manual/datetime.format.php */
		$time_format = _x( 'H:i', 'publish box time format' );

		if ( 0 !== $post_id ) {
			if ( 'future' === $post->post_status ) { // Scheduled for publishing at a future date.
				/* translators: Post date information. %s: Date on which the post is currently scheduled to be published. */
				$stamp = __( 'Scheduled for: %s' );
			} elseif ( 'publish' === $post->post_status || 'private' === $post->post_status ) { // Already published.
				/* translators: Post date information. %s: Date on which the post was published. */
				$stamp = __( 'Published on: %s' );
			} elseif ( '0000-00-00 00:00:00' === $post->post_date_gmt ) { // Draft, 1 or more saves, no date specified.
				$stamp = __( 'Publish <b>immediately</b>' );
			} elseif ( time() < strtotime( $post->post_date_gmt . ' +0000' ) ) { // Draft, 1 or more saves, future date specified.
				/* translators: Post date information. %s: Date on which the post is to be published. */
				$stamp = __( 'Schedule for: %s' );
			} else { // Draft, 1 or more saves, date specified.
				/* translators: Post date information. %s: Date on which the post is to be published. */
				$stamp = __( 'Publish on: %s' );
			}
			$date = sprintf(
				$date_string,
				date_i18n( $date_format, strtotime( $post->post_date ) ),
				date_i18n( $time_format, strtotime( $post->post_date ) )
			);
		} else { // Draft (no saves, and thus no date specified).
			$stamp = __( 'Publish <b>immediately</b>' );
			$date  = sprintf(
				$date_string,
				date_i18n( $date_format, strtotime( current_time( 'mysql' ) ) ),
				date_i18n( $time_format, strtotime( current_time( 'mysql' ) ) )
			);
		}

		if ( ! empty( $args['args']['revisions_count'] ) ) :
			?><?php
				/* translators: Post revisions heading. %s: The number of available revisions. */
				printf( __( 'Revisions: %s' ), '<b>' . number_format_i18n( $args['args']['revisions_count'] ) . '</b>' );
				?><?php echo esc_url( get_edit_post_link( $args['args']['revision_id'] ) ); ?><?php _ex( 'Browse', 'revisions' ); ?><?php
					/* translators: Hidden accessibility text. */
					_e( 'Browse revisions' );
					?><?php
		endif;

		if ( $can_publish ) : // Contributors don't get to choose the date of publish.
			?><?php printf( $stamp, '<b>' . $date . '</b>' ); ?><?php _e( 'Edit' ); ?><?php
						/* translators: Hidden accessibility text. */
						_e( 'Edit date and time' );
						?><?php
						/* translators: Hidden accessibility text. */
						_e( 'Date and time' );
						?><?php touch_time( ( 'edit' === $action ), 1 ); ?><?php
		endif;

		if ( 'draft' === $post->post_status && get_post_meta( $post_id, '_customize_changeset_uuid', true ) ) :
			?><?php
					printf(
						/* translators: %s: URL to the Customizer. */
						__( 'This draft comes from your <a href="%s">unpublished customization changes</a>. You can edit, but there is no need to publish now. It will be published automatically with those changes.' ),
						esc_url(
							add_query_arg(
								'changeset_uuid',
								rawurlencode( get_post_meta( $post_id, '_customize_changeset_uuid', true ) ),
								admin_url( 'customize.php' )
							)
						)
					);
					?><?php
		endif;

		/**
		 * Fires after the post time/date setting in the Publish meta box.
		 *
		 * @since 2.9.0
		 * @since 4.4.0 Added the `$post` parameter.
		 *
		 * @param WP_Post $post WP_Post object for the current post.
		 */
		do_action( 'post_submitbox_misc_actions', $post );
		?><?php
	/**
	 * Fires at the beginning of the publishing actions section of the Publish meta box.
	 *
	 * @since 2.7.0
	 * @since 4.9.0 Added the `$post` parameter.
	 *
	 * @param WP_Post|null $post WP_Post object for the current post on Edit Post screen,
	 *                           null on Edit Link screen.
	 */
	do_action( 'post_submitbox_start', $post );
	?><?php
		if ( current_user_can( 'delete_post', $post_id ) ) {
			if ( ! EMPTY_TRASH_DAYS ) {
				$delete_text = __( 'Delete permanently' );
			} else {
				$delete_text = __( 'Move to Trash' );
			}
			?><?php echo get_delete_post_link( $post_id ); ?><?php echo $delete_text; ?><?php
		}
		?><?php
		if ( ! in_array( $post->post_status, array( 'publish', 'future', 'private' ), true ) || 0 === $post_id ) {
			if ( $can_publish ) :
				if ( ! empty( $post->post_date_gmt ) && time() < strtotime( $post->post_date_gmt . ' +0000' ) ) :
					?><?php echo esc_attr_x( 'Schedule', 'post action/button label' ); ?><?php submit_button( _x( 'Schedule', 'post action/button label' ), 'primary large', 'publish', false ); ?><?php
				else :
					?><?php esc_attr_e( 'Publish' ); ?><?php submit_button( __( 'Publish' ), 'primary large', 'publish', false ); ?><?php
				endif;
			else :
				?><?php esc_attr_e( 'Submit for Review' ); ?><?php submit_button( __( 'Submit for Review' ), 'primary large', 'publish', false ); ?><?php
			endif;
		} else {
			?><?php esc_attr_e( 'Update' ); ?><?php submit_button( __( 'Update' ), 'primary large', 'save', false, array( 'id' => 'publish' ) ); ?><?php
		}
		?><?php
}

/**
 * Displays attachment submit form fields.
 *
 * @since 3.5.0
 *
 * @param WP_Post $post Current post object.
 */
function attachment_submit_meta_box( $post ) {
	?><?php // Hidden submit button early on so that the browser chooses the right button when form is submitted with Return key. ?><?php submit_button( __( 'Save' ), '', 'save' ); ?><?php
			$uploaded_on = sprintf(
				/* translators: Publish box date string. 1: Date, 2: Time. See https://www.php.net/manual/datetime.format.php */
				__( '%1$s at %2$s' ),
				/* translators: Publish box date format, see https://www.php.net/manual/datetime.format.php */
				date_i18n( _x( 'M j, Y', 'publish box date format' ), strtotime( $post->post_date ) ),
				/* translators: Publish box time format, see https://www.php.net/manual/datetime.format.php */
				date_i18n( _x( 'H:i', 'publish box time format' ), strtotime( $post->post_date ) )
			);
			/* translators: Attachment information. %s: Date the attachment was uploaded. */
			printf( __( 'Uploaded on: %s' ), '<b>' . $uploaded_on . '</b>' );
			?><?php
	/**
	 * Fires after the 'Uploaded on' section of the Save meta box
	 * in the attachment editing screen.
	 *
	 * @since 3.5.0
	 * @since 4.9.0 Added the `$post` parameter.
	 *
	 * @param WP_Post $post WP_Post object for the current attachment.
	 */
	do_action( 'attachment_submitbox_misc_actions', $post );
	?><?php
	if ( current_user_can( 'delete_post', $post->ID ) ) {
		if ( EMPTY_TRASH_DAYS && MEDIA_TRASH ) {
			echo "<a class='submitdelete deletion' href='" . get_delete_post_link( $post->ID ) . "'>" . __( 'Move to Trash' ) . '</a>';
		} else {
			$delete_ays = ! MEDIA_TRASH ? " onclick='return showNotice.warn();'" : '';
			echo "<a class='submitdelete deletion'$delete_ays href='" . get_delete_post_link( $post->ID, '', true ) . "'>" . __( 'Delete permanently' ) . '</a>';
		}
	}
	?><?php esc_attr_e( 'Update' ); ?><?php esc_attr_e( 'Update' ); ?><?php
}

/**
 * Displays post format form elements.
 *
 * @since 3.1.0
 *
 * @param WP_Post $post Current post object.
 * @param array   $box {
 *     Post formats meta box arguments.
 *
 *     @type string   $id       Meta box 'id' attribute.
 *     @type string   $title    Meta box title.
 *     @type callable $callback Meta box display callback.
 *     @type array    $args     Extra meta box arguments.
 * }
 */
function post_format_meta_box( $post, $box ) {
	if ( current_theme_supports( 'post-formats' ) && post_type_supports( $post->post_type, 'post-formats' ) ) :
		$post_formats = get_theme_support( 'post-formats' );

		if ( is_array( $post_formats[0] ) ) :
			$post_format = get_post_format( $post->ID );
			if ( ! $post_format ) {
				$post_format = '0';
			}
			// Add in the current one if it isn't there yet, in case the active theme doesn't support it.
			if ( $post_format && ! in_array( $post_format, $post_formats[0], true ) ) {
				$post_formats[0][] = $post_format;
			}
			?><?php
				/* translators: Hidden accessibility text. */
				_e( 'Post Formats' );
				?><?php checked( $post_format, '0' ); ?><?php echo get_post_format_string( 'standard' ); ?><?php foreach ( $post_formats[0] as $format ) : ?><?php echo esc_attr( $format ); ?><?php echo esc_attr( $format ); ?><?php checked( $post_format, $format ); ?><?php echo esc_attr( $format ); ?><?php echo esc_attr( $format ); ?><?php echo esc_html( get_post_format_string( $format ) ); ?><?php endforeach; ?><?php
	endif;
endif;
}

/**
 * Displays post tags form fields.
 *
 * @since 2.6.0
 *
 * @todo Create taxonomy-agnostic wrapper for this.
 *
 * @param WP_Post $post Current post object.
 * @param array   $box {
 *     Tags meta box arguments.
 *
 *     @type string   $id       Meta box 'id' attribute.
 *     @type string   $title    Meta box title.
 *     @type callable $callback Meta box display callback.
 *     @type array    $args {
 *         Extra meta box arguments.
 *
 *         @type string $taxonomy Taxonomy. Default 'post_tag'.
 *     }
 * }
 */
function post_tags_meta_box( $post, $box ) {
	$defaults = array( 'taxonomy' => 'post_tag' );
	if ( ! isset( $box['args'] ) || ! is_array( $box['args'] ) ) {
		$args = array();
	} else {
		$args = $box['args'];
	}
	$parsed_args           = wp_parse_args( $args, $defaults );
	$tax_name              = esc_attr( $parsed_args['taxonomy'] );
	$taxonomy              = get_taxonomy( $parsed_args['taxonomy'] );
	$user_can_assign_terms = current_user_can( $taxonomy->cap->assign_terms );
	$comma                 = _x( ',', 'tag delimiter' );
	$terms_to_edit         = get_terms_to_edit( $post->ID, $tax_name );
	if ( ! is_string( $terms_to_edit ) ) {
		$terms_to_edit = '';
	}
	?><?php echo $tax_name; ?><?php echo $tax_name; ?><?php echo $taxonomy->labels->add_or_remove_items; ?><?php echo "tax_input[$tax_name]"; ?><?php echo $tax_name; ?><?php disabled( ! $user_can_assign_terms ); ?><?php echo $tax_name; ?><?php echo str_replace( ',', $comma . ' ', $terms_to_edit ); // textarea_escaped by esc_attr() ?><?php if ( $user_can_assign_terms ) : ?><?php echo $tax_name; ?><?php echo $taxonomy->labels->add_new_item; ?><?php echo $tax_name; ?><?php echo $tax_name; ?><?php echo $tax_name; ?><?php echo $tax_name; ?><?php esc_attr_e( 'Add' ); ?><?php echo $tax_name; ?><?php echo $taxonomy->labels->separate_items_with_commas; ?><?php elseif ( empty( $terms_to_edit ) ) : ?><?php echo $taxonomy->labels->no_terms; ?><?php endif; ?><?php if ( $user_can_assign_terms ) : ?><?php echo $tax_name; ?><?php echo $taxonomy->labels->choose_from_most_used; ?><?php endif; ?><?php
}

/**
 * Displays post categories form fields.
 *
 * @since 2.6.0
 *
 * @todo Create taxonomy-agnostic wrapper for this.
 *
 * @param WP_Post $post Current post object.
 * @param array   $box {
 *     Categories meta box arguments.
 *
 *     @type string   $id       Meta box 'id' attribute.
 *     @type string   $title    Meta box title.
 *     @type callable $callback Meta box display callback.
 *     @type array    $args {
 *         Extra meta box arguments.
 *
 *         @type string $taxonomy Taxonomy. Default 'category'.
 *     }
 * }
 */
function post_categories_meta_box( $post, $box ) {
	$defaults = array( 'taxonomy' => 'category' );
	if ( ! isset( $box['args'] ) || ! is_array( $box['args'] ) ) {
		$args = array();
	} else {
		$args = $box['args'];
	}
	$parsed_args = wp_parse_args( $args, $defaults );
	$tax_name    = esc_attr( $parsed_args['taxonomy'] );
	$taxonomy    = get_taxonomy( $parsed_args['taxonomy'] );
	?><?php echo $tax_name; ?><?php echo $tax_name; ?><?php echo $tax_name; ?><?php echo $taxonomy->labels->all_items; ?><?php echo $tax_name; ?><?php echo esc_html( $taxonomy->labels->most_used ); ?><?php echo $tax_name; ?><?php echo $tax_name; ?><?php $popular_ids = wp_popular_terms_checklist( $tax_name ); ?><?php echo $tax_name; ?><?php
			$name = ( 'category' === $tax_name ) ? 'post_category' : 'tax_input[' . $tax_name . ']';
			// Allows for an empty term set to be sent. 0 is an invalid term ID and will be ignored by empty() checks.
			echo "<input type='hidden' name='{$name}[]' value='0' />";
			?><?php echo $tax_name; ?><?php echo $tax_name; ?><?php
				wp_terms_checklist(
					$post->ID,
					array(
						'taxonomy'     => $tax_name,
						'popular_cats' => $popular_ids,
					)
				);
				?><?php if ( current_user_can( $taxonomy->cap->edit_terms ) ) : ?><?php echo $tax_name; ?><?php echo $tax_name; ?><?php echo $tax_name; ?><?php
						/* translators: %s: Add New taxonomy label. */
						printf( __( '+ %s' ), $taxonomy->labels->add_new_item );
					?><?php echo $tax_name; ?><?php echo $tax_name; ?><?php echo $taxonomy->labels->add_new_item; ?><?php echo $tax_name; ?><?php echo $tax_name; ?><?php echo esc_attr( $taxonomy->labels->new_item_name ); ?><?php echo $tax_name; ?><?php echo $taxonomy->labels->parent_item_colon; ?><?php
					$parent_dropdown_args = array(
						'taxonomy'         => $tax_name,
						'hide_empty'       => 0,
						'name'             => 'new' . $tax_name . '_parent',
						'orderby'          => 'name',
						'hierarchical'     => 1,
						'show_option_none' => '&mdash; ' . $taxonomy->labels->parent_item . ' &mdash;',
					);

					/**
					 * Filters the arguments for the taxonomy parent dropdown on the Post Edit page.
					 *
					 * @since 4.4.0
					 *
					 * @param array $parent_dropdown_args {
					 *     Optional. Array of arguments to generate parent dropdown.
					 *
					 *     @type string   $taxonomy         Name of the taxonomy to retrieve.
					 *     @type bool     $hide_if_empty    True to skip generating markup if no
					 *                                      categories are found. Default 0.
					 *     @type string   $name             Value for the 'name' attribute
					 *                                      of the select element.
					 *                                      Default "new{$tax_name}_parent".
					 *     @type string   $orderby          Which column to use for ordering
					 *                                      terms. Default 'name'.
					 *     @type bool|int $hierarchical     Whether to traverse the taxonomy
					 *                                      hierarchy. Default 1.
					 *     @type string   $show_option_none Text to display for the "none" option.
					 *                                      Default "&mdash; {$parent} &mdash;",
					 *                                      where `$parent` is 'parent_item'
					 *                                      taxonomy label.
					 * }
					 */
					$parent_dropdown_args = apply_filters( 'post_edit_category_parent_dropdown_args', $parent_dropdown_args );

					wp_dropdown_categories( $parent_dropdown_args );
					?><?php echo $tax_name; ?><?php echo $tax_name; ?><?php echo $tax_name; ?><?php echo esc_attr( $taxonomy->labels->add_new_item ); ?><?php wp_nonce_field( 'add-' . $tax_name, '_ajax_nonce-add-' . $tax_name, false ); ?><?php echo $tax_name; ?><?php endif; ?><?php
}

/**
 * Displays post excerpt form fields.
 *
 * @since 2.6.0
 *
 * @param WP_Post $post Current post object.
 */
function post_excerpt_meta_box( $post ) {
	?><?php
	/* translators: Hidden accessibility text. */
	_e( 'Excerpt' );
	?><?php echo $post->post_excerpt; // textarea_escaped ?><?php
	printf(
		/* translators: %s: Documentation URL. */
		__( 'Excerpts are optional hand-crafted summaries of your content that can be used in your theme. <a href="%s">Learn more about manual excerpts</a>.' ),
		__( 'https://wordpress.org/documentation/article/what-is-an-excerpt-classic-editor/' )
	);
	?><?php
}

/**
 * Displays trackback links form fields.
 *
 * @since 2.6.0
 *
 * @param WP_Post $post Current post object.
 */
function post_trackback_meta_box( $post ) {
	$form_trackback = '<input type="text" name="trackback_url" id="trackback_url" class="code" value="' .
		esc_attr( str_replace( "\n", ' ', $post->to_ping ) ) . '" aria-describedby="trackback-url-desc" />';

	if ( '' !== $post->pinged ) {
		$pings          = '<p>' . __( 'Already pinged:' ) . '</p><ul>';
		$already_pinged = explode( "\n", trim( $post->pinged ) );
		foreach ( $already_pinged as $pinged_url ) {
			$pings .= "\n\t<li>" . esc_html( $pinged_url ) . '</li>';
		}
		$pings .= '</ul>';
	}

	?><?php _e( 'Send trackbacks to:' ); ?><?php echo $form_trackback; ?><?php _e( 'Separate multiple URLs with spaces' ); ?><?php
	printf(
		/* translators: %s: Documentation URL. */
		__( 'Trackbacks are a way to notify legacy blog systems that you&#8217;ve linked to them. If you link other WordPress sites, they&#8217;ll be notified automatically using <a href="%s">pingbacks</a>, no other action necessary.' ),
		__( 'https://wordpress.org/documentation/article/introduction-to-blogging/#comments' )
	);
	?><?php
	if ( ! empty( $pings ) ) {
		echo $pings;
	}
}

/**
 * Displays custom fields form fields.
 *
 * @since 2.6.0
 *
 * @param WP_Post $post Current post object.
 */
function post_custom_meta_box( $post ) {
	?><?php
	$metadata = has_meta( $post->ID );
	foreach ( $metadata as $key => $value ) {
		if ( is_protected_meta( $metadata[ $key ]['meta_key'], 'post' ) || ! current_user_can( 'edit_post_meta', $post->ID, $metadata[ $key ]['meta_key'] ) ) {
			unset( $metadata[ $key ] );
		}
	}
	list_meta( $metadata );
	meta_form( $post );
	?><?php
	printf(
		/* translators: %s: Documentation URL. */
		__( 'Custom fields can be used to add extra metadata to a post that you can <a href="%s">use in your theme</a>.' ),
		__( 'https://wordpress.org/documentation/article/assign-custom-fields/' )
	);
	?><?php
}

/**
 * Displays comments status form fields.
 *
 * @since 2.6.0
 *
 * @param WP_Post $post Current post object.
 */
function post_comment_status_meta_box( $post ) {
	?><?php checked( $post->comment_status, 'open' ); ?><?php _e( 'Allow comments' ); ?><?php checked( $post->ping_status, 'open' ); ?><?php
		printf(
			/* translators: %s: Documentation URL. */
			__( 'Allow <a href="%s">trackbacks and pingbacks</a>' ),
			__( 'https://wordpress.org/documentation/article/introduction-to-blogging/#managing-comments' )
		);
		?><?php
	/**
	 * Fires at the end of the Discussion meta box on the post editing screen.
	 *
	 * @since 3.1.0
	 *
	 * @param WP_Post $post WP_Post object for the current post.
	 */
	do_action( 'post_comment_status_meta_box-options', $post ); // phpcs:ignore WordPress.NamingConventions.ValidHookName.UseUnderscores
	?><?php
}

/**
 * Displays comments for post table header
 *
 * @since 3.0.0
 *
 * @param array $result Table header rows.
 * @return array
 */
function post_comment_meta_box_thead( $result ) {
	unset( $result['cb'], $result['response'] );
	return $result;
}

/**
 * Displays comments for post.
 *
 * @since 2.8.0
 *
 * @param WP_Post $post Current post object.
 */
function post_comment_meta_box( $post ) {
	wp_nonce_field( 'get-comments', 'add_comment_nonce', false );
	?><?php echo $post->ID; ?><?php _e( 'Add Comment' ); ?><?php

	$total         = get_comments(
		array(
			'post_id' => $post->ID,
			'number'  => 1,
			'count'   => true,
		)
	);
	$wp_list_table = _get_list_table( 'WP_Post_Comments_List_Table' );
	$wp_list_table->display( true );

	if ( 1 > $total ) {
		echo '<p id="no-comments">' . __( 'No comments yet.' ) . '</p>';
	} else {
		$hidden = get_hidden_meta_boxes( get_current_screen() );
		if ( ! in_array( 'commentsdiv', $hidden, true ) ) {
			?><?php echo $total; ?><?php
		}

		?><?php echo $total; ?><?php _e( 'Show comments' ); ?><?php
	}

	wp_comment_trashnotice();
}

/**
 * Displays slug form fields.
 *
 * @since 2.6.0
 *
 * @param WP_Post $post Current post object.
 */
function post_slug_meta_box( $post ) {
	/** This filter is documented in wp-admin/edit-tag-form.php */
	$editable_slug = apply_filters( 'editable_slug', $post->post_name, $post );
	?><?php
	/* translators: Hidden accessibility text. */
	_e( 'Slug' );
	?><?php echo esc_attr( $editable_slug ); ?><?php
}

/**
 * Displays form field with list of authors.
 *
 * @since 2.6.0
 *
 * @global int $user_ID
 *
 * @param WP_Post $post Current post object.
 */
function post_author_meta_box( $post ) {
	global $user_ID;

	$post_type_object = get_post_type_object( $post->post_type );
	?><?php
	/* translators: Hidden accessibility text. */
	_e( 'Author' );
	?><?php
	wp_dropdown_users(
		array(
			'capability'       => array( $post_type_object->cap->edit_posts ),
			'name'             => 'post_author_override',
			'selected'         => empty( $post->ID ) ? $user_ID : $post->post_author,
			'include_selected' => true,
			'show'             => 'display_name_with_login',
		)
	);
}

/**
 * Displays list of revisions.
 *
 * @since 2.6.0
 *
 * @param WP_Post $post Current post object.
 */
function post_revisions_meta_box( $post ) {
	wp_list_post_revisions( $post );
}

//
// Page-related Meta Boxes.
//

/**
 * Displays page attributes form fields.
 *
 * @since 2.7.0
 *
 * @param WP_Post $post Current post object.
 */
function page_attributes_meta_box( $post ) {
	if ( is_post_type_hierarchical( $post->post_type ) ) :
		$dropdown_args = array(
			'post_type'        => $post->post_type,
			'exclude_tree'     => $post->ID,
			'selected'         => $post->post_parent,
			'name'             => 'parent_id',
			'show_option_none' => __( '(no parent)' ),
			'sort_column'      => 'menu_order, post_title',
			'echo'             => 0,
		);

		/**
		 * Filters the arguments used to generate a Pages drop-down element.
		 *
		 * @since 3.3.0
		 *
		 * @see wp_dropdown_pages()
		 *
		 * @param array   $dropdown_args Array of arguments used to generate the pages drop-down.
		 * @param WP_Post $post          The current post.
		 */
		$dropdown_args = apply_filters( 'page_attributes_dropdown_pages_args', $dropdown_args, $post );
		$pages         = wp_dropdown_pages( $dropdown_args );
		if ( ! empty( $pages ) ) :
			?><?php _e( 'Parent' ); ?><?php echo $pages; ?><?php
		endif; // End empty pages check.
	endif;  // End hierarchical check.

	if ( count( get_page_templates( $post ) ) > 0 && get_option( 'page_for_posts' ) != $post->ID ) :
		$template = ! empty( $post->page_template ) ? $post->page_template : false;
		?><?php _e( 'Template' ); ?><?php
		/**
		 * Fires immediately after the label inside the 'Template' section
		 * of the 'Page Attributes' meta box.
		 *
		 * @since 4.4.0
		 *
		 * @param string|false $template The template used for the current post.
		 * @param WP_Post      $post     The current post.
		 */
		do_action( 'page_attributes_meta_box_template', $template, $post );
		?><?php
		/**
		 * Filters the title of the default page template displayed in the drop-down.
		 *
		 * @since 4.1.0
		 *
		 * @param string $label   The display value for the default page template title.
		 * @param string $context Where the option label is displayed. Possible values
		 *                        include 'meta-box' or 'quick-edit'.
		 */
		$default_title = apply_filters( 'default_page_template_title', __( 'Default template' ), 'meta-box' );
		?><?php echo esc_html( $default_title ); ?><?php page_template_dropdown( $template, $post->post_type ); ?><?php endif; ?><?php if ( post_type_supports( $post->post_type, 'page-attributes' ) ) : ?><?php _e( 'Order' ); ?><?php echo esc_attr( $post->menu_order ); ?><?php
		/**
		 * Fires before the help hint text in the 'Page Attributes' meta box.
		 *
		 * @since 4.9.0
		 *
		 * @param WP_Post $post The current post.
		 */
		do_action( 'page_attributes_misc_attributes', $post );
		?><?php if ( 'page' === $post->post_type && get_current_screen()->get_help_tabs() ) : ?><?php _e( 'Need help? Use the Help tab above the screen title.' ); ?><?php
	endif;
	endif;
}

//
// Link-related Meta Boxes.
//

/**
 * Displays link create form fields.
 *
 * @since 2.7.0
 *
 * @param object $link Current link object.
 */
function link_submit_meta_box( $link ) {
	?><?php // Hidden submit button early on so that the browser chooses the right button when form is submitted with Return key. ?><?php submit_button( __( 'Save' ), '', 'save', false ); ?><?php if ( ! empty( $link->link_id ) ) { ?><?php echo $link->link_url; ?><?php _e( 'Visit Link' ); ?><?php } ?><?php checked( $link->link_visible, 'N' ); ?><?php _e( 'Keep this link private' ); ?><?php
	/** This action is documented in wp-admin/includes/meta-boxes.php */
	do_action( 'post_submitbox_start', null );
	?><?php
	if ( ! empty( $_GET['action'] ) && 'edit' === $_GET['action'] && current_user_can( 'manage_links' ) ) {
		printf(
			'<a class="submitdelete deletion" href="%s" onclick="return confirm( \'%s\' );">%s</a>',
			wp_nonce_url( "link.php?action=delete&amp;link_id=$link->link_id", 'delete-bookmark_' . $link->link_id ),
			/* translators: %s: Link name. */
			esc_js( sprintf( __( "You are about to delete this link '%s'\n  'Cancel' to stop, 'OK' to delete." ), $link->link_name ) ),
			__( 'Delete' )
		);
	}
	?><?php if ( ! empty( $link->link_id ) ) { ?><?php esc_attr_e( 'Update Link' ); ?><?php } else { ?><?php esc_attr_e( 'Add Link' ); ?><?php } ?><?php
	/**
	 * Fires at the end of the Publish box in the Link editing screen.
	 *
	 * @since 2.5.0
	 */
	do_action( 'submitlink_box' );
	?><?php
}

/**
 * Displays link categories form fields.
 *
 * @since 2.6.0
 *
 * @param object $link Current link object.
 */
function link_categories_meta_box( $link ) {
	?><?php _e( 'All categories' ); ?><?php _ex( 'Most Used', 'categories' ); ?><?php
			if ( isset( $link->link_id ) ) {
				wp_link_category_checklist( $link->link_id );
			} else {
				wp_link_category_checklist();
			}
			?><?php wp_popular_terms_checklist( 'link_category' ); ?><?php _e( '+ Add New Category' ); ?><?php
				/* translators: Hidden accessibility text. */
				_e( '+ Add New Category' );
				?><?php esc_attr_e( 'New category name' ); ?><?php esc_attr_e( 'Add' ); ?><?php wp_nonce_field( 'add-link-category', '_ajax_nonce', false ); ?><?php
}

/**
 * Displays form fields for changing link target.
 *
 * @since 2.6.0
 *
 * @param object $link Current link object.
 */
function link_target_meta_box( $link ) {

	?><?php
	/* translators: Hidden accessibility text. */
	_e( 'Target' );
	?><?php echo ( isset( $link->link_target ) && ( '_blank' === $link->link_target ) ? 'checked="checked"' : '' ); ?><?php _e( '<code>_blank</code> &mdash; new window or tab.' ); ?><?php echo ( isset( $link->link_target ) && ( '_top' === $link->link_target ) ? 'checked="checked"' : '' ); ?><?php _e( '<code>_top</code> &mdash; current window or tab, with no frames.' ); ?><?php echo ( isset( $link->link_target ) && ( '' === $link->link_target ) ? 'checked="checked"' : '' ); ?><?php _e( '<code>_none</code> &mdash; same window or tab.' ); ?><?php _e( 'Choose the target frame for your link.' ); ?><?php
}

/**
 * Displays 'checked' checkboxes attribute for XFN microformat options.
 *
 * @since 1.0.1
 *
 * @global object $link Current link object.
 *
 * @param string $xfn_relationship XFN relationship category. Possible values are:
 *                                 'friendship', 'physical', 'professional',
 *                                 'geographical', 'family', 'romantic', 'identity'.
 * @param string $xfn_value        Optional. The XFN value to mark as checked
 *                                 if it matches the current link's relationship.
 *                                 Default empty string.
 * @param mixed  $deprecated       Deprecated. Not used.
 */
function xfn_check( $xfn_relationship, $xfn_value = '', $deprecated = '' ) {
	global $link;

	if ( ! empty( $deprecated ) ) {
		_deprecated_argument( __FUNCTION__, '2.5.0' ); // Never implemented.
	}

	$link_rel  = isset( $link->link_rel ) ? $link->link_rel : ''; // In PHP 5.3: $link_rel = $link->link_rel ?: '';
	$link_rels = preg_split( '/\s+/', $link_rel );

	// Mark the specified value as checked if it matches the current link's relationship.
	if ( '' !== $xfn_value && in_array( $xfn_value, $link_rels, true ) ) {
		echo ' checked="checked"';
	}

	if ( '' === $xfn_value ) {
		// Mark the 'none' value as checked if the current link does not match the specified relationship.
		if ( 'family' === $xfn_relationship
			&& ! array_intersect( $link_rels, array( 'child', 'parent', 'sibling', 'spouse', 'kin' ) )
		) {
			echo ' checked="checked"';
		}

		if ( 'friendship' === $xfn_relationship
			&& ! array_intersect( $link_rels, array( 'friend', 'acquaintance', 'contact' ) )
		) {
			echo ' checked="checked"';
		}

		if ( 'geographical' === $xfn_relationship
			&& ! array_intersect( $link_rels, array( 'co-resident', 'neighbor' ) )
		) {
			echo ' checked="checked"';
		}

		// Mark the 'me' value as checked if it matches the current link's relationship.
		if ( 'identity' === $xfn_relationship
			&& in_array( 'me', $link_rels, true )
		) {
			echo ' checked="checked"';
		}
	}
}

/**
 * Displays XFN form fields.
 *
 * @since 2.6.0
 *
 * @param object $link Current link object.
 */
function link_xfn_meta_box( $link ) {
	?><?php /* translators: xfn: https://gmpg.org/xfn/ */ _e( 'rel:' ); ?><?php echo ( isset( $link->link_rel ) ? esc_attr( $link->link_rel ) : '' ); ?><?php /* translators: xfn: https://gmpg.org/xfn/ */ _e( 'identity' ); ?><?php
				/* translators: Hidden accessibility text. xfn: https://gmpg.org/xfn/ */
				_e( 'identity' );
				?><?php xfn_check( 'identity', 'me' ); ?><?php _e( 'another web address of mine' ); ?><?php /* translators: xfn: https://gmpg.org/xfn/ */ _e( 'friendship' ); ?><?php
				/* translators: Hidden accessibility text. xfn: https://gmpg.org/xfn/ */
				_e( 'friendship' );
				?><?php xfn_check( 'friendship', 'contact' ); ?><?php /* translators: xfn: https://gmpg.org/xfn/ */ _e( 'contact' ); ?><?php xfn_check( 'friendship', 'acquaintance' ); ?><?php /* translators: xfn: https://gmpg.org/xfn/ */ _e( 'acquaintance' ); ?><?php xfn_check( 'friendship', 'friend' ); ?><?php /* translators: xfn: https://gmpg.org/xfn/ */ _e( 'friend' ); ?><?php xfn_check( 'friendship' ); ?><?php /* translators: xfn: https://gmpg.org/xfn/ */ _e( 'none' ); ?><?php /* translators: xfn: https://gmpg.org/xfn/ */ _e( 'physical' ); ?><?php
				/* translators: Hidden accessibility text. xfn: https://gmpg.org/xfn/ */
				_e( 'physical' );
				?><?php xfn_check( 'physical', 'met' ); ?><?php /* translators: xfn: https://gmpg.org/xfn/ */ _e( 'met' ); ?><?php /* translators: xfn: https://gmpg.org/xfn/ */ _e( 'professional' ); ?><?php
				/* translators: Hidden accessibility text. xfn: https://gmpg.org/xfn/ */
				_e( 'professional' );
				?><?php xfn_check( 'professional', 'co-worker' ); ?><?php /* translators: xfn: https://gmpg.org/xfn/ */ _e( 'co-worker' ); ?><?php xfn_check( 'professional', 'colleague' ); ?><?php /* translators: xfn: https://gmpg.org/xfn/ */ _e( 'colleague' ); ?><?php /* translators: xfn: https://gmpg.org/xfn/ */ _e( 'geographical' ); ?><?php
				/* translators: Hidden accessibility text. xfn: https://gmpg.org/xfn/ */
				_e( 'geographical' );
				?><?php xfn_check( 'geographical', 'co-resident' ); ?><?php /* translators: xfn: https://gmpg.org/xfn/ */ _e( 'co-resident' ); ?><?php xfn_check( 'geographical', 'neighbor' ); ?><?php /* translators: xfn: https://gmpg.org/xfn/ */ _e( 'neighbor' ); ?><?php xfn_check( 'geographical' ); ?><?php /* translators: xfn: https://gmpg.org/xfn/ */ _e( 'none' ); ?><?php /* translators: xfn: https://gmpg.org/xfn/ */ _e( 'family' ); ?><?php
				/* translators: Hidden accessibility text. xfn: https://gmpg.org/xfn/ */
				_e( 'family' );
				?><?php xfn_check( 'family', 'child' ); ?><?php /* translators: xfn: https://gmpg.org/xfn/ */ _e( 'child' ); ?><?php xfn_check( 'family', 'kin' ); ?><?php /* translators: xfn: https://gmpg.org/xfn/ */ _e( 'kin' ); ?><?php xfn_check( 'family', 'parent' ); ?><?php /* translators: xfn: https://gmpg.org/xfn/ */ _e( 'parent' ); ?><?php xfn_check( 'family', 'sibling' ); ?><?php /* translators: xfn: https://gmpg.org/xfn/ */ _e( 'sibling' ); ?><?php xfn_check( 'family', 'spouse' ); ?><?php /* translators: xfn: https://gmpg.org/xfn/ */ _e( 'spouse' ); ?><?php xfn_check( 'family' ); ?><?php /* translators: xfn: https://gmpg.org/xfn/ */ _e( 'none' ); ?><?php /* translators: xfn: https://gmpg.org/xfn/ */ _e( 'romantic' ); ?><?php
				/* translators: Hidden accessibility text. xfn: https://gmpg.org/xfn/ */
				_e( 'romantic' );
				?><?php xfn_check( 'romantic', 'muse' ); ?><?php /* translators: xfn: https://gmpg.org/xfn/ */ _e( 'muse' ); ?><?php xfn_check( 'romantic', 'crush' ); ?><?php /* translators: xfn: https://gmpg.org/xfn/ */ _e( 'crush' ); ?><?php xfn_check( 'romantic', 'date' ); ?><?php /* translators: xfn: https://gmpg.org/xfn/ */ _e( 'date' ); ?><?php xfn_check( 'romantic', 'sweetheart' ); ?><?php /* translators: xfn: https://gmpg.org/xfn/ */ _e( 'sweetheart' ); ?><?php _e( 'If the link is to a person, you can specify your relationship with them using the above form. If you would like to learn more about the idea check out <a href="https://gmpg.org/xfn/">XFN</a>.' ); ?><?php
}

/**
 * Displays advanced link options form fields.
 *
 * @since 2.6.0
 *
 * @param object $link Current link object.
 */
function link_advanced_meta_box( $link ) {
	?><?php _e( 'Image Address' ); ?><?php echo ( isset( $link->link_image ) ? esc_attr( $link->link_image ) : '' ); ?><?php _e( 'RSS Address' ); ?><?php echo ( isset( $link->link_rss ) ? esc_attr( $link->link_rss ) : '' ); ?><?php _e( 'Notes' ); ?><?php echo ( isset( $link->link_notes ) ? $link->link_notes : '' ); // textarea_escaped ?><?php _e( 'Rating' ); ?><?php
		for ( $rating = 0; $rating <= 10; $rating++ ) {
			echo '<option value="' . $rating . '"';
			if ( isset( $link->link_rating ) && $link->link_rating == $rating ) {
				echo ' selected="selected"';
			}
			echo '>' . $rating . '</option>';
		}
		?><?php _e( '(Leave at 0 for no rating.)' ); ?><?php
}

/**
 * Displays post thumbnail meta box.
 *
 * @since 2.9.0
 *
 * @param WP_Post $post Current post object.
 */
function post_thumbnail_meta_box( $post ) {
	$thumbnail_id = get_post_meta( $post->ID, '_thumbnail_id', true );
	echo _wp_post_thumbnail_html( $thumbnail_id, $post->ID );
}

/**
 * Displays fields for ID3 data.
 *
 * @since 3.9.0
 *
 * @param WP_Post $post Current post object.
 */
function attachment_id3_data_meta_box( $post ) {
	$meta = array();
	if ( ! empty( $post->ID ) ) {
		$meta = wp_get_attachment_metadata( $post->ID );
	}

	foreach ( wp_get_attachment_id3_keys( $post, 'edit' ) as $key => $label ) :
		$value = '';
		if ( ! empty( $meta[ $key ] ) ) {
			$value = $meta[ $key ];
		}
		?><?php echo $label; ?><?php echo esc_attr( $key ); ?><?php echo esc_attr( $key ); ?><?php echo esc_attr( $value ); ?>