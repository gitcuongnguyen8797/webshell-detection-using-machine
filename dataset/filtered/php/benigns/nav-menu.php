<?php
/**
 * Core Navigation Menu API
 *
 * @package WordPress
 * @subpackage Nav_Menus
 * @since 3.0.0
 */

/** Walker_Nav_Menu_Edit class */
require_once ABSPATH . 'wp-admin/includes/class-walker-nav-menu-edit.php';

/** Walker_Nav_Menu_Checklist class */
require_once ABSPATH . 'wp-admin/includes/class-walker-nav-menu-checklist.php';

/**
 * Prints the appropriate response to a menu quick search.
 *
 * @since 3.0.0
 *
 * @param array $request The unsanitized request values.
 */
function _wp_ajax_menu_quick_search( $request = array() ) {
	$args            = array();
	$type            = isset( $request['type'] ) ? $request['type'] : '';
	$object_type     = isset( $request['object_type'] ) ? $request['object_type'] : '';
	$query           = isset( $request['q'] ) ? $request['q'] : '';
	$response_format = isset( $request['response-format'] ) ? $request['response-format'] : '';

	if ( ! $response_format || ! in_array( $response_format, array( 'json', 'markup' ), true ) ) {
		$response_format = 'json';
	}

	if ( 'markup' === $response_format ) {
		$args['walker'] = new Walker_Nav_Menu_Checklist();
	}

	if ( 'get-post-item' === $type ) {
		if ( post_type_exists( $object_type ) ) {
			if ( isset( $request['ID'] ) ) {
				$object_id = (int) $request['ID'];
				if ( 'markup' === $response_format ) {
					echo walk_nav_menu_tree( array_map( 'wp_setup_nav_menu_item', array( get_post( $object_id ) ) ), 0, (object) $args );
				} elseif ( 'json' === $response_format ) {
					echo wp_json_encode(
						array(
							'ID'         => $object_id,
							'post_title' => get_the_title( $object_id ),
							'post_type'  => get_post_type( $object_id ),
						)
					);
					echo "\n";
				}
			}
		} elseif ( taxonomy_exists( $object_type ) ) {
			if ( isset( $request['ID'] ) ) {
				$object_id = (int) $request['ID'];
				if ( 'markup' === $response_format ) {
					echo walk_nav_menu_tree( array_map( 'wp_setup_nav_menu_item', array( get_term( $object_id, $object_type ) ) ), 0, (object) $args );
				} elseif ( 'json' === $response_format ) {
					$post_obj = get_term( $object_id, $object_type );
					echo wp_json_encode(
						array(
							'ID'         => $object_id,
							'post_title' => $post_obj->name,
							'post_type'  => $object_type,
						)
					);
					echo "\n";
				}
			}
		}
	} elseif ( preg_match( '/quick-search-(posttype|taxonomy)-([a-zA-Z_-]*\b)/', $type, $matches ) ) {
		if ( 'posttype' === $matches[1] && get_post_type_object( $matches[2] ) ) {
			$post_type_obj = _wp_nav_menu_meta_box_object( get_post_type_object( $matches[2] ) );
			$args          = array_merge(
				$args,
				array(
					'no_found_rows'          => true,
					'update_post_meta_cache' => false,
					'update_post_term_cache' => false,
					'posts_per_page'         => 10,
					'post_type'              => $matches[2],
					's'                      => $query,
				)
			);
			if ( isset( $post_type_obj->_default_query ) ) {
				$args = array_merge( $args, (array) $post_type_obj->_default_query );
			}
			$search_results_query = new WP_Query( $args );
			if ( ! $search_results_query->have_posts() ) {
				return;
			}
			while ( $search_results_query->have_posts() ) {
				$post = $search_results_query->next_post();
				if ( 'markup' === $response_format ) {
					$var_by_ref = $post->ID;
					echo walk_nav_menu_tree( array_map( 'wp_setup_nav_menu_item', array( get_post( $var_by_ref ) ) ), 0, (object) $args );
				} elseif ( 'json' === $response_format ) {
					echo wp_json_encode(
						array(
							'ID'         => $post->ID,
							'post_title' => get_the_title( $post->ID ),
							'post_type'  => $matches[2],
						)
					);
					echo "\n";
				}
			}
		} elseif ( 'taxonomy' === $matches[1] ) {
			$terms = get_terms(
				array(
					'taxonomy'   => $matches[2],
					'name__like' => $query,
					'number'     => 10,
					'hide_empty' => false,
				)
			);
			if ( empty( $terms ) || is_wp_error( $terms ) ) {
				return;
			}
			foreach ( (array) $terms as $term ) {
				if ( 'markup' === $response_format ) {
					echo walk_nav_menu_tree( array_map( 'wp_setup_nav_menu_item', array( $term ) ), 0, (object) $args );
				} elseif ( 'json' === $response_format ) {
					echo wp_json_encode(
						array(
							'ID'         => $term->term_id,
							'post_title' => $term->name,
							'post_type'  => $matches[2],
						)
					);
					echo "\n";
				}
			}
		}
	}
}

/**
 * Register nav menu meta boxes and advanced menu items.
 *
 * @since 3.0.0
 */
function wp_nav_menu_setup() {
	// Register meta boxes.
	wp_nav_menu_post_type_meta_boxes();
	add_meta_box( 'add-custom-links', __( 'Custom Links' ), 'wp_nav_menu_item_link_meta_box', 'nav-menus', 'side', 'default' );
	wp_nav_menu_taxonomy_meta_boxes();

	// Register advanced menu items (columns).
	add_filter( 'manage_nav-menus_columns', 'wp_nav_menu_manage_columns' );

	// If first time editing, disable advanced items by default.
	if ( false === get_user_option( 'managenav-menuscolumnshidden' ) ) {
		$user = wp_get_current_user();
		update_user_meta(
			$user->ID,
			'managenav-menuscolumnshidden',
			array(
				0 => 'link-target',
				1 => 'css-classes',
				2 => 'xfn',
				3 => 'description',
				4 => 'title-attribute',
			)
		);
	}
}

/**
 * Limit the amount of meta boxes to pages, posts, links, and categories for first time users.
 *
 * @since 3.0.0
 *
 * @global array $wp_meta_boxes
 */
function wp_initial_nav_menu_meta_boxes() {
	global $wp_meta_boxes;

	if ( get_user_option( 'metaboxhidden_nav-menus' ) !== false || ! is_array( $wp_meta_boxes ) ) {
		return;
	}

	$initial_meta_boxes = array( 'add-post-type-page', 'add-post-type-post', 'add-custom-links', 'add-category' );
	$hidden_meta_boxes  = array();

	foreach ( array_keys( $wp_meta_boxes['nav-menus'] ) as $context ) {
		foreach ( array_keys( $wp_meta_boxes['nav-menus'][ $context ] ) as $priority ) {
			foreach ( $wp_meta_boxes['nav-menus'][ $context ][ $priority ] as $box ) {
				if ( in_array( $box['id'], $initial_meta_boxes, true ) ) {
					unset( $box['id'] );
				} else {
					$hidden_meta_boxes[] = $box['id'];
				}
			}
		}
	}

	$user = wp_get_current_user();
	update_user_meta( $user->ID, 'metaboxhidden_nav-menus', $hidden_meta_boxes );
}

/**
 * Creates meta boxes for any post type menu item..
 *
 * @since 3.0.0
 */
function wp_nav_menu_post_type_meta_boxes() {
	$post_types = get_post_types( array( 'show_in_nav_menus' => true ), 'object' );

	if ( ! $post_types ) {
		return;
	}

	foreach ( $post_types as $post_type ) {
		/**
		 * Filters whether a menu items meta box will be added for the current
		 * object type.
		 *
		 * If a falsey value is returned instead of an object, the menu items
		 * meta box for the current meta box object will not be added.
		 *
		 * @since 3.0.0
		 *
		 * @param WP_Post_Type|false $post_type The current object to add a menu items
		 *                                      meta box for.
		 */
		$post_type = apply_filters( 'nav_menu_meta_box_object', $post_type );
		if ( $post_type ) {
			$id = $post_type->name;
			// Give pages a higher priority.
			$priority = ( 'page' === $post_type->name ? 'core' : 'default' );
			add_meta_box( "add-post-type-{$id}", $post_type->labels->name, 'wp_nav_menu_item_post_type_meta_box', 'nav-menus', 'side', $priority, $post_type );
		}
	}
}

/**
 * Creates meta boxes for any taxonomy menu item.
 *
 * @since 3.0.0
 */
function wp_nav_menu_taxonomy_meta_boxes() {
	$taxonomies = get_taxonomies( array( 'show_in_nav_menus' => true ), 'object' );

	if ( ! $taxonomies ) {
		return;
	}

	foreach ( $taxonomies as $tax ) {
		/** This filter is documented in wp-admin/includes/nav-menu.php */
		$tax = apply_filters( 'nav_menu_meta_box_object', $tax );
		if ( $tax ) {
			$id = $tax->name;
			add_meta_box( "add-{$id}", $tax->labels->name, 'wp_nav_menu_item_taxonomy_meta_box', 'nav-menus', 'side', 'default', $tax );
		}
	}
}

/**
 * Check whether to disable the Menu Locations meta box submit button and inputs.
 *
 * @since 3.6.0
 * @since 5.3.1 The `$display` parameter was added.
 *
 * @global bool $one_theme_location_no_menus to determine if no menus exist
 *
 * @param int|string $nav_menu_selected_id ID, name, or slug of the currently selected menu.
 * @param bool       $display              Whether to display or just return the string.
 * @return string|false Disabled attribute if at least one menu exists, false if not.
 */
function wp_nav_menu_disabled_check( $nav_menu_selected_id, $display = true ) {
	global $one_theme_location_no_menus;

	if ( $one_theme_location_no_menus ) {
		return false;
	}

	return disabled( $nav_menu_selected_id, 0, $display );
}

/**
 * Displays a meta box for the custom links menu item.
 *
 * @since 3.0.0
 *
 * @global int        $_nav_menu_placeholder
 * @global int|string $nav_menu_selected_id
 */
function wp_nav_menu_item_link_meta_box() {
	global $_nav_menu_placeholder, $nav_menu_selected_id;

	$_nav_menu_placeholder = 0 > $_nav_menu_placeholder ? $_nav_menu_placeholder - 1 : -1;

	?><?php echo $_nav_menu_placeholder; ?><?php _e( 'URL' ); ?><?php echo $_nav_menu_placeholder; ?><?php wp_nav_menu_disabled_check( $nav_menu_selected_id ); ?><?php _e( 'Link Text' ); ?><?php echo $_nav_menu_placeholder; ?><?php wp_nav_menu_disabled_check( $nav_menu_selected_id ); ?><?php wp_nav_menu_disabled_check( $nav_menu_selected_id ); ?><?php esc_attr_e( 'Add to Menu' ); ?><?php
}

/**
 * Displays a meta box for a post type menu item.
 *
 * @since 3.0.0
 *
 * @global int        $_nav_menu_placeholder
 * @global int|string $nav_menu_selected_id
 *
 * @param string $data_object Not used.
 * @param array  $box {
 *     Post type menu item meta box arguments.
 *
 *     @type string       $id       Meta box 'id' attribute.
 *     @type string       $title    Meta box title.
 *     @type callable     $callback Meta box display callback.
 *     @type WP_Post_Type $args     Extra meta box arguments (the post type object for this meta box).
 * }
 */
function wp_nav_menu_item_post_type_meta_box( $data_object, $box ) {
	global $_nav_menu_placeholder, $nav_menu_selected_id;

	$post_type_name = $box['args']->name;
	$post_type      = get_post_type_object( $post_type_name );
	$tab_name       = $post_type_name . '-tab';

	// Paginate browsing for large numbers of post objects.
	$per_page = 50;
	$pagenum  = isset( $_REQUEST[ $tab_name ] ) && isset( $_REQUEST['paged'] ) ? absint( $_REQUEST['paged'] ) : 1;
	$offset   = 0 < $pagenum ? $per_page * ( $pagenum - 1 ) : 0;

	$args = array(
		'offset'                 => $offset,
		'order'                  => 'ASC',
		'orderby'                => 'title',
		'posts_per_page'         => $per_page,
		'post_type'              => $post_type_name,
		'suppress_filters'       => true,
		'update_post_term_cache' => false,
		'update_post_meta_cache' => false,
	);

	if ( isset( $box['args']->_default_query ) ) {
		$args = array_merge( $args, (array) $box['args']->_default_query );
	}

	/*
	 * If we're dealing with pages, let's prioritize the Front Page,
	 * Posts Page and Privacy Policy Page at the top of the list.
	 */
	$important_pages = array();
	if ( 'page' === $post_type_name ) {
		$suppress_page_ids = array();

		// Insert Front Page or custom Home link.
		$front_page = 'page' === get_option( 'show_on_front' ) ? (int) get_option( 'page_on_front' ) : 0;

		$front_page_obj = null;
		if ( ! empty( $front_page ) ) {
			$front_page_obj                = get_post( $front_page );
			$front_page_obj->front_or_home = true;

			$important_pages[]   = $front_page_obj;
			$suppress_page_ids[] = $front_page_obj->ID;
		} else {
			$_nav_menu_placeholder = ( 0 > $_nav_menu_placeholder ) ? (int) $_nav_menu_placeholder - 1 : -1;
			$front_page_obj        = (object) array(
				'front_or_home' => true,
				'ID'            => 0,
				'object_id'     => $_nav_menu_placeholder,
				'post_content'  => '',
				'post_excerpt'  => '',
				'post_parent'   => '',
				'post_title'    => _x( 'Home', 'nav menu home label' ),
				'post_type'     => 'nav_menu_item',
				'type'          => 'custom',
				'url'           => home_url( '/' ),
			);

			$important_pages[] = $front_page_obj;
		}

		// Insert Posts Page.
		$posts_page = 'page' === get_option( 'show_on_front' ) ? (int) get_option( 'page_for_posts' ) : 0;

		if ( ! empty( $posts_page ) ) {
			$posts_page_obj             = get_post( $posts_page );
			$posts_page_obj->posts_page = true;

			$important_pages[]   = $posts_page_obj;
			$suppress_page_ids[] = $posts_page_obj->ID;
		}

		// Insert Privacy Policy Page.
		$privacy_policy_page_id = (int) get_option( 'wp_page_for_privacy_policy' );

		if ( ! empty( $privacy_policy_page_id ) ) {
			$privacy_policy_page = get_post( $privacy_policy_page_id );
			if ( $privacy_policy_page instanceof WP_Post && 'publish' === $privacy_policy_page->post_status ) {
				$privacy_policy_page->privacy_policy_page = true;

				$important_pages[]   = $privacy_policy_page;
				$suppress_page_ids[] = $privacy_policy_page->ID;
			}
		}

		// Add suppression array to arguments for WP_Query.
		if ( ! empty( $suppress_page_ids ) ) {
			$args['post__not_in'] = $suppress_page_ids;
		}
	}

	// @todo Transient caching of these results with proper invalidation on updating of a post of this type.
	$get_posts = new WP_Query();
	$posts     = $get_posts->query( $args );

	// Only suppress and insert when more than just suppression pages available.
	if ( ! $get_posts->post_count ) {
		if ( ! empty( $suppress_page_ids ) ) {
			unset( $args['post__not_in'] );
			$get_posts = new WP_Query();
			$posts     = $get_posts->query( $args );
		} else {
			echo '<p>' . __( 'No items.' ) . '</p>';
			return;
		}
	} elseif ( ! empty( $important_pages ) ) {
		$posts = array_merge( $important_pages, $posts );
	}

	$num_pages = $get_posts->max_num_pages;

	$page_links = paginate_links(
		array(
			'base'               => add_query_arg(
				array(
					$tab_name     => 'all',
					'paged'       => '%#%',
					'item-type'   => 'post_type',
					'item-object' => $post_type_name,
				)
			),
			'format'             => '',
			'prev_text'          => '<span aria-label="' . esc_attr__( 'Previous page' ) . '">' . __( '&laquo;' ) . '</span>',
			'next_text'          => '<span aria-label="' . esc_attr__( 'Next page' ) . '">' . __( '&raquo;' ) . '</span>',
			/* translators: Hidden accessibility text. */
			'before_page_number' => '<span class="screen-reader-text">' . __( 'Page' ) . '</span> ',
			'total'              => $num_pages,
			'current'            => $pagenum,
		)
	);

	$db_fields = false;
	if ( is_post_type_hierarchical( $post_type_name ) ) {
		$db_fields = array(
			'parent' => 'post_parent',
			'id'     => 'ID',
		);
	}

	$walker = new Walker_Nav_Menu_Checklist( $db_fields );

	$current_tab = 'most-recent';

	if ( isset( $_REQUEST[ $tab_name ] ) && in_array( $_REQUEST[ $tab_name ], array( 'all', 'search' ), true ) ) {
		$current_tab = $_REQUEST[ $tab_name ];
	}

	if ( ! empty( $_REQUEST[ 'quick-search-posttype-' . $post_type_name ] ) ) {
		$current_tab = 'search';
	}

	$removed_args = array(
		'action',
		'customlink-tab',
		'edit-menu-item',
		'menu-item',
		'page-tab',
		'_wpnonce',
	);

	$most_recent_url = '';
	$view_all_url    = '';
	$search_url      = '';
	if ( $nav_menu_selected_id ) {
		$most_recent_url = esc_url( add_query_arg( $tab_name, 'most-recent', remove_query_arg( $removed_args ) ) );
		$view_all_url    = esc_url( add_query_arg( $tab_name, 'all', remove_query_arg( $removed_args ) ) );
		$search_url      = esc_url( add_query_arg( $tab_name, 'search', remove_query_arg( $removed_args ) ) );
	}
	?><?php echo $post_type_name; ?><?php echo $post_type_name; ?><?php echo ( 'most-recent' === $current_tab ? ' class="tabs"' : '' ); ?><?php echo esc_attr( $post_type_name ); ?><?php echo $most_recent_url; ?><?php echo $post_type_name; ?><?php _e( 'Most Recent' ); ?><?php echo ( 'all' === $current_tab ? ' class="tabs"' : '' ); ?><?php echo esc_attr( $post_type_name ); ?><?php echo $view_all_url; ?><?php echo $post_type_name; ?><?php _e( 'View All' ); ?><?php echo ( 'search' === $current_tab ? ' class="tabs"' : '' ); ?><?php echo esc_attr( $post_type_name ); ?><?php echo $search_url; ?><?php echo $post_type_name; ?><?php _e( 'Search' ); ?><?php echo $post_type_name; ?><?php echo ( 'most-recent' === $current_tab ? 'tabs-panel-active' : 'tabs-panel-inactive' ); ?><?php esc_attr_e( 'Most Recent' ); ?><?php echo $post_type_name; ?><?php
				$recent_args    = array_merge(
					$args,
					array(
						'orderby'        => 'post_date',
						'order'          => 'DESC',
						'posts_per_page' => 15,
					)
				);
				$most_recent    = $get_posts->query( $recent_args );
				$args['walker'] = $walker;

				/**
				 * Filters the posts displayed in the 'Most Recent' tab of the current
				 * post type's menu items meta box.
				 *
				 * The dynamic portion of the hook name, `$post_type_name`, refers to the post type name.
				 *
				 * Possible hook names include:
				 *
				 *  - `nav_menu_items_post_recent`
				 *  - `nav_menu_items_page_recent`
				 *
				 * @since 4.3.0
				 * @since 4.9.0 Added the `$recent_args` parameter.
				 *
				 * @param WP_Post[] $most_recent An array of post objects being listed.
				 * @param array     $args        An array of `WP_Query` arguments for the meta box.
				 * @param array     $box         Arguments passed to `wp_nav_menu_item_post_type_meta_box()`.
				 * @param array     $recent_args An array of `WP_Query` arguments for 'Most Recent' tab.
				 */
				$most_recent = apply_filters( "nav_menu_items_{$post_type_name}_recent", $most_recent, $args, $box, $recent_args );

				echo walk_nav_menu_tree( array_map( 'wp_setup_nav_menu_item', $most_recent ), 0, (object) $args );
				?><?php echo ( 'search' === $current_tab ? 'tabs-panel-active' : 'tabs-panel-inactive' ); ?><?php echo $post_type_name; ?><?php echo $post_type->labels->search_items; ?><?php
			if ( isset( $_REQUEST[ 'quick-search-posttype-' . $post_type_name ] ) ) {
				$searched       = esc_attr( $_REQUEST[ 'quick-search-posttype-' . $post_type_name ] );
				$search_results = get_posts(
					array(
						's'         => $searched,
						'post_type' => $post_type_name,
						'fields'    => 'all',
						'order'     => 'DESC',
					)
				);
			} else {
				$searched       = '';
				$search_results = array();
			}
			?><?php echo $post_type_name; ?><?php
					/* translators: Hidden accessibility text. */
					_e( 'Search' );
					?><?php wp_nav_menu_disabled_check( $nav_menu_selected_id ); ?><?php echo $searched; ?><?php echo $post_type_name; ?><?php echo $post_type_name; ?><?php submit_button( __( 'Search' ), 'small quick-search-submit hide-if-js', 'submit', false, array( 'id' => 'submit-quick-search-posttype-' . $post_type_name ) ); ?><?php echo $post_type_name; ?><?php echo $post_type_name; ?><?php if ( ! empty( $search_results ) && ! is_wp_error( $search_results ) ) : ?><?php
				$args['walker'] = $walker;
				echo walk_nav_menu_tree( array_map( 'wp_setup_nav_menu_item', $search_results ), 0, (object) $args );
				?><?php elseif ( is_wp_error( $search_results ) ) : ?><?php echo $search_results->get_error_message(); ?><?php elseif ( ! empty( $searched ) ) : ?><?php _e( 'No results found.' ); ?><?php endif; ?><?php echo $post_type_name; ?><?php echo ( 'all' === $current_tab ? 'tabs-panel-active' : 'tabs-panel-inactive' ); ?><?php echo $post_type->labels->all_items; ?><?php if ( ! empty( $page_links ) ) : ?><?php echo $page_links; ?><?php endif; ?><?php echo $post_type_name; ?><?php echo $post_type_name; ?><?php
				$args['walker'] = $walker;

				if ( $post_type->has_archive ) {
					$_nav_menu_placeholder = ( 0 > $_nav_menu_placeholder ) ? (int) $_nav_menu_placeholder - 1 : -1;
					array_unshift(
						$posts,
						(object) array(
							'ID'           => 0,
							'object_id'    => $_nav_menu_placeholder,
							'object'       => $post_type_name,
							'post_content' => '',
							'post_excerpt' => '',
							'post_title'   => $post_type->labels->archives,
							'post_type'    => 'nav_menu_item',
							'type'         => 'post_type_archive',
							'url'          => get_post_type_archive_link( $post_type_name ),
						)
					);
				}

				/**
				 * Filters the posts displayed in the 'View All' tab of the current
				 * post type's menu items meta box.
				 *
				 * The dynamic portion of the hook name, `$post_type_name`, refers
				 * to the slug of the current post type.
				 *
				 * Possible hook names include:
				 *
				 *  - `nav_menu_items_post`
				 *  - `nav_menu_items_page`
				 *
				 * @since 3.2.0
				 * @since 4.6.0 Converted the `$post_type` parameter to accept a WP_Post_Type object.
				 *
				 * @see WP_Query::query()
				 *
				 * @param object[]     $posts     The posts for the current post type. Mostly `WP_Post` objects, but
				 *                                can also contain "fake" post objects to represent other menu items.
				 * @param array        $args      An array of `WP_Query` arguments.
				 * @param WP_Post_Type $post_type The current post type object for this menu item meta box.
				 */
				$posts = apply_filters( "nav_menu_items_{$post_type_name}", $posts, $args, $post_type );

				$checkbox_items = walk_nav_menu_tree( array_map( 'wp_setup_nav_menu_item', $posts ), 0, (object) $args );

				echo $checkbox_items;
				?><?php if ( ! empty( $page_links ) ) : ?><?php echo $page_links; ?><?php endif; ?><?php echo esc_attr( $post_type_name ); ?><?php wp_nav_menu_disabled_check( $nav_menu_selected_id ); ?><?php echo esc_attr( $tab_name ); ?><?php echo esc_attr( $tab_name ); ?><?php _e( 'Select All' ); ?><?php wp_nav_menu_disabled_check( $nav_menu_selected_id ); ?><?php esc_attr_e( 'Add to Menu' ); ?><?php echo esc_attr( 'submit-posttype-' . $post_type_name ); ?><?php
}

/**
 * Displays a meta box for a taxonomy menu item.
 *
 * @since 3.0.0
 *
 * @global int|string $nav_menu_selected_id
 *
 * @param string $data_object Not used.
 * @param array  $box {
 *     Taxonomy menu item meta box arguments.
 *
 *     @type string   $id       Meta box 'id' attribute.
 *     @type string   $title    Meta box title.
 *     @type callable $callback Meta box display callback.
 *     @type object   $args     Extra meta box arguments (the taxonomy object for this meta box).
 * }
 */
function wp_nav_menu_item_taxonomy_meta_box( $data_object, $box ) {
	global $nav_menu_selected_id;

	$taxonomy_name = $box['args']->name;
	$taxonomy      = get_taxonomy( $taxonomy_name );
	$tab_name      = $taxonomy_name . '-tab';

	// Paginate browsing for large numbers of objects.
	$per_page = 50;
	$pagenum  = isset( $_REQUEST[ $tab_name ] ) && isset( $_REQUEST['paged'] ) ? absint( $_REQUEST['paged'] ) : 1;
	$offset   = 0 < $pagenum ? $per_page * ( $pagenum - 1 ) : 0;

	$args = array(
		'taxonomy'     => $taxonomy_name,
		'child_of'     => 0,
		'exclude'      => '',
		'hide_empty'   => false,
		'hierarchical' => 1,
		'include'      => '',
		'number'       => $per_page,
		'offset'       => $offset,
		'order'        => 'ASC',
		'orderby'      => 'name',
		'pad_counts'   => false,
	);

	$terms = get_terms( $args );

	if ( ! $terms || is_wp_error( $terms ) ) {
		echo '<p>' . __( 'No items.' ) . '</p>';
		return;
	}

	$num_pages = ceil(
		wp_count_terms(
			array_merge(
				$args,
				array(
					'number' => '',
					'offset' => '',
				)
			)
		) / $per_page
	);

	$page_links = paginate_links(
		array(
			'base'               => add_query_arg(
				array(
					$tab_name     => 'all',
					'paged'       => '%#%',
					'item-type'   => 'taxonomy',
					'item-object' => $taxonomy_name,
				)
			),
			'format'             => '',
			'prev_text'          => '<span aria-label="' . esc_attr__( 'Previous page' ) . '">' . __( '&laquo;' ) . '</span>',
			'next_text'          => '<span aria-label="' . esc_attr__( 'Next page' ) . '">' . __( '&raquo;' ) . '</span>',
			/* translators: Hidden accessibility text. */
			'before_page_number' => '<span class="screen-reader-text">' . __( 'Page' ) . '</span> ',
			'total'              => $num_pages,
			'current'            => $pagenum,
		)
	);

	$db_fields = false;
	if ( is_taxonomy_hierarchical( $taxonomy_name ) ) {
		$db_fields = array(
			'parent' => 'parent',
			'id'     => 'term_id',
		);
	}

	$walker = new Walker_Nav_Menu_Checklist( $db_fields );

	$current_tab = 'most-used';

	if ( isset( $_REQUEST[ $tab_name ] ) && in_array( $_REQUEST[ $tab_name ], array( 'all', 'most-used', 'search' ), true ) ) {
		$current_tab = $_REQUEST[ $tab_name ];
	}

	if ( ! empty( $_REQUEST[ 'quick-search-taxonomy-' . $taxonomy_name ] ) ) {
		$current_tab = 'search';
	}

	$removed_args = array(
		'action',
		'customlink-tab',
		'edit-menu-item',
		'menu-item',
		'page-tab',
		'_wpnonce',
	);

	$most_used_url = '';
	$view_all_url  = '';
	$search_url    = '';
	if ( $nav_menu_selected_id ) {
		$most_used_url = esc_url( add_query_arg( $tab_name, 'most-used', remove_query_arg( $removed_args ) ) );
		$view_all_url  = esc_url( add_query_arg( $tab_name, 'all', remove_query_arg( $removed_args ) ) );
		$search_url    = esc_url( add_query_arg( $tab_name, 'search', remove_query_arg( $removed_args ) ) );
	}
	?><?php echo $taxonomy_name; ?><?php echo $taxonomy_name; ?><?php echo ( 'most-used' === $current_tab ? ' class="tabs"' : '' ); ?><?php echo esc_attr( $taxonomy_name ); ?><?php echo $most_used_url; ?><?php echo $taxonomy_name; ?><?php echo esc_html( $taxonomy->labels->most_used ); ?><?php echo ( 'all' === $current_tab ? ' class="tabs"' : '' ); ?><?php echo esc_attr( $taxonomy_name ); ?><?php echo $view_all_url; ?><?php echo $taxonomy_name; ?><?php _e( 'View All' ); ?><?php echo ( 'search' === $current_tab ? ' class="tabs"' : '' ); ?><?php echo esc_attr( $taxonomy_name ); ?><?php echo $search_url; ?><?php echo $taxonomy_name; ?><?php _e( 'Search' ); ?><?php echo $taxonomy_name; ?><?php echo ( 'most-used' === $current_tab ? 'tabs-panel-active' : 'tabs-panel-inactive' ); ?><?php echo $taxonomy->labels->most_used; ?><?php echo $taxonomy_name; ?><?php
				$popular_terms  = get_terms(
					array(
						'taxonomy'     => $taxonomy_name,
						'orderby'      => 'count',
						'order'        => 'DESC',
						'number'       => 10,
						'hierarchical' => false,
					)
				);
				$args['walker'] = $walker;
				echo walk_nav_menu_tree( array_map( 'wp_setup_nav_menu_item', $popular_terms ), 0, (object) $args );
				?><?php echo $taxonomy_name; ?><?php echo ( 'all' === $current_tab ? 'tabs-panel-active' : 'tabs-panel-inactive' ); ?><?php echo $taxonomy->labels->all_items; ?><?php if ( ! empty( $page_links ) ) : ?><?php echo $page_links; ?><?php endif; ?><?php echo $taxonomy_name; ?><?php echo $taxonomy_name; ?><?php
				$args['walker'] = $walker;
				echo walk_nav_menu_tree( array_map( 'wp_setup_nav_menu_item', $terms ), 0, (object) $args );
				?><?php if ( ! empty( $page_links ) ) : ?><?php echo $page_links; ?><?php endif; ?><?php echo ( 'search' === $current_tab ? 'tabs-panel-active' : 'tabs-panel-inactive' ); ?><?php echo $taxonomy_name; ?><?php echo $taxonomy->labels->search_items; ?><?php
			if ( isset( $_REQUEST[ 'quick-search-taxonomy-' . $taxonomy_name ] ) ) {
				$searched       = esc_attr( $_REQUEST[ 'quick-search-taxonomy-' . $taxonomy_name ] );
				$search_results = get_terms(
					array(
						'taxonomy'     => $taxonomy_name,
						'name__like'   => $searched,
						'fields'       => 'all',
						'orderby'      => 'count',
						'order'        => 'DESC',
						'hierarchical' => false,
					)
				);
			} else {
				$searched       = '';
				$search_results = array();
			}
			?><?php echo $taxonomy_name; ?><?php
					/* translators: Hidden accessibility text. */
					_e( 'Search' );
					?><?php echo $searched; ?><?php echo $taxonomy_name; ?><?php echo $taxonomy_name; ?><?php submit_button( __( 'Search' ), 'small quick-search-submit hide-if-js', 'submit', false, array( 'id' => 'submit-quick-search-taxonomy-' . $taxonomy_name ) ); ?><?php echo $taxonomy_name; ?><?php echo $taxonomy_name; ?><?php if ( ! empty( $search_results ) && ! is_wp_error( $search_results ) ) : ?><?php
				$args['walker'] = $walker;
				echo walk_nav_menu_tree( array_map( 'wp_setup_nav_menu_item', $search_results ), 0, (object) $args );
				?><?php elseif ( is_wp_error( $search_results ) ) : ?><?php echo $search_results->get_error_message(); ?><?php elseif ( ! empty( $searched ) ) : ?><?php _e( 'No results found.' ); ?><?php endif; ?><?php echo esc_attr( $taxonomy_name ); ?><?php wp_nav_menu_disabled_check( $nav_menu_selected_id ); ?><?php echo esc_attr( $tab_name ); ?><?php echo esc_attr( $tab_name ); ?><?php _e( 'Select All' ); ?><?php wp_nav_menu_disabled_check( $nav_menu_selected_id ); ?><?php esc_attr_e( 'Add to Menu' ); ?><?php echo esc_attr( 'submit-taxonomy-' . $taxonomy_name ); ?>