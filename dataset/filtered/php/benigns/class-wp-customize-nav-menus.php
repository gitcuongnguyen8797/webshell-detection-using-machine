<?php
/**
 * WordPress Customize Nav Menus classes
 *
 * @package WordPress
 * @subpackage Customize
 * @since 4.3.0
 */

/**
 * Customize Nav Menus class.
 *
 * Implements menu management in the Customizer.
 *
 * @since 4.3.0
 *
 * @see WP_Customize_Manager
 */
#[AllowDynamicProperties]
final class WP_Customize_Nav_Menus {

	/**
	 * WP_Customize_Manager instance.
	 *
	 * @since 4.3.0
	 * @var WP_Customize_Manager
	 */
	public $manager;

	/**
	 * Original nav menu locations before the theme was switched.
	 *
	 * @since 4.9.0
	 * @var array
	 */
	protected $original_nav_menu_locations;

	/**
	 * Constructor.
	 *
	 * @since 4.3.0
	 *
	 * @param WP_Customize_Manager $manager Customizer bootstrap instance.
	 */
	public function __construct( $manager ) {
		$this->manager                     = $manager;
		$this->original_nav_menu_locations = get_nav_menu_locations();

		// See https://github.com/xwp/wp-customize-snapshots/blob/962586659688a5b1fd9ae93618b7ce2d4e7a421c/php/class-customize-snapshot-manager.php#L469-L499
		add_action( 'customize_register', array( $this, 'customize_register' ), 11 );
		add_filter( 'customize_dynamic_setting_args', array( $this, 'filter_dynamic_setting_args' ), 10, 2 );
		add_filter( 'customize_dynamic_setting_class', array( $this, 'filter_dynamic_setting_class' ), 10, 3 );
		add_action( 'customize_save_nav_menus_created_posts', array( $this, 'save_nav_menus_created_posts' ) );

		// Skip remaining hooks when the user can't manage nav menus anyway.
		if ( ! current_user_can( 'edit_theme_options' ) ) {
			return;
		}

		add_filter( 'customize_refresh_nonces', array( $this, 'filter_nonces' ) );
		add_action( 'wp_ajax_load-available-menu-items-customizer', array( $this, 'ajax_load_available_items' ) );
		add_action( 'wp_ajax_search-available-menu-items-customizer', array( $this, 'ajax_search_available_items' ) );
		add_action( 'wp_ajax_customize-nav-menus-insert-auto-draft', array( $this, 'ajax_insert_auto_draft_post' ) );
		add_action( 'customize_controls_enqueue_scripts', array( $this, 'enqueue_scripts' ) );
		add_action( 'customize_controls_print_footer_scripts', array( $this, 'print_templates' ) );
		add_action( 'customize_controls_print_footer_scripts', array( $this, 'available_items_template' ) );
		add_action( 'customize_preview_init', array( $this, 'customize_preview_init' ) );
		add_action( 'customize_preview_init', array( $this, 'make_auto_draft_status_previewable' ) );

		// Selective Refresh partials.
		add_filter( 'customize_dynamic_partial_args', array( $this, 'customize_dynamic_partial_args' ), 10, 2 );
	}

	/**
	 * Adds a nonce for customizing menus.
	 *
	 * @since 4.5.0
	 *
	 * @param string[] $nonces Array of nonces.
	 * @return string[] Modified array of nonces.
	 */
	public function filter_nonces( $nonces ) {
		$nonces['customize-menus'] = wp_create_nonce( 'customize-menus' );
		return $nonces;
	}

	/**
	 * Ajax handler for loading available menu items.
	 *
	 * @since 4.3.0
	 */
	public function ajax_load_available_items() {
		check_ajax_referer( 'customize-menus', 'customize-menus-nonce' );

		if ( ! current_user_can( 'edit_theme_options' ) ) {
			wp_die( -1 );
		}

		$all_items  = array();
		$item_types = array();
		if ( isset( $_POST['item_types'] ) && is_array( $_POST['item_types'] ) ) {
			$item_types = wp_unslash( $_POST['item_types'] );
		} elseif ( isset( $_POST['type'] ) && isset( $_POST['object'] ) ) { // Back compat.
			$item_types[] = array(
				'type'   => wp_unslash( $_POST['type'] ),
				'object' => wp_unslash( $_POST['object'] ),
				'page'   => empty( $_POST['page'] ) ? 0 : absint( $_POST['page'] ),
			);
		} else {
			wp_send_json_error( 'nav_menus_missing_type_or_object_parameter' );
		}

		foreach ( $item_types as $item_type ) {
			if ( empty( $item_type['type'] ) || empty( $item_type['object'] ) ) {
				wp_send_json_error( 'nav_menus_missing_type_or_object_parameter' );
			}
			$type   = sanitize_key( $item_type['type'] );
			$object = sanitize_key( $item_type['object'] );
			$page   = empty( $item_type['page'] ) ? 0 : absint( $item_type['page'] );
			$items  = $this->load_available_items_query( $type, $object, $page );
			if ( is_wp_error( $items ) ) {
				wp_send_json_error( $items->get_error_code() );
			}
			$all_items[ $item_type['type'] . ':' . $item_type['object'] ] = $items;
		}

		wp_send_json_success( array( 'items' => $all_items ) );
	}

	/**
	 * Performs the post_type and taxonomy queries for loading available menu items.
	 *
	 * @since 4.3.0
	 *
	 * @param string $object_type Optional. Accepts any custom object type and has built-in support for
	 *                            'post_type' and 'taxonomy'. Default is 'post_type'.
	 * @param string $object_name Optional. Accepts any registered taxonomy or post type name. Default is 'page'.
	 * @param int    $page        Optional. The page number used to generate the query offset. Default is '0'.
	 * @return array|WP_Error An array of menu items on success, a WP_Error object on failure.
	 */
	public function load_available_items_query( $object_type = 'post_type', $object_name = 'page', $page = 0 ) {
		$items = array();

		if ( 'post_type' === $object_type ) {
			$post_type = get_post_type_object( $object_name );
			if ( ! $post_type ) {
				return new WP_Error( 'nav_menus_invalid_post_type' );
			}

			/*
			 * If we're dealing with pages, let's prioritize the Front Page,
			 * Posts Page and Privacy Policy Page at the top of the list.
			 */
			$important_pages   = array();
			$suppress_page_ids = array();
			if ( 0 === $page && 'page' === $object_name ) {
				// Insert Front Page or custom "Home" link.
				$front_page = 'page' === get_option( 'show_on_front' ) ? (int) get_option( 'page_on_front' ) : 0;
				if ( ! empty( $front_page ) ) {
					$front_page_obj      = get_post( $front_page );
					$important_pages[]   = $front_page_obj;
					$suppress_page_ids[] = $front_page_obj->ID;
				} else {
					// Add "Home" link. Treat as a page, but switch to custom on add.
					$items[] = array(
						'id'         => 'home',
						'title'      => _x( 'Home', 'nav menu home label' ),
						'type'       => 'custom',
						'type_label' => __( 'Custom Link' ),
						'object'     => '',
						'url'        => home_url(),
					);
				}

				// Insert Posts Page.
				$posts_page = 'page' === get_option( 'show_on_front' ) ? (int) get_option( 'page_for_posts' ) : 0;
				if ( ! empty( $posts_page ) ) {
					$posts_page_obj      = get_post( $posts_page );
					$important_pages[]   = $posts_page_obj;
					$suppress_page_ids[] = $posts_page_obj->ID;
				}

				// Insert Privacy Policy Page.
				$privacy_policy_page_id = (int) get_option( 'wp_page_for_privacy_policy' );
				if ( ! empty( $privacy_policy_page_id ) ) {
					$privacy_policy_page = get_post( $privacy_policy_page_id );
					if ( $privacy_policy_page instanceof WP_Post && 'publish' === $privacy_policy_page->post_status ) {
						$important_pages[]   = $privacy_policy_page;
						$suppress_page_ids[] = $privacy_policy_page->ID;
					}
				}
			} elseif ( 'post' !== $object_name && 0 === $page && $post_type->has_archive ) {
				// Add a post type archive link.
				$items[] = array(
					'id'         => $object_name . '-archive',
					'title'      => $post_type->labels->archives,
					'type'       => 'post_type_archive',
					'type_label' => __( 'Post Type Archive' ),
					'object'     => $object_name,
					'url'        => get_post_type_archive_link( $object_name ),
				);
			}

			// Prepend posts with nav_menus_created_posts on first page.
			$posts = array();
			if ( 0 === $page && $this->manager->get_setting( 'nav_menus_created_posts' ) ) {
				foreach ( $this->manager->get_setting( 'nav_menus_created_posts' )->value() as $post_id ) {
					$auto_draft_post = get_post( $post_id );
					if ( $post_type->name === $auto_draft_post->post_type ) {
						$posts[] = $auto_draft_post;
					}
				}
			}

			$args = array(
				'numberposts' => 10,
				'offset'      => 10 * $page,
				'orderby'     => 'date',
				'order'       => 'DESC',
				'post_type'   => $object_name,
			);

			// Add suppression array to arguments for get_posts.
			if ( ! empty( $suppress_page_ids ) ) {
				$args['post__not_in'] = $suppress_page_ids;
			}

			$posts = array_merge(
				$posts,
				$important_pages,
				get_posts( $args )
			);

			foreach ( $posts as $post ) {
				$post_title = $post->post_title;
				if ( '' === $post_title ) {
					/* translators: %d: ID of a post. */
					$post_title = sprintf( __( '#%d (no title)' ), $post->ID );
				}

				$post_type_label = get_post_type_object( $post->post_type )->labels->singular_name;
				$post_states     = get_post_states( $post );
				if ( ! empty( $post_states ) ) {
					$post_type_label = implode( ',', $post_states );
				}

				$items[] = array(
					'id'         => "post-{$post->ID}",
					'title'      => html_entity_decode( $post_title, ENT_QUOTES, get_bloginfo( 'charset' ) ),
					'type'       => 'post_type',
					'type_label' => $post_type_label,
					'object'     => $post->post_type,
					'object_id'  => (int) $post->ID,
					'url'        => get_permalink( (int) $post->ID ),
				);
			}
		} elseif ( 'taxonomy' === $object_type ) {
			$terms = get_terms(
				array(
					'taxonomy'     => $object_name,
					'child_of'     => 0,
					'exclude'      => '',
					'hide_empty'   => false,
					'hierarchical' => 1,
					'include'      => '',
					'number'       => 10,
					'offset'       => 10 * $page,
					'order'        => 'DESC',
					'orderby'      => 'count',
					'pad_counts'   => false,
				)
			);

			if ( is_wp_error( $terms ) ) {
				return $terms;
			}

			foreach ( $terms as $term ) {
				$items[] = array(
					'id'         => "term-{$term->term_id}",
					'title'      => html_entity_decode( $term->name, ENT_QUOTES, get_bloginfo( 'charset' ) ),
					'type'       => 'taxonomy',
					'type_label' => get_taxonomy( $term->taxonomy )->labels->singular_name,
					'object'     => $term->taxonomy,
					'object_id'  => (int) $term->term_id,
					'url'        => get_term_link( (int) $term->term_id, $term->taxonomy ),
				);
			}
		}

		/**
		 * Filters the available menu items.
		 *
		 * @since 4.3.0
		 *
		 * @param array  $items       The array of menu items.
		 * @param string $object_type The object type.
		 * @param string $object_name The object name.
		 * @param int    $page        The current page number.
		 */
		$items = apply_filters( 'customize_nav_menu_available_items', $items, $object_type, $object_name, $page );

		return $items;
	}

	/**
	 * Ajax handler for searching available menu items.
	 *
	 * @since 4.3.0
	 */
	public function ajax_search_available_items() {
		check_ajax_referer( 'customize-menus', 'customize-menus-nonce' );

		if ( ! current_user_can( 'edit_theme_options' ) ) {
			wp_die( -1 );
		}

		if ( empty( $_POST['search'] ) ) {
			wp_send_json_error( 'nav_menus_missing_search_parameter' );
		}

		$p = isset( $_POST['page'] ) ? absint( $_POST['page'] ) : 0;
		if ( $p < 1 ) {
			$p = 1;
		}

		$s     = sanitize_text_field( wp_unslash( $_POST['search'] ) );
		$items = $this->search_available_items_query(
			array(
				'pagenum' => $p,
				's'       => $s,
			)
		);

		if ( empty( $items ) ) {
			wp_send_json_error( array( 'message' => __( 'No results found.' ) ) );
		} else {
			wp_send_json_success( array( 'items' => $items ) );
		}
	}

	/**
	 * Performs post queries for available-item searching.
	 *
	 * Based on WP_Editor::wp_link_query().
	 *
	 * @since 4.3.0
	 *
	 * @param array $args Optional. Accepts 'pagenum' and 's' (search) arguments.
	 * @return array Menu items.
	 */
	public function search_available_items_query( $args = array() ) {
		$items = array();

		$post_type_objects = get_post_types( array( 'show_in_nav_menus' => true ), 'objects' );
		$query             = array(
			'post_type'              => array_keys( $post_type_objects ),
			'suppress_filters'       => true,
			'update_post_term_cache' => false,
			'update_post_meta_cache' => false,
			'post_status'            => 'publish',
			'posts_per_page'         => 20,
		);

		$args['pagenum'] = isset( $args['pagenum'] ) ? absint( $args['pagenum'] ) : 1;
		$query['offset'] = $args['pagenum'] > 1 ? $query['posts_per_page'] * ( $args['pagenum'] - 1 ) : 0;

		if ( isset( $args['s'] ) ) {
			$query['s'] = $args['s'];
		}

		$posts = array();

		// Prepend list of posts with nav_menus_created_posts search results on first page.
		$nav_menus_created_posts_setting = $this->manager->get_setting( 'nav_menus_created_posts' );
		if ( 1 === $args['pagenum'] && $nav_menus_created_posts_setting && count( $nav_menus_created_posts_setting->value() ) > 0 ) {
			$stub_post_query = new WP_Query(
				array_merge(
					$query,
					array(
						'post_status'    => 'auto-draft',
						'post__in'       => $nav_menus_created_posts_setting->value(),
						'posts_per_page' => -1,
					)
				)
			);
			$posts           = array_merge( $posts, $stub_post_query->posts );
		}

		// Query posts.
		$get_posts = new WP_Query( $query );
		$posts     = array_merge( $posts, $get_posts->posts );

		// Create items for posts.
		foreach ( $posts as $post ) {
			$post_title = $post->post_title;
			if ( '' === $post_title ) {
				/* translators: %d: ID of a post. */
				$post_title = sprintf( __( '#%d (no title)' ), $post->ID );
			}

			$post_type_label = $post_type_objects[ $post->post_type ]->labels->singular_name;
			$post_states     = get_post_states( $post );
			if ( ! empty( $post_states ) ) {
				$post_type_label = implode( ',', $post_states );
			}

			$items[] = array(
				'id'         => 'post-' . $post->ID,
				'title'      => html_entity_decode( $post_title, ENT_QUOTES, get_bloginfo( 'charset' ) ),
				'type'       => 'post_type',
				'type_label' => $post_type_label,
				'object'     => $post->post_type,
				'object_id'  => (int) $post->ID,
				'url'        => get_permalink( (int) $post->ID ),
			);
		}

		// Query taxonomy terms.
		$taxonomies = get_taxonomies( array( 'show_in_nav_menus' => true ), 'names' );
		$terms      = get_terms(
			array(
				'taxonomies' => $taxonomies,
				'name__like' => $args['s'],
				'number'     => 20,
				'hide_empty' => false,
				'offset'     => 20 * ( $args['pagenum'] - 1 ),
			)
		);

		// Check if any taxonomies were found.
		if ( ! empty( $terms ) ) {
			foreach ( $terms as $term ) {
				$items[] = array(
					'id'         => 'term-' . $term->term_id,
					'title'      => html_entity_decode( $term->name, ENT_QUOTES, get_bloginfo( 'charset' ) ),
					'type'       => 'taxonomy',
					'type_label' => get_taxonomy( $term->taxonomy )->labels->singular_name,
					'object'     => $term->taxonomy,
					'object_id'  => (int) $term->term_id,
					'url'        => get_term_link( (int) $term->term_id, $term->taxonomy ),
				);
			}
		}

		// Add "Home" link if search term matches. Treat as a page, but switch to custom on add.
		if ( isset( $args['s'] ) ) {
			// Only insert custom "Home" link if there's no Front Page
			$front_page = 'page' === get_option( 'show_on_front' ) ? (int) get_option( 'page_on_front' ) : 0;
			if ( empty( $front_page ) ) {
				$title   = _x( 'Home', 'nav menu home label' );
				$matches = function_exists( 'mb_stripos' ) ? false !== mb_stripos( $title, $args['s'] ) : false !== stripos( $title, $args['s'] );
				if ( $matches ) {
					$items[] = array(
						'id'         => 'home',
						'title'      => $title,
						'type'       => 'custom',
						'type_label' => __( 'Custom Link' ),
						'object'     => '',
						'url'        => home_url(),
					);
				}
			}
		}

		/**
		 * Filters the available menu items during a search request.
		 *
		 * @since 4.5.0
		 *
		 * @param array $items The array of menu items.
		 * @param array $args  Includes 'pagenum' and 's' (search) arguments.
		 */
		$items = apply_filters( 'customize_nav_menu_searched_items', $items, $args );

		return $items;
	}

	/**
	 * Enqueues scripts and styles for Customizer pane.
	 *
	 * @since 4.3.0
	 */
	public function enqueue_scripts() {
		wp_enqueue_style( 'customize-nav-menus' );
		wp_enqueue_script( 'customize-nav-menus' );

		$temp_nav_menu_setting      = new WP_Customize_Nav_Menu_Setting( $this->manager, 'nav_menu[-1]' );
		$temp_nav_menu_item_setting = new WP_Customize_Nav_Menu_Item_Setting( $this->manager, 'nav_menu_item[-1]' );

		$num_locations = count( get_registered_nav_menus() );

		if ( 1 === $num_locations ) {
			$locations_description = __( 'Your theme can display menus in one location.' );
		} else {
			/* translators: %s: Number of menu locations. */
			$locations_description = sprintf( _n( 'Your theme can display menus in %s location.', 'Your theme can display menus in %s locations.', $num_locations ), number_format_i18n( $num_locations ) );
		}

		// Pass data to JS.
		$settings = array(
			'allMenus'                 => wp_get_nav_menus(),
			'itemTypes'                => $this->available_item_types(),
			'l10n'                     => array(
				'untitled'               => _x( '(no label)', 'missing menu item navigation label' ),
				'unnamed'                => _x( '(unnamed)', 'Missing menu name.' ),
				'custom_label'           => __( 'Custom Link' ),
				'page_label'             => get_post_type_object( 'page' )->labels->singular_name,
				/* translators: %s: Menu location. */
				'menuLocation'           => _x( '(Currently set to: %s)', 'menu' ),
				'locationsTitle'         => 1 === $num_locations ? __( 'Menu Location' ) : __( 'Menu Locations' ),
				'locationsDescription'   => $locations_description,
				'menuNameLabel'          => __( 'Menu Name' ),
				'newMenuNameDescription' => __( 'If your theme has multiple menus, giving them clear names will help you manage them.' ),
				'itemAdded'              => __( 'Menu item added' ),
				'itemDeleted'            => __( 'Menu item deleted' ),
				'menuAdded'              => __( 'Menu created' ),
				'menuDeleted'            => __( 'Menu deleted' ),
				'movedUp'                => __( 'Menu item moved up' ),
				'movedDown'              => __( 'Menu item moved down' ),
				'movedLeft'              => __( 'Menu item moved out of submenu' ),
				'movedRight'             => __( 'Menu item is now a sub-item' ),
				/* translators: &#9656; is the unicode right-pointing triangle. %s: Section title in the Customizer. */
				'customizingMenus'       => sprintf( __( 'Customizing &#9656; %s' ), esc_html( $this->manager->get_panel( 'nav_menus' )->title ) ),
				/* translators: %s: Title of an invalid menu item. */
				'invalidTitleTpl'        => __( '%s (Invalid)' ),
				/* translators: %s: Title of a menu item in draft status. */
				'pendingTitleTpl'        => __( '%s (Pending)' ),
				/* translators: %d: Number of menu items found. */
				'itemsFound'             => __( 'Number of items found: %d' ),
				/* translators: %d: Number of additional menu items found. */
				'itemsFoundMore'         => __( 'Additional items found: %d' ),
				'itemsLoadingMore'       => __( 'Loading more results... please wait.' ),
				'reorderModeOn'          => __( 'Reorder mode enabled' ),
				'reorderModeOff'         => __( 'Reorder mode closed' ),
				'reorderLabelOn'         => esc_attr__( 'Reorder menu items' ),
				'reorderLabelOff'        => esc_attr__( 'Close reorder mode' ),
			),
			'settingTransport'         => 'postMessage',
			'phpIntMax'                => PHP_INT_MAX,
			'defaultSettingValues'     => array(
				'nav_menu'      => $temp_nav_menu_setting->default,
				'nav_menu_item' => $temp_nav_menu_item_setting->default,
			),
			'locationSlugMappedToName' => get_registered_nav_menus(),
		);

		$data = sprintf( 'var _wpCustomizeNavMenusSettings = %s;', wp_json_encode( $settings ) );
		wp_scripts()->add_data( 'customize-nav-menus', 'data', $data );

		// This is copied from nav-menus.php, and it has an unfortunate object name of `menus`.
		$nav_menus_l10n = array(
			'oneThemeLocationNoMenus' => null,
			'moveUp'                  => __( 'Move up one' ),
			'moveDown'                => __( 'Move down one' ),
			'moveToTop'               => __( 'Move to the top' ),
			/* translators: %s: Previous item name. */
			'moveUnder'               => __( 'Move under %s' ),
			/* translators: %s: Previous item name. */
			'moveOutFrom'             => __( 'Move out from under %s' ),
			/* translators: %s: Previous item name. */
			'under'                   => __( 'Under %s' ),
			/* translators: %s: Previous item name. */
			'outFrom'                 => __( 'Out from under %s' ),
			/* translators: 1: Item name, 2: Item position, 3: Total number of items. */
			'menuFocus'               => __( '%1$s. Menu item %2$d of %3$d.' ),
			/* translators: 1: Item name, 2: Item position, 3: Parent item name. */
			'subMenuFocus'            => __( '%1$s. Sub item number %2$d under %3$s.' ),
		);
		wp_localize_script( 'nav-menu', 'menus', $nav_menus_l10n );
	}

	/**
	 * Filters a dynamic setting's constructor args.
	 *
	 * For a dynamic setting to be registered, this filter must be employed
	 * to override the default false value with an array of args to pass to
	 * the WP_Customize_Setting constructor.
	 *
	 * @since 4.3.0
	 *
	 * @param false|array $setting_args The arguments to the WP_Customize_Setting constructor.
	 * @param string      $setting_id   ID for dynamic setting, usually coming from `$_POST['customized']`.
	 * @return array|false
	 */
	public function filter_dynamic_setting_args( $setting_args, $setting_id ) {
		if ( preg_match( WP_Customize_Nav_Menu_Setting::ID_PATTERN, $setting_id ) ) {
			$setting_args = array(
				'type'      => WP_Customize_Nav_Menu_Setting::TYPE,
				'transport' => 'postMessage',
			);
		} elseif ( preg_match( WP_Customize_Nav_Menu_Item_Setting::ID_PATTERN, $setting_id ) ) {
			$setting_args = array(
				'type'      => WP_Customize_Nav_Menu_Item_Setting::TYPE,
				'transport' => 'postMessage',
			);
		}
		return $setting_args;
	}

	/**
	 * Allows non-statically created settings to be constructed with custom WP_Customize_Setting subclass.
	 *
	 * @since 4.3.0
	 *
	 * @param string $setting_class WP_Customize_Setting or a subclass.
	 * @param string $setting_id    ID for dynamic setting, usually coming from `$_POST['customized']`.
	 * @param array  $setting_args  WP_Customize_Setting or a subclass.
	 * @return string
	 */
	public function filter_dynamic_setting_class( $setting_class, $setting_id, $setting_args ) {
		unset( $setting_id );

		if ( ! empty( $setting_args['type'] ) && WP_Customize_Nav_Menu_Setting::TYPE === $setting_args['type'] ) {
			$setting_class = 'WP_Customize_Nav_Menu_Setting';
		} elseif ( ! empty( $setting_args['type'] ) && WP_Customize_Nav_Menu_Item_Setting::TYPE === $setting_args['type'] ) {
			$setting_class = 'WP_Customize_Nav_Menu_Item_Setting';
		}
		return $setting_class;
	}

	/**
	 * Adds the customizer settings and controls.
	 *
	 * @since 4.3.0
	 */
	public function customize_register() {
		$changeset = $this->manager->unsanitized_post_values();

		// Preview settings for nav menus early so that the sections and controls will be added properly.
		$nav_menus_setting_ids = array();
		foreach ( array_keys( $changeset ) as $setting_id ) {
			if ( preg_match( '/^(nav_menu_locations|nav_menu|nav_menu_item)\[/', $setting_id ) ) {
				$nav_menus_setting_ids[] = $setting_id;
			}
		}
		$settings = $this->manager->add_dynamic_settings( $nav_menus_setting_ids );
		if ( $this->manager->settings_previewed() ) {
			foreach ( $settings as $setting ) {
				$setting->preview();
			}
		}

		// Require JS-rendered control types.
		$this->manager->register_panel_type( 'WP_Customize_Nav_Menus_Panel' );
		$this->manager->register_control_type( 'WP_Customize_Nav_Menu_Control' );
		$this->manager->register_control_type( 'WP_Customize_Nav_Menu_Name_Control' );
		$this->manager->register_control_type( 'WP_Customize_Nav_Menu_Locations_Control' );
		$this->manager->register_control_type( 'WP_Customize_Nav_Menu_Auto_Add_Control' );
		$this->manager->register_control_type( 'WP_Customize_Nav_Menu_Item_Control' );

		// Create a panel for Menus.
		$description = '<p>' . __( 'This panel is used for managing navigation menus for content you have already published on your site. You can create menus and add items for existing content such as pages, posts, categories, tags, formats, or custom links.' ) . '</p>';
		if ( current_theme_supports( 'widgets' ) ) {
			$description .= '<p>' . sprintf(
				/* translators: %s: URL to the Widgets panel of the Customizer. */
				__( 'Menus can be displayed in locations defined by your theme or in <a href="%s">widget areas</a> by adding a &#8220;Navigation Menu&#8221; widget.' ),
				"javascript:wp.customize.panel( 'widgets' ).focus();"
			) . '</p>';
		} else {
			$description .= '<p>' . __( 'Menus can be displayed in locations defined by your theme.' ) . '</p>';
		}

		/*
		 * Once multiple theme supports are allowed in WP_Customize_Panel,
		 * this panel can be restricted to themes that support menus or widgets.
		 */
		$this->manager->add_panel(
			new WP_Customize_Nav_Menus_Panel(
				$this->manager,
				'nav_menus',
				array(
					'title'       => __( 'Menus' ),
					'description' => $description,
					'priority'    => 100,
				)
			)
		);
		$menus = wp_get_nav_menus();

		// Menu locations.
		$locations     = get_registered_nav_menus();
		$num_locations = count( $locations );

		if ( 1 === $num_locations ) {
			$description = '<p>' . __( 'Your theme can display menus in one location. Select which menu you would like to use.' ) . '</p>';
		} else {
			/* translators: %s: Number of menu locations. */
			$description = '<p>' . sprintf( _n( 'Your theme can display menus in %s location. Select which menu you would like to use.', 'Your theme can display menus in %s locations. Select which menu appears in each location.', $num_locations ), number_format_i18n( $num_locations ) ) . '</p>';
		}

		if ( current_theme_supports( 'widgets' ) ) {
			/* translators: URL to the Widgets panel of the Customizer. */
			$description .= '<p>' . sprintf( __( 'If your theme has widget areas, you can also add menus there. Visit the <a href="%s">Widgets panel</a> and add a &#8220;Navigation Menu widget&#8221; to display a menu in a sidebar or footer.' ), "javascript:wp.customize.panel( 'widgets' ).focus();" ) . '</p>';
		}

		$this->manager->add_section(
			'menu_locations',
			array(
				'title'       => 1 === $num_locations ? _x( 'View Location', 'menu locations' ) : _x( 'View All Locations', 'menu locations' ),
				'panel'       => 'nav_menus',
				'priority'    => 30,
				'description' => $description,
			)
		);

		$choices = array( '0' => __( '&mdash; Select &mdash;' ) );
		foreach ( $menus as $menu ) {
			$choices[ $menu->term_id ] = wp_html_excerpt( $menu->name, 40, '&hellip;' );
		}

		// Attempt to re-map the nav menu location assignments when previewing a theme switch.
		$mapped_nav_menu_locations = array();
		if ( ! $this->manager->is_theme_active() ) {
			$theme_mods = get_option( 'theme_mods_' . $this->manager->get_stylesheet(), array() );

			// If there is no data from a previous activation, start fresh.
			if ( empty( $theme_mods['nav_menu_locations'] ) ) {
				$theme_mods['nav_menu_locations'] = array();
			}

			$mapped_nav_menu_locations = wp_map_nav_menu_locations( $theme_mods['nav_menu_locations'], $this->original_nav_menu_locations );
		}

		foreach ( $locations as $location => $description ) {
			$setting_id = "nav_menu_locations[{$location}]";

			$setting = $this->manager->get_setting( $setting_id );
			if ( $setting ) {
				$setting->transport = 'postMessage';
				remove_filter( "customize_sanitize_{$setting_id}", 'absint' );
				add_filter( "customize_sanitize_{$setting_id}", array( $this, 'intval_base10' ) );
			} else {
				$this->manager->add_setting(
					$setting_id,
					array(
						'sanitize_callback' => array( $this, 'intval_base10' ),
						'theme_supports'    => 'menus',
						'type'              => 'theme_mod',
						'transport'         => 'postMessage',
						'default'           => 0,
					)
				);
			}

			// Override the assigned nav menu location if mapped during previewed theme switch.
			if ( empty( $changeset[ $setting_id ] ) && isset( $mapped_nav_menu_locations[ $location ] ) ) {
				$this->manager->set_post_value( $setting_id, $mapped_nav_menu_locations[ $location ] );
			}

			$this->manager->add_control(
				new WP_Customize_Nav_Menu_Location_Control(
					$this->manager,
					$setting_id,
					array(
						'label'       => $description,
						'location_id' => $location,
						'section'     => 'menu_locations',
						'choices'     => $choices,
					)
				)
			);
		}

		// Used to denote post states for special pages.
		if ( ! function_exists( 'get_post_states' ) ) {
			require_once ABSPATH . 'wp-admin/includes/template.php';
		}

		// Register each menu as a Customizer section, and add each menu item to each menu.
		foreach ( $menus as $menu ) {
			$menu_id = $menu->term_id;

			// Create a section for each menu.
			$section_id = 'nav_menu[' . $menu_id . ']';
			$this->manager->add_section(
				new WP_Customize_Nav_Menu_Section(
					$this->manager,
					$section_id,
					array(
						'title'    => html_entity_decode( $menu->name, ENT_QUOTES, get_bloginfo( 'charset' ) ),
						'priority' => 10,
						'panel'    => 'nav_menus',
					)
				)
			);

			$nav_menu_setting_id = 'nav_menu[' . $menu_id . ']';
			$this->manager->add_setting(
				new WP_Customize_Nav_Menu_Setting(
					$this->manager,
					$nav_menu_setting_id,
					array(
						'transport' => 'postMessage',
					)
				)
			);

			// Add the menu contents.
			$menu_items = (array) wp_get_nav_menu_items( $menu_id );

			foreach ( array_values( $menu_items ) as $i => $item ) {

				// Create a setting for each menu item (which doesn't actually manage data, currently).
				$menu_item_setting_id = 'nav_menu_item[' . $item->ID . ']';

				$value = (array) $item;
				if ( empty( $value['post_title'] ) ) {
					$value['title'] = '';
				}

				$value['nav_menu_term_id'] = $menu_id;
				$this->manager->add_setting(
					new WP_Customize_Nav_Menu_Item_Setting(
						$this->manager,
						$menu_item_setting_id,
						array(
							'value'     => $value,
							'transport' => 'postMessage',
						)
					)
				);

				// Create a control for each menu item.
				$this->manager->add_control(
					new WP_Customize_Nav_Menu_Item_Control(
						$this->manager,
						$menu_item_setting_id,
						array(
							'label'    => $item->title,
							'section'  => $section_id,
							'priority' => 10 + $i,
						)
					)
				);
			}

			// Note: other controls inside of this section get added dynamically in JS via the MenuSection.ready() function.
		}

		// Add the add-new-menu section and controls.
		$this->manager->add_section(
			'add_menu',
			array(
				'type'     => 'new_menu',
				'title'    => __( 'New Menu' ),
				'panel'    => 'nav_menus',
				'priority' => 20,
			)
		);

		$this->manager->add_setting(
			new WP_Customize_Filter_Setting(
				$this->manager,
				'nav_menus_created_posts',
				array(
					'transport'         => 'postMessage',
					'type'              => 'option', // To prevent theme prefix in changeset.
					'default'           => array(),
					'sanitize_callback' => array( $this, 'sanitize_nav_menus_created_posts' ),
				)
			)
		);
	}

	/**
	 * Gets the base10 intval.
	 *
	 * This is used as a setting's sanitize_callback; we can't use just plain
	 * intval because the second argument is not what intval() expects.
	 *
	 * @since 4.3.0
	 *
	 * @param mixed $value Number to convert.
	 * @return int Integer.
	 */
	public function intval_base10( $value ) {
		return intval( $value, 10 );
	}

	/**
	 * Returns an array of all the available item types.
	 *
	 * @since 4.3.0
	 * @since 4.7.0  Each array item now includes a `$type_label` in addition to `$title`, `$type`, and `$object`.
	 *
	 * @return array The available menu item types.
	 */
	public function available_item_types() {
		$item_types = array();

		$post_types = get_post_types( array( 'show_in_nav_menus' => true ), 'objects' );
		if ( $post_types ) {
			foreach ( $post_types as $slug => $post_type ) {
				$item_types[] = array(
					'title'      => $post_type->labels->name,
					'type_label' => $post_type->labels->singular_name,
					'type'       => 'post_type',
					'object'     => $post_type->name,
				);
			}
		}

		$taxonomies = get_taxonomies( array( 'show_in_nav_menus' => true ), 'objects' );
		if ( $taxonomies ) {
			foreach ( $taxonomies as $slug => $taxonomy ) {
				if ( 'post_format' === $taxonomy && ! current_theme_supports( 'post-formats' ) ) {
					continue;
				}
				$item_types[] = array(
					'title'      => $taxonomy->labels->name,
					'type_label' => $taxonomy->labels->singular_name,
					'type'       => 'taxonomy',
					'object'     => $taxonomy->name,
				);
			}
		}

		/**
		 * Filters the available menu item types.
		 *
		 * @since 4.3.0
		 * @since 4.7.0  Each array item now includes a `$type_label` in addition to `$title`, `$type`, and `$object`.
		 *
		 * @param array $item_types Navigation menu item types.
		 */
		$item_types = apply_filters( 'customize_nav_menu_available_item_types', $item_types );

		return $item_types;
	}

	/**
	 * Adds a new `auto-draft` post.
	 *
	 * @since 4.7.0
	 *
	 * @param array $postarr {
	 *     Post array. Note that post_status is overridden to be `auto-draft`.
	 *
	 * @var string $post_title   Post title. Required.
	 * @var string $post_type    Post type. Required.
	 * @var string $post_name    Post name.
	 * @var string $post_content Post content.
	 * }
	 * @return WP_Post|WP_Error Inserted auto-draft post object or error.
	 */
	public function insert_auto_draft_post( $postarr ) {
		if ( ! isset( $postarr['post_type'] ) ) {
			return new WP_Error( 'unknown_post_type', __( 'Invalid post type.' ) );
		}
		if ( empty( $postarr['post_title'] ) ) {
			return new WP_Error( 'empty_title', __( 'Empty title.' ) );
		}
		if ( ! empty( $postarr['post_status'] ) ) {
			return new WP_Error( 'status_forbidden', __( 'Status is forbidden.' ) );
		}

		/*
		 * If the changeset is a draft, this will change to draft the next time the changeset
		 * is updated; otherwise, auto-draft will persist in autosave revisions, until save.
		 */
		$postarr['post_status'] = 'auto-draft';

		// Auto-drafts are allowed to have empty post_names, so it has to be explicitly set.
		if ( empty( $postarr['post_name'] ) ) {
			$postarr['post_name'] = sanitize_title( $postarr['post_title'] );
		}
		if ( ! isset( $postarr['meta_input'] ) ) {
			$postarr['meta_input'] = array();
		}
		$postarr['meta_input']['_customize_draft_post_name'] = $postarr['post_name'];
		$postarr['meta_input']['_customize_changeset_uuid']  = $this->manager->changeset_uuid();
		unset( $postarr['post_name'] );

		add_filter( 'wp_insert_post_empty_content', '__return_false', 1000 );
		$r = wp_insert_post( wp_slash( $postarr ), true );
		remove_filter( 'wp_insert_post_empty_content', '__return_false', 1000 );

		if ( is_wp_error( $r ) ) {
			return $r;
		} else {
			return get_post( $r );
		}
	}

	/**
	 * Ajax handler for adding a new auto-draft post.
	 *
	 * @since 4.7.0
	 */
	public function ajax_insert_auto_draft_post() {
		if ( ! check_ajax_referer( 'customize-menus', 'customize-menus-nonce', false ) ) {
			wp_send_json_error( 'bad_nonce', 400 );
		}

		if ( ! current_user_can( 'customize' ) ) {
			wp_send_json_error( 'customize_not_allowed', 403 );
		}

		if ( empty( $_POST['params'] ) || ! is_array( $_POST['params'] ) ) {
			wp_send_json_error( 'missing_params', 400 );
		}

		$params         = wp_unslash( $_POST['params'] );
		$illegal_params = array_diff( array_keys( $params ), array( 'post_type', 'post_title' ) );
		if ( ! empty( $illegal_params ) ) {
			wp_send_json_error( 'illegal_params', 400 );
		}

		$params = array_merge(
			array(
				'post_type'  => '',
				'post_title' => '',
			),
			$params
		);

		if ( empty( $params['post_type'] ) || ! post_type_exists( $params['post_type'] ) ) {
			status_header( 400 );
			wp_send_json_error( 'missing_post_type_param' );
		}

		$post_type_object = get_post_type_object( $params['post_type'] );
		if ( ! current_user_can( $post_type_object->cap->create_posts ) || ! current_user_can( $post_type_object->cap->publish_posts ) ) {
			status_header( 403 );
			wp_send_json_error( 'insufficient_post_permissions' );
		}

		$params['post_title'] = trim( $params['post_title'] );
		if ( '' === $params['post_title'] ) {
			status_header( 400 );
			wp_send_json_error( 'missing_post_title' );
		}

		$r = $this->insert_auto_draft_post( $params );
		if ( is_wp_error( $r ) ) {
			$error = $r;
			if ( ! empty( $post_type_object->labels->singular_name ) ) {
				$singular_name = $post_type_object->labels->singular_name;
			} else {
				$singular_name = __( 'Post' );
			}

			$data = array(
				/* translators: 1: Post type name, 2: Error message. */
				'message' => sprintf( __( '%1$s could not be created: %2$s' ), $singular_name, $error->get_error_message() ),
			);
			wp_send_json_error( $data );
		} else {
			$post = $r;
			$data = array(
				'post_id' => $post->ID,
				'url'     => get_permalink( $post->ID ),
			);
			wp_send_json_success( $data );
		}
	}

	/**
	 * Prints the JavaScript templates used to render Menu Customizer components.
	 *
	 * Templates are imported into the JS use wp.template.
	 *
	 * @since 4.3.0
	 */
	public function print_templates() {
		?><?php
								/* translators: Hidden accessibility text. 1: Title of a menu item, 2: Type of a menu item. */
								printf( __( 'Add to menu: %1$s (%2$s)' ), '{{ data.title || wp.customize.Menus.data.l10n.untitled }}', '{{ data.type_label }}' );
							?><?php
				printf(
					'<button type="button" class="menus-move-up">%1$s</button><button type="button" class="menus-move-down">%2$s</button><button type="button" class="menus-move-left">%3$s</button><button type="button" class="menus-move-right">%4$s</button>',
					__( 'Move up' ),
					__( 'Move down' ),
					__( 'Move one level up' ),
					__( 'Move one level down' )
				);
				?><?php _e( 'Delete Menu' ); ?><?php _e( 'Click &#8220;Next&#8221; to start adding links to your new menu.' ); ?><?php _e( 'Next' ); ?><?php _e( 'It does not look like your site has any menus yet. Want to build one? Click the button to start.' ); ?><?php _e( 'You&#8217;ll create a menu, assign it a location, and add menu items like links to pages and categories. If your theme has multiple menu areas, you might need to create more than one.' ); ?><?php _e( 'Create New Menu' ); ?><?php
	}

	/**
	 * Prints the HTML template used to render the add-menu-item frame.
	 *
	 * @since 4.3.0
	 */
	public function available_items_template() {
		?><?php
						/* translators: Hidden accessibility text. */
						_e( 'Back' );
						?><?php
							/* translators: &#9656; is the unicode right-pointing triangle. %s: Section title in the Customizer. */
							printf( __( 'Customizing &#9656; %s' ), esc_html( $this->manager->get_panel( 'nav_menus' )->title ) );
						?><?php _e( 'Add Menu Items' ); ?><?php
						/* translators: Hidden accessibility text. */
						_e( 'Search Menu Items' );
						?><?php esc_attr_e( 'Search menu items&hellip;' ); ?><?php
						/* translators: Hidden accessibility text. */
						_e( 'The search results will be updated as you type.' );
						?><?php
					/* translators: Hidden accessibility text. */
					_e( 'Clear Results' );
					?><?php

			// Ensure the page post type comes first in the list.
			$item_types     = $this->available_item_types();
			$page_item_type = null;
			foreach ( $item_types as $i => $item_type ) {
				if ( isset( $item_type['object'] ) && 'page' === $item_type['object'] ) {
					$page_item_type = $item_type;
					unset( $item_types[ $i ] );
				}
			}

			$this->print_custom_links_available_menu_item();
			if ( $page_item_type ) {
				$this->print_post_type_container( $page_item_type );
			}
			// Containers for per-post-type item browsing; items are added with JS.
			foreach ( $item_types as $item_type ) {
				$this->print_post_type_container( $item_type );
			}
			?><?php
	}

	/**
	 * Prints the markup for new menu items.
	 *
	 * To be used in the template #available-menu-items.
	 *
	 * @since 4.7.0
	 *
	 * @param array $available_item_type Menu item data to output, including title, type, and label.
	 */
	protected function print_post_type_container( $available_item_type ) {
		$id = sprintf( 'available-menu-items-%s-%s', $available_item_type['type'], $available_item_type['object'] );
		?><?php echo esc_attr( $id ); ?><?php echo esc_html( $available_item_type['title'] ); ?><?php _e( 'No items' ); ?><?php
						/* translators: %s: Title of a section with menu items. */
						printf( __( 'Toggle section: %s' ), esc_html( $available_item_type['title'] ) );
					?><?php if ( 'post_type' === $available_item_type['type'] ) : ?><?php $post_type_obj = get_post_type_object( $available_item_type['object'] ); ?><?php if ( current_user_can( $post_type_obj->cap->create_posts ) && current_user_can( $post_type_obj->cap->publish_posts ) ) : ?><?php echo esc_attr( 'create-item-input-' . $available_item_type['object'] ); ?><?php echo esc_html( $post_type_obj->labels->add_new_item ); ?><?php echo esc_attr( 'create-item-input-' . $available_item_type['object'] ); ?><?php echo esc_attr( $post_type_obj->labels->add_new_item ); ?><?php _e( 'Add' ); ?><?php endif; ?><?php endif; ?><?php echo esc_attr( $available_item_type['type'] ); ?><?php echo esc_attr( $available_item_type['object'] ); ?><?php echo esc_attr( isset( $available_item_type['type_label'] ) ? $available_item_type['type_label'] : $available_item_type['type'] ); ?><?php
	}

	/**
	 * Prints the markup for available menu item custom links.
	 *
	 * @since 4.7.0
	 */
	protected function print_custom_links_available_menu_item() {
		?><?php _e( 'Custom Links' ); ?><?php
						/* translators: Hidden accessibility text. */
						_e( 'Toggle section: Custom Links' );
						?><?php _e( 'URL' ); ?><?php _e( 'Link Text' ); ?><?php esc_attr_e( 'Add to Menu' ); ?>