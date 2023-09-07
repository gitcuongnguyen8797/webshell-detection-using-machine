<?php
/**
 * List Table API: WP_MS_Themes_List_Table class
 *
 * @package WordPress
 * @subpackage Administration
 * @since 3.1.0
 */

/**
 * Core class used to implement displaying themes in a list table for the network admin.
 *
 * @since 3.1.0
 *
 * @see WP_List_Table
 */
class WP_MS_Themes_List_Table extends WP_List_Table {

	public $site_id;
	public $is_site_themes;

	private $has_items;

	/**
	 * Whether to show the auto-updates UI.
	 *
	 * @since 5.5.0
	 *
	 * @var bool True if auto-updates UI is to be shown, false otherwise.
	 */
	protected $show_autoupdates = true;

	/**
	 * Constructor.
	 *
	 * @since 3.1.0
	 *
	 * @see WP_List_Table::__construct() for more information on default arguments.
	 *
	 * @global string $status
	 * @global int    $page
	 *
	 * @param array $args An associative array of arguments.
	 */
	public function __construct( $args = array() ) {
		global $status, $page;

		parent::__construct(
			array(
				'plural' => 'themes',
				'screen' => isset( $args['screen'] ) ? $args['screen'] : null,
			)
		);

		$status = isset( $_REQUEST['theme_status'] ) ? $_REQUEST['theme_status'] : 'all';
		if ( ! in_array( $status, array( 'all', 'enabled', 'disabled', 'upgrade', 'search', 'broken', 'auto-update-enabled', 'auto-update-disabled' ), true ) ) {
			$status = 'all';
		}

		$page = $this->get_pagenum();

		$this->is_site_themes = ( 'site-themes-network' === $this->screen->id ) ? true : false;

		if ( $this->is_site_themes ) {
			$this->site_id = isset( $_REQUEST['id'] ) ? (int) $_REQUEST['id'] : 0;
		}

		$this->show_autoupdates = wp_is_auto_update_enabled_for_type( 'theme' ) &&
			! $this->is_site_themes && current_user_can( 'update_themes' );
	}

	/**
	 * @return array
	 */
	protected function get_table_classes() {
		// @todo Remove and add CSS for .themes.
		return array( 'widefat', 'plugins' );
	}

	/**
	 * @return bool
	 */
	public function ajax_user_can() {
		if ( $this->is_site_themes ) {
			return current_user_can( 'manage_sites' );
		} else {
			return current_user_can( 'manage_network_themes' );
		}
	}

	/**
	 * @global string $status
	 * @global array $totals
	 * @global int $page
	 * @global string $orderby
	 * @global string $order
	 * @global string $s
	 */
	public function prepare_items() {
		global $status, $totals, $page, $orderby, $order, $s;

		wp_reset_vars( array( 'orderby', 'order', 's' ) );

		$themes = array(
			/**
			 * Filters the full array of WP_Theme objects to list in the Multisite
			 * themes list table.
			 *
			 * @since 3.1.0
			 *
			 * @param WP_Theme[] $all Array of WP_Theme objects to display in the list table.
			 */
			'all'      => apply_filters( 'all_themes', wp_get_themes() ),
			'search'   => array(),
			'enabled'  => array(),
			'disabled' => array(),
			'upgrade'  => array(),
			'broken'   => $this->is_site_themes ? array() : wp_get_themes( array( 'errors' => true ) ),
		);

		if ( $this->show_autoupdates ) {
			$auto_updates = (array) get_site_option( 'auto_update_themes', array() );

			$themes['auto-update-enabled']  = array();
			$themes['auto-update-disabled'] = array();
		}

		if ( $this->is_site_themes ) {
			$themes_per_page = $this->get_items_per_page( 'site_themes_network_per_page' );
			$allowed_where   = 'site';
		} else {
			$themes_per_page = $this->get_items_per_page( 'themes_network_per_page' );
			$allowed_where   = 'network';
		}

		$current      = get_site_transient( 'update_themes' );
		$maybe_update = current_user_can( 'update_themes' ) && ! $this->is_site_themes && $current;

		foreach ( (array) $themes['all'] as $key => $theme ) {
			if ( $this->is_site_themes && $theme->is_allowed( 'network' ) ) {
				unset( $themes['all'][ $key ] );
				continue;
			}

			if ( $maybe_update && isset( $current->response[ $key ] ) ) {
				$themes['all'][ $key ]->update = true;
				$themes['upgrade'][ $key ]     = $themes['all'][ $key ];
			}

			$filter                    = $theme->is_allowed( $allowed_where, $this->site_id ) ? 'enabled' : 'disabled';
			$themes[ $filter ][ $key ] = $themes['all'][ $key ];

			$theme_data = array(
				'update_supported' => isset( $theme->update_supported ) ? $theme->update_supported : true,
			);

			// Extra info if known. array_merge() ensures $theme_data has precedence if keys collide.
			if ( isset( $current->response[ $key ] ) ) {
				$theme_data = array_merge( (array) $current->response[ $key ], $theme_data );
			} elseif ( isset( $current->no_update[ $key ] ) ) {
				$theme_data = array_merge( (array) $current->no_update[ $key ], $theme_data );
			} else {
				$theme_data['update_supported'] = false;
			}

			$theme->update_supported = $theme_data['update_supported'];

			/*
			 * Create the expected payload for the auto_update_theme filter, this is the same data
			 * as contained within $updates or $no_updates but used when the Theme is not known.
			 */
			$filter_payload = array(
				'theme'        => $key,
				'new_version'  => '',
				'url'          => '',
				'package'      => '',
				'requires'     => '',
				'requires_php' => '',
			);

			$filter_payload = (object) array_merge( $filter_payload, array_intersect_key( $theme_data, $filter_payload ) );

			$auto_update_forced = wp_is_auto_update_forced_for_item( 'theme', null, $filter_payload );

			if ( ! is_null( $auto_update_forced ) ) {
				$theme->auto_update_forced = $auto_update_forced;
			}

			if ( $this->show_autoupdates ) {
				$enabled = in_array( $key, $auto_updates, true ) && $theme->update_supported;
				if ( isset( $theme->auto_update_forced ) ) {
					$enabled = (bool) $theme->auto_update_forced;
				}

				if ( $enabled ) {
					$themes['auto-update-enabled'][ $key ] = $theme;
				} else {
					$themes['auto-update-disabled'][ $key ] = $theme;
				}
			}
		}

		if ( $s ) {
			$status           = 'search';
			$themes['search'] = array_filter( array_merge( $themes['all'], $themes['broken'] ), array( $this, '_search_callback' ) );
		}

		$totals    = array();
		$js_themes = array();
		foreach ( $themes as $type => $list ) {
			$totals[ $type ]    = count( $list );
			$js_themes[ $type ] = array_keys( $list );
		}

		if ( empty( $themes[ $status ] ) && ! in_array( $status, array( 'all', 'search' ), true ) ) {
			$status = 'all';
		}

		$this->items = $themes[ $status ];
		WP_Theme::sort_by_name( $this->items );

		$this->has_items = ! empty( $themes['all'] );
		$total_this_page = $totals[ $status ];

		wp_localize_script(
			'updates',
			'_wpUpdatesItemCounts',
			array(
				'themes' => $js_themes,
				'totals' => wp_get_update_data(),
			)
		);

		if ( $orderby ) {
			$orderby = ucfirst( $orderby );
			$order   = strtoupper( $order );

			if ( 'Name' === $orderby ) {
				if ( 'ASC' === $order ) {
					$this->items = array_reverse( $this->items );
				}
			} else {
				uasort( $this->items, array( $this, '_order_callback' ) );
			}
		}

		$start = ( $page - 1 ) * $themes_per_page;

		if ( $total_this_page > $themes_per_page ) {
			$this->items = array_slice( $this->items, $start, $themes_per_page, true );
		}

		$this->set_pagination_args(
			array(
				'total_items' => $total_this_page,
				'per_page'    => $themes_per_page,
			)
		);
	}

	/**
	 * @param WP_Theme $theme
	 * @return bool
	 */
	public function _search_callback( $theme ) {
		static $term = null;
		if ( is_null( $term ) ) {
			$term = wp_unslash( $_REQUEST['s'] );
		}

		foreach ( array( 'Name', 'Description', 'Author', 'Author', 'AuthorURI' ) as $field ) {
			// Don't mark up; Do translate.
			if ( false !== stripos( $theme->display( $field, false, true ), $term ) ) {
				return true;
			}
		}

		if ( false !== stripos( $theme->get_stylesheet(), $term ) ) {
			return true;
		}

		if ( false !== stripos( $theme->get_template(), $term ) ) {
			return true;
		}

		return false;
	}

	// Not used by any core columns.
	/**
	 * @global string $orderby
	 * @global string $order
	 * @param array $theme_a
	 * @param array $theme_b
	 * @return int
	 */
	public function _order_callback( $theme_a, $theme_b ) {
		global $orderby, $order;

		$a = $theme_a[ $orderby ];
		$b = $theme_b[ $orderby ];

		if ( $a === $b ) {
			return 0;
		}

		if ( 'DESC' === $order ) {
			return ( $a < $b ) ? 1 : -1;
		} else {
			return ( $a < $b ) ? -1 : 1;
		}
	}

	/**
	 */
	public function no_items() {
		if ( $this->has_items ) {
			_e( 'No themes found.' );
		} else {
			_e( 'No themes are currently available.' );
		}
	}

	/**
	 * @return array
	 */
	public function get_columns() {
		$columns = array(
			'cb'          => '<input type="checkbox" />',
			'name'        => __( 'Theme' ),
			'description' => __( 'Description' ),
		);

		if ( $this->show_autoupdates ) {
			$columns['auto-updates'] = __( 'Automatic Updates' );
		}

		return $columns;
	}

	/**
	 * @return array
	 */
	protected function get_sortable_columns() {
		return array(
			'name' => 'name',
		);
	}

	/**
	 * Gets the name of the primary column.
	 *
	 * @since 4.3.0
	 *
	 * @return string Unalterable name of the primary column name, in this case, 'name'.
	 */
	protected function get_primary_column_name() {
		return 'name';
	}

	/**
	 * @global array $totals
	 * @global string $status
	 * @return array
	 */
	protected function get_views() {
		global $totals, $status;

		$status_links = array();
		foreach ( $totals as $type => $count ) {
			if ( ! $count ) {
				continue;
			}

			switch ( $type ) {
				case 'all':
					/* translators: %s: Number of themes. */
					$text = _nx(
						'All <span class="count">(%s)</span>',
						'All <span class="count">(%s)</span>',
						$count,
						'themes'
					);
					break;
				case 'enabled':
					/* translators: %s: Number of themes. */
					$text = _nx(
						'Enabled <span class="count">(%s)</span>',
						'Enabled <span class="count">(%s)</span>',
						$count,
						'themes'
					);
					break;
				case 'disabled':
					/* translators: %s: Number of themes. */
					$text = _nx(
						'Disabled <span class="count">(%s)</span>',
						'Disabled <span class="count">(%s)</span>',
						$count,
						'themes'
					);
					break;
				case 'upgrade':
					/* translators: %s: Number of themes. */
					$text = _nx(
						'Update Available <span class="count">(%s)</span>',
						'Update Available <span class="count">(%s)</span>',
						$count,
						'themes'
					);
					break;
				case 'broken':
					/* translators: %s: Number of themes. */
					$text = _nx(
						'Broken <span class="count">(%s)</span>',
						'Broken <span class="count">(%s)</span>',
						$count,
						'themes'
					);
					break;
				case 'auto-update-enabled':
					/* translators: %s: Number of themes. */
					$text = _n(
						'Auto-updates Enabled <span class="count">(%s)</span>',
						'Auto-updates Enabled <span class="count">(%s)</span>',
						$count
					);
					break;
				case 'auto-update-disabled':
					/* translators: %s: Number of themes. */
					$text = _n(
						'Auto-updates Disabled <span class="count">(%s)</span>',
						'Auto-updates Disabled <span class="count">(%s)</span>',
						$count
					);
					break;
			}

			if ( $this->is_site_themes ) {
				$url = 'site-themes.php?id=' . $this->site_id;
			} else {
				$url = 'themes.php';
			}

			if ( 'search' !== $type ) {
				$status_links[ $type ] = array(
					'url'     => esc_url( add_query_arg( 'theme_status', $type, $url ) ),
					'label'   => sprintf( $text, number_format_i18n( $count ) ),
					'current' => $type === $status,
				);
			}
		}

		return $this->get_views_links( $status_links );
	}

	/**
	 * @global string $status
	 *
	 * @return array
	 */
	protected function get_bulk_actions() {
		global $status;

		$actions = array();
		if ( 'enabled' !== $status ) {
			$actions['enable-selected'] = $this->is_site_themes ? __( 'Enable' ) : __( 'Network Enable' );
		}
		if ( 'disabled' !== $status ) {
			$actions['disable-selected'] = $this->is_site_themes ? __( 'Disable' ) : __( 'Network Disable' );
		}
		if ( ! $this->is_site_themes ) {
			if ( current_user_can( 'update_themes' ) ) {
				$actions['update-selected'] = __( 'Update' );
			}
			if ( current_user_can( 'delete_themes' ) ) {
				$actions['delete-selected'] = __( 'Delete' );
			}
		}

		if ( $this->show_autoupdates ) {
			if ( 'auto-update-enabled' !== $status ) {
				$actions['enable-auto-update-selected'] = __( 'Enable Auto-updates' );
			}

			if ( 'auto-update-disabled' !== $status ) {
				$actions['disable-auto-update-selected'] = __( 'Disable Auto-updates' );
			}
		}

		return $actions;
	}

	/**
	 */
	public function display_rows() {
		foreach ( $this->items as $theme ) {
			$this->single_row( $theme );
		}
	}

	/**
	 * Handles the checkbox column output.
	 *
	 * @since 4.3.0
	 * @since 5.9.0 Renamed `$theme` to `$item` to match parent class for PHP 8 named parameter support.
	 *
	 * @param WP_Theme $item The current WP_Theme object.
	 */
	public function column_cb( $item ) {
		// Restores the more descriptive, specific name for use within this method.
		$theme       = $item;
		$checkbox_id = 'checkbox_' . md5( $theme->get( 'Name' ) );
		?><?php echo esc_attr( $theme->get_stylesheet() ); ?><?php echo $checkbox_id; ?><?php echo $checkbox_id; ?><?php
			printf(
				/* translators: Hidden accessibility text. %s: Theme name */
				__( 'Select %s' ),
				$theme->display( 'Name' )
			);
			?>