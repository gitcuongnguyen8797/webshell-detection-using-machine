<?php
/**
 * List Table API: WP_Plugins_List_Table class
 *
 * @package WordPress
 * @subpackage Administration
 * @since 3.1.0
 */

/**
 * Core class used to implement displaying installed plugins in a list table.
 *
 * @since 3.1.0
 *
 * @see WP_List_Table
 */
class WP_Plugins_List_Table extends WP_List_Table {
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
				'plural' => 'plugins',
				'screen' => isset( $args['screen'] ) ? $args['screen'] : null,
			)
		);

		$allowed_statuses = array( 'active', 'inactive', 'recently_activated', 'upgrade', 'mustuse', 'dropins', 'search', 'paused', 'auto-update-enabled', 'auto-update-disabled' );

		$status = 'all';
		if ( isset( $_REQUEST['plugin_status'] ) && in_array( $_REQUEST['plugin_status'], $allowed_statuses, true ) ) {
			$status = $_REQUEST['plugin_status'];
		}

		if ( isset( $_REQUEST['s'] ) ) {
			$_SERVER['REQUEST_URI'] = add_query_arg( 's', wp_unslash( $_REQUEST['s'] ) );
		}

		$page = $this->get_pagenum();

		$this->show_autoupdates = wp_is_auto_update_enabled_for_type( 'plugin' )
			&& current_user_can( 'update_plugins' )
			&& ( ! is_multisite() || $this->screen->in_admin( 'network' ) )
			&& ! in_array( $status, array( 'mustuse', 'dropins' ), true );
	}

	/**
	 * @return array
	 */
	protected function get_table_classes() {
		return array( 'widefat', $this->_args['plural'] );
	}

	/**
	 * @return bool
	 */
	public function ajax_user_can() {
		return current_user_can( 'activate_plugins' );
	}

	/**
	 * @global string $status
	 * @global array  $plugins
	 * @global array  $totals
	 * @global int    $page
	 * @global string $orderby
	 * @global string $order
	 * @global string $s
	 */
	public function prepare_items() {
		global $status, $plugins, $totals, $page, $orderby, $order, $s;

		wp_reset_vars( array( 'orderby', 'order' ) );

		/**
		 * Filters the full array of plugins to list in the Plugins list table.
		 *
		 * @since 3.0.0
		 *
		 * @see get_plugins()
		 *
		 * @param array $all_plugins An array of plugins to display in the list table.
		 */
		$all_plugins = apply_filters( 'all_plugins', get_plugins() );

		$plugins = array(
			'all'                => $all_plugins,
			'search'             => array(),
			'active'             => array(),
			'inactive'           => array(),
			'recently_activated' => array(),
			'upgrade'            => array(),
			'mustuse'            => array(),
			'dropins'            => array(),
			'paused'             => array(),
		);
		if ( $this->show_autoupdates ) {
			$auto_updates = (array) get_site_option( 'auto_update_plugins', array() );

			$plugins['auto-update-enabled']  = array();
			$plugins['auto-update-disabled'] = array();
		}

		$screen = $this->screen;

		if ( ! is_multisite() || ( $screen->in_admin( 'network' ) && current_user_can( 'manage_network_plugins' ) ) ) {

			/**
			 * Filters whether to display the advanced plugins list table.
			 *
			 * There are two types of advanced plugins - must-use and drop-ins -
			 * which can be used in a single site or Multisite network.
			 *
			 * The $type parameter allows you to differentiate between the type of advanced
			 * plugins to filter the display of. Contexts include 'mustuse' and 'dropins'.
			 *
			 * @since 3.0.0
			 *
			 * @param bool   $show Whether to show the advanced plugins for the specified
			 *                     plugin type. Default true.
			 * @param string $type The plugin type. Accepts 'mustuse', 'dropins'.
			 */
			if ( apply_filters( 'show_advanced_plugins', true, 'mustuse' ) ) {
				$plugins['mustuse'] = get_mu_plugins();
			}

			/** This action is documented in wp-admin/includes/class-wp-plugins-list-table.php */
			if ( apply_filters( 'show_advanced_plugins', true, 'dropins' ) ) {
				$plugins['dropins'] = get_dropins();
			}

			if ( current_user_can( 'update_plugins' ) ) {
				$current = get_site_transient( 'update_plugins' );
				foreach ( (array) $plugins['all'] as $plugin_file => $plugin_data ) {
					if ( isset( $current->response[ $plugin_file ] ) ) {
						$plugins['all'][ $plugin_file ]['update'] = true;
						$plugins['upgrade'][ $plugin_file ]       = $plugins['all'][ $plugin_file ];
					}
				}
			}
		}

		if ( ! $screen->in_admin( 'network' ) ) {
			$show = current_user_can( 'manage_network_plugins' );
			/**
			 * Filters whether to display network-active plugins alongside plugins active for the current site.
			 *
			 * This also controls the display of inactive network-only plugins (plugins with
			 * "Network: true" in the plugin header).
			 *
			 * Plugins cannot be network-activated or network-deactivated from this screen.
			 *
			 * @since 4.4.0
			 *
			 * @param bool $show Whether to show network-active plugins. Default is whether the current
			 *                   user can manage network plugins (ie. a Super Admin).
			 */
			$show_network_active = apply_filters( 'show_network_active_plugins', $show );
		}

		if ( $screen->in_admin( 'network' ) ) {
			$recently_activated = get_site_option( 'recently_activated', array() );
		} else {
			$recently_activated = get_option( 'recently_activated', array() );
		}

		foreach ( $recently_activated as $key => $time ) {
			if ( $time + WEEK_IN_SECONDS < time() ) {
				unset( $recently_activated[ $key ] );
			}
		}

		if ( $screen->in_admin( 'network' ) ) {
			update_site_option( 'recently_activated', $recently_activated );
		} else {
			update_option( 'recently_activated', $recently_activated );
		}

		$plugin_info = get_site_transient( 'update_plugins' );

		foreach ( (array) $plugins['all'] as $plugin_file => $plugin_data ) {
			// Extra info if known. array_merge() ensures $plugin_data has precedence if keys collide.
			if ( isset( $plugin_info->response[ $plugin_file ] ) ) {
				$plugin_data = array_merge( (array) $plugin_info->response[ $plugin_file ], array( 'update-supported' => true ), $plugin_data );
			} elseif ( isset( $plugin_info->no_update[ $plugin_file ] ) ) {
				$plugin_data = array_merge( (array) $plugin_info->no_update[ $plugin_file ], array( 'update-supported' => true ), $plugin_data );
			} elseif ( empty( $plugin_data['update-supported'] ) ) {
				$plugin_data['update-supported'] = false;
			}

			/*
			 * Create the payload that's used for the auto_update_plugin filter.
			 * This is the same data contained within $plugin_info->(response|no_update) however
			 * not all plugins will be contained in those keys, this avoids unexpected warnings.
			 */
			$filter_payload = array(
				'id'            => $plugin_file,
				'slug'          => '',
				'plugin'        => $plugin_file,
				'new_version'   => '',
				'url'           => '',
				'package'       => '',
				'icons'         => array(),
				'banners'       => array(),
				'banners_rtl'   => array(),
				'tested'        => '',
				'requires_php'  => '',
				'compatibility' => new stdClass(),
			);

			$filter_payload = (object) wp_parse_args( $plugin_data, $filter_payload );

			$auto_update_forced = wp_is_auto_update_forced_for_item( 'plugin', null, $filter_payload );

			if ( ! is_null( $auto_update_forced ) ) {
				$plugin_data['auto-update-forced'] = $auto_update_forced;
			}

			$plugins['all'][ $plugin_file ] = $plugin_data;
			// Make sure that $plugins['upgrade'] also receives the extra info since it is used on ?plugin_status=upgrade.
			if ( isset( $plugins['upgrade'][ $plugin_file ] ) ) {
				$plugins['upgrade'][ $plugin_file ] = $plugin_data;
			}

			// Filter into individual sections.
			if ( is_multisite() && ! $screen->in_admin( 'network' ) && is_network_only_plugin( $plugin_file ) && ! is_plugin_active( $plugin_file ) ) {
				if ( $show_network_active ) {
					// On the non-network screen, show inactive network-only plugins if allowed.
					$plugins['inactive'][ $plugin_file ] = $plugin_data;
				} else {
					// On the non-network screen, filter out network-only plugins as long as they're not individually active.
					unset( $plugins['all'][ $plugin_file ] );
				}
			} elseif ( ! $screen->in_admin( 'network' ) && is_plugin_active_for_network( $plugin_file ) ) {
				if ( $show_network_active ) {
					// On the non-network screen, show network-active plugins if allowed.
					$plugins['active'][ $plugin_file ] = $plugin_data;
				} else {
					// On the non-network screen, filter out network-active plugins.
					unset( $plugins['all'][ $plugin_file ] );
				}
			} elseif ( ( ! $screen->in_admin( 'network' ) && is_plugin_active( $plugin_file ) )
				|| ( $screen->in_admin( 'network' ) && is_plugin_active_for_network( $plugin_file ) ) ) {
				// On the non-network screen, populate the active list with plugins that are individually activated.
				// On the network admin screen, populate the active list with plugins that are network-activated.
				$plugins['active'][ $plugin_file ] = $plugin_data;

				if ( ! $screen->in_admin( 'network' ) && is_plugin_paused( $plugin_file ) ) {
					$plugins['paused'][ $plugin_file ] = $plugin_data;
				}
			} else {
				if ( isset( $recently_activated[ $plugin_file ] ) ) {
					// Populate the recently activated list with plugins that have been recently activated.
					$plugins['recently_activated'][ $plugin_file ] = $plugin_data;
				}
				// Populate the inactive list with plugins that aren't activated.
				$plugins['inactive'][ $plugin_file ] = $plugin_data;
			}

			if ( $this->show_autoupdates ) {
				$enabled = in_array( $plugin_file, $auto_updates, true ) && $plugin_data['update-supported'];
				if ( isset( $plugin_data['auto-update-forced'] ) ) {
					$enabled = (bool) $plugin_data['auto-update-forced'];
				}

				if ( $enabled ) {
					$plugins['auto-update-enabled'][ $plugin_file ] = $plugin_data;
				} else {
					$plugins['auto-update-disabled'][ $plugin_file ] = $plugin_data;
				}
			}
		}

		if ( strlen( $s ) ) {
			$status            = 'search';
			$plugins['search'] = array_filter( $plugins['all'], array( $this, '_search_callback' ) );
		}

		$totals = array();
		foreach ( $plugins as $type => $list ) {
			$totals[ $type ] = count( $list );
		}

		if ( empty( $plugins[ $status ] ) && ! in_array( $status, array( 'all', 'search' ), true ) ) {
			$status = 'all';
		}

		$this->items = array();
		foreach ( $plugins[ $status ] as $plugin_file => $plugin_data ) {
			// Translate, don't apply markup, sanitize HTML.
			$this->items[ $plugin_file ] = _get_plugin_data_markup_translate( $plugin_file, $plugin_data, false, true );
		}

		$total_this_page = $totals[ $status ];

		$js_plugins = array();
		foreach ( $plugins as $key => $list ) {
			$js_plugins[ $key ] = array_keys( $list );
		}

		wp_localize_script(
			'updates',
			'_wpUpdatesItemCounts',
			array(
				'plugins' => $js_plugins,
				'totals'  => wp_get_update_data(),
			)
		);

		if ( ! $orderby ) {
			$orderby = 'Name';
		} else {
			$orderby = ucfirst( $orderby );
		}

		$order = strtoupper( $order );

		uasort( $this->items, array( $this, '_order_callback' ) );

		$plugins_per_page = $this->get_items_per_page( str_replace( '-', '_', $screen->id . '_per_page' ), 999 );

		$start = ( $page - 1 ) * $plugins_per_page;

		if ( $total_this_page > $plugins_per_page ) {
			$this->items = array_slice( $this->items, $start, $plugins_per_page );
		}

		$this->set_pagination_args(
			array(
				'total_items' => $total_this_page,
				'per_page'    => $plugins_per_page,
			)
		);
	}

	/**
	 * @global string $s URL encoded search term.
	 *
	 * @param array $plugin
	 * @return bool
	 */
	public function _search_callback( $plugin ) {
		global $s;

		foreach ( $plugin as $value ) {
			if ( is_string( $value ) && false !== stripos( strip_tags( $value ), urldecode( $s ) ) ) {
				return true;
			}
		}

		return false;
	}

	/**
	 * @global string $orderby
	 * @global string $order
	 * @param array $plugin_a
	 * @param array $plugin_b
	 * @return int
	 */
	public function _order_callback( $plugin_a, $plugin_b ) {
		global $orderby, $order;

		$a = $plugin_a[ $orderby ];
		$b = $plugin_b[ $orderby ];

		if ( $a === $b ) {
			return 0;
		}

		if ( 'DESC' === $order ) {
			return strcasecmp( $b, $a );
		} else {
			return strcasecmp( $a, $b );
		}
	}

	/**
	 * @global array $plugins
	 */
	public function no_items() {
		global $plugins;

		if ( ! empty( $_REQUEST['s'] ) ) {
			$s = esc_html( urldecode( wp_unslash( $_REQUEST['s'] ) ) );

			/* translators: %s: Plugin search term. */
			printf( __( 'No plugins found for: %s.' ), '<strong>' . $s . '</strong>' );

			// We assume that somebody who can install plugins in multisite is experienced enough to not need this helper link.
			if ( ! is_multisite() && current_user_can( 'install_plugins' ) ) {
				echo ' <a href="' . esc_url( admin_url( 'plugin-install.php?tab=search&s=' . urlencode( $s ) ) ) . '">' . __( 'Search for plugins in the WordPress Plugin Directory.' ) . '</a>';
			}
		} elseif ( ! empty( $plugins['all'] ) ) {
			_e( 'No plugins found.' );
		} else {
			_e( 'No plugins are currently available.' );
		}
	}

	/**
	 * Displays the search box.
	 *
	 * @since 4.6.0
	 *
	 * @param string $text     The 'submit' button label.
	 * @param string $input_id ID attribute value for the search input field.
	 */
	public function search_box( $text, $input_id ) {
		if ( empty( $_REQUEST['s'] ) && ! $this->has_items() ) {
			return;
		}

		$input_id = $input_id . '-search-input';

		if ( ! empty( $_REQUEST['orderby'] ) ) {
			echo '<input type="hidden" name="orderby" value="' . esc_attr( $_REQUEST['orderby'] ) . '" />';
		}
		if ( ! empty( $_REQUEST['order'] ) ) {
			echo '<input type="hidden" name="order" value="' . esc_attr( $_REQUEST['order'] ) . '" />';
		}
		?><?php echo esc_attr( $input_id ); ?><?php echo $text; ?><?php echo esc_attr( $input_id ); ?><?php _admin_search_query(); ?><?php esc_attr_e( 'Search installed plugins...' ); ?><?php submit_button( $text, 'hide-if-js', '', false, array( 'id' => 'search-submit' ) ); ?>