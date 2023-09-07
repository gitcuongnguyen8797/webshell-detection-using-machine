<?php
/**
 * WordPress Customize Widgets classes
 *
 * @package WordPress
 * @subpackage Customize
 * @since 3.9.0
 */

/**
 * Customize Widgets class.
 *
 * Implements widget management in the Customizer.
 *
 * @since 3.9.0
 *
 * @see WP_Customize_Manager
 */
#[AllowDynamicProperties]
final class WP_Customize_Widgets {

	/**
	 * WP_Customize_Manager instance.
	 *
	 * @since 3.9.0
	 * @var WP_Customize_Manager
	 */
	public $manager;

	/**
	 * All id_bases for widgets defined in core.
	 *
	 * @since 3.9.0
	 * @var array
	 */
	protected $core_widget_id_bases = array(
		'archives',
		'calendar',
		'categories',
		'custom_html',
		'links',
		'media_audio',
		'media_image',
		'media_video',
		'meta',
		'nav_menu',
		'pages',
		'recent-comments',
		'recent-posts',
		'rss',
		'search',
		'tag_cloud',
		'text',
	);

	/**
	 * @since 3.9.0
	 * @var array
	 */
	protected $rendered_sidebars = array();

	/**
	 * @since 3.9.0
	 * @var array
	 */
	protected $rendered_widgets = array();

	/**
	 * @since 3.9.0
	 * @var array
	 */
	protected $old_sidebars_widgets = array();

	/**
	 * Mapping of widget ID base to whether it supports selective refresh.
	 *
	 * @since 4.5.0
	 * @var array
	 */
	protected $selective_refreshable_widgets;

	/**
	 * Mapping of setting type to setting ID pattern.
	 *
	 * @since 4.2.0
	 * @var array
	 */
	protected $setting_id_patterns = array(
		'widget_instance' => '/^widget_(?P<id_base>.+?)(?:\[(?P<widget_number>\d+)\])?$/',
		'sidebar_widgets' => '/^sidebars_widgets\[(?P<sidebar_id>.+?)\]$/',
	);

	/**
	 * Initial loader.
	 *
	 * @since 3.9.0
	 *
	 * @param WP_Customize_Manager $manager Customizer bootstrap instance.
	 */
	public function __construct( $manager ) {
		$this->manager = $manager;

		// See https://github.com/xwp/wp-customize-snapshots/blob/962586659688a5b1fd9ae93618b7ce2d4e7a421c/php/class-customize-snapshot-manager.php#L420-L449
		add_filter( 'customize_dynamic_setting_args', array( $this, 'filter_customize_dynamic_setting_args' ), 10, 2 );
		add_action( 'widgets_init', array( $this, 'register_settings' ), 95 );
		add_action( 'customize_register', array( $this, 'schedule_customize_register' ), 1 );

		// Skip remaining hooks when the user can't manage widgets anyway.
		if ( ! current_user_can( 'edit_theme_options' ) ) {
			return;
		}

		add_action( 'wp_loaded', array( $this, 'override_sidebars_widgets_for_theme_switch' ) );
		add_action( 'customize_controls_init', array( $this, 'customize_controls_init' ) );
		add_action( 'customize_controls_enqueue_scripts', array( $this, 'enqueue_scripts' ) );
		add_action( 'customize_controls_print_styles', array( $this, 'print_styles' ) );
		add_action( 'customize_controls_print_scripts', array( $this, 'print_scripts' ) );
		add_action( 'customize_controls_print_footer_scripts', array( $this, 'print_footer_scripts' ) );
		add_action( 'customize_controls_print_footer_scripts', array( $this, 'output_widget_control_templates' ) );
		add_action( 'customize_preview_init', array( $this, 'customize_preview_init' ) );
		add_filter( 'customize_refresh_nonces', array( $this, 'refresh_nonces' ) );
		add_filter( 'should_load_block_editor_scripts_and_styles', array( $this, 'should_load_block_editor_scripts_and_styles' ) );

		add_action( 'dynamic_sidebar', array( $this, 'tally_rendered_widgets' ) );
		add_filter( 'is_active_sidebar', array( $this, 'tally_sidebars_via_is_active_sidebar_calls' ), 10, 2 );
		add_filter( 'dynamic_sidebar_has_widgets', array( $this, 'tally_sidebars_via_dynamic_sidebar_calls' ), 10, 2 );

		// Selective Refresh.
		add_filter( 'customize_dynamic_partial_args', array( $this, 'customize_dynamic_partial_args' ), 10, 2 );
		add_action( 'customize_preview_init', array( $this, 'selective_refresh_init' ) );
	}

	/**
	 * List whether each registered widget can be use selective refresh.
	 *
	 * If the theme does not support the customize-selective-refresh-widgets feature,
	 * then this will always return an empty array.
	 *
	 * @since 4.5.0
	 *
	 * @global WP_Widget_Factory $wp_widget_factory
	 *
	 * @return array Mapping of id_base to support. If theme doesn't support
	 *               selective refresh, an empty array is returned.
	 */
	public function get_selective_refreshable_widgets() {
		global $wp_widget_factory;
		if ( ! current_theme_supports( 'customize-selective-refresh-widgets' ) ) {
			return array();
		}
		if ( ! isset( $this->selective_refreshable_widgets ) ) {
			$this->selective_refreshable_widgets = array();
			foreach ( $wp_widget_factory->widgets as $wp_widget ) {
				$this->selective_refreshable_widgets[ $wp_widget->id_base ] = ! empty( $wp_widget->widget_options['customize_selective_refresh'] );
			}
		}
		return $this->selective_refreshable_widgets;
	}

	/**
	 * Determines if a widget supports selective refresh.
	 *
	 * @since 4.5.0
	 *
	 * @param string $id_base Widget ID Base.
	 * @return bool Whether the widget can be selective refreshed.
	 */
	public function is_widget_selective_refreshable( $id_base ) {
		$selective_refreshable_widgets = $this->get_selective_refreshable_widgets();
		return ! empty( $selective_refreshable_widgets[ $id_base ] );
	}

	/**
	 * Retrieves the widget setting type given a setting ID.
	 *
	 * @since 4.2.0
	 *
	 * @param string $setting_id Setting ID.
	 * @return string|void Setting type.
	 */
	protected function get_setting_type( $setting_id ) {
		static $cache = array();
		if ( isset( $cache[ $setting_id ] ) ) {
			return $cache[ $setting_id ];
		}
		foreach ( $this->setting_id_patterns as $type => $pattern ) {
			if ( preg_match( $pattern, $setting_id ) ) {
				$cache[ $setting_id ] = $type;
				return $type;
			}
		}
	}

	/**
	 * Inspects the incoming customized data for any widget settings, and dynamically adds
	 * them up-front so widgets will be initialized properly.
	 *
	 * @since 4.2.0
	 */
	public function register_settings() {
		$widget_setting_ids   = array();
		$incoming_setting_ids = array_keys( $this->manager->unsanitized_post_values() );
		foreach ( $incoming_setting_ids as $setting_id ) {
			if ( ! is_null( $this->get_setting_type( $setting_id ) ) ) {
				$widget_setting_ids[] = $setting_id;
			}
		}
		if ( $this->manager->doing_ajax( 'update-widget' ) && isset( $_REQUEST['widget-id'] ) ) {
			$widget_setting_ids[] = $this->get_setting_id( wp_unslash( $_REQUEST['widget-id'] ) );
		}

		$settings = $this->manager->add_dynamic_settings( array_unique( $widget_setting_ids ) );

		if ( $this->manager->settings_previewed() ) {
			foreach ( $settings as $setting ) {
				$setting->preview();
			}
		}
	}

	/**
	 * Determines the arguments for a dynamically-created setting.
	 *
	 * @since 4.2.0
	 *
	 * @param false|array $args       The arguments to the WP_Customize_Setting constructor.
	 * @param string      $setting_id ID for dynamic setting, usually coming from `$_POST['customized']`.
	 * @return array|false Setting arguments, false otherwise.
	 */
	public function filter_customize_dynamic_setting_args( $args, $setting_id ) {
		if ( $this->get_setting_type( $setting_id ) ) {
			$args = $this->get_setting_args( $setting_id );
		}
		return $args;
	}

	/**
	 * Retrieves an unslashed post value or return a default.
	 *
	 * @since 3.9.0
	 *
	 * @param string $name          Post value.
	 * @param mixed  $default_value Default post value.
	 * @return mixed Unslashed post value or default value.
	 */
	protected function get_post_value( $name, $default_value = null ) {
		if ( ! isset( $_POST[ $name ] ) ) {
			return $default_value;
		}

		return wp_unslash( $_POST[ $name ] );
	}

	/**
	 * Override sidebars_widgets for theme switch.
	 *
	 * When switching a theme via the Customizer, supply any previously-configured
	 * sidebars_widgets from the target theme as the initial sidebars_widgets
	 * setting. Also store the old theme's existing settings so that they can
	 * be passed along for storing in the sidebars_widgets theme_mod when the
	 * theme gets switched.
	 *
	 * @since 3.9.0
	 *
	 * @global array $sidebars_widgets
	 * @global array $_wp_sidebars_widgets
	 */
	public function override_sidebars_widgets_for_theme_switch() {
		global $sidebars_widgets;

		if ( $this->manager->doing_ajax() || $this->manager->is_theme_active() ) {
			return;
		}

		$this->old_sidebars_widgets = wp_get_sidebars_widgets();
		add_filter( 'customize_value_old_sidebars_widgets_data', array( $this, 'filter_customize_value_old_sidebars_widgets_data' ) );
		$this->manager->set_post_value( 'old_sidebars_widgets_data', $this->old_sidebars_widgets ); // Override any value cached in changeset.

		// retrieve_widgets() looks at the global $sidebars_widgets.
		$sidebars_widgets = $this->old_sidebars_widgets;
		$sidebars_widgets = retrieve_widgets( 'customize' );
		add_filter( 'option_sidebars_widgets', array( $this, 'filter_option_sidebars_widgets_for_theme_switch' ), 1 );
		// Reset global cache var used by wp_get_sidebars_widgets().
		unset( $GLOBALS['_wp_sidebars_widgets'] );
	}

	/**
	 * Filters old_sidebars_widgets_data Customizer setting.
	 *
	 * When switching themes, filter the Customizer setting old_sidebars_widgets_data
	 * to supply initial $sidebars_widgets before they were overridden by retrieve_widgets().
	 * The value for old_sidebars_widgets_data gets set in the old theme's sidebars_widgets
	 * theme_mod.
	 *
	 * @since 3.9.0
	 *
	 * @see WP_Customize_Widgets::handle_theme_switch()
	 *
	 * @param array $old_sidebars_widgets
	 * @return array
	 */
	public function filter_customize_value_old_sidebars_widgets_data( $old_sidebars_widgets ) {
		return $this->old_sidebars_widgets;
	}

	/**
	 * Filters sidebars_widgets option for theme switch.
	 *
	 * When switching themes, the retrieve_widgets() function is run when the Customizer initializes,
	 * and then the new sidebars_widgets here get supplied as the default value for the sidebars_widgets
	 * option.
	 *
	 * @since 3.9.0
	 *
	 * @see WP_Customize_Widgets::handle_theme_switch()
	 * @global array $sidebars_widgets
	 *
	 * @param array $sidebars_widgets
	 * @return array
	 */
	public function filter_option_sidebars_widgets_for_theme_switch( $sidebars_widgets ) {
		$sidebars_widgets                  = $GLOBALS['sidebars_widgets'];
		$sidebars_widgets['array_version'] = 3;
		return $sidebars_widgets;
	}

	/**
	 * Ensures all widgets get loaded into the Customizer.
	 *
	 * Note: these actions are also fired in wp_ajax_update_widget().
	 *
	 * @since 3.9.0
	 */
	public function customize_controls_init() {
		/** This action is documented in wp-admin/includes/ajax-actions.php */
		do_action( 'load-widgets.php' ); // phpcs:ignore WordPress.NamingConventions.ValidHookName.UseUnderscores

		/** This action is documented in wp-admin/includes/ajax-actions.php */
		do_action( 'widgets.php' ); // phpcs:ignore WordPress.NamingConventions.ValidHookName.UseUnderscores

		/** This action is documented in wp-admin/widgets.php */
		do_action( 'sidebar_admin_setup' );
	}

	/**
	 * Ensures widgets are available for all types of previews.
	 *
	 * When in preview, hook to {@see 'customize_register'} for settings after WordPress is loaded
	 * so that all filters have been initialized (e.g. Widget Visibility).
	 *
	 * @since 3.9.0
	 */
	public function schedule_customize_register() {
		if ( is_admin() ) {
			$this->customize_register();
		} else {
			add_action( 'wp', array( $this, 'customize_register' ) );
		}
	}

	/**
	 * Registers Customizer settings and controls for all sidebars and widgets.
	 *
	 * @since 3.9.0
	 *
	 * @global array $wp_registered_widgets
	 * @global array $wp_registered_widget_controls
	 * @global array $wp_registered_sidebars
	 */
	public function customize_register() {
		global $wp_registered_widgets, $wp_registered_widget_controls, $wp_registered_sidebars;

		$use_widgets_block_editor = wp_use_widgets_block_editor();

		add_filter( 'sidebars_widgets', array( $this, 'preview_sidebars_widgets' ), 1 );

		$sidebars_widgets = array_merge(
			array( 'wp_inactive_widgets' => array() ),
			array_fill_keys( array_keys( $wp_registered_sidebars ), array() ),
			wp_get_sidebars_widgets()
		);

		$new_setting_ids = array();

		/*
		 * Register a setting for all widgets, including those which are active,
		 * inactive, and orphaned since a widget may get suppressed from a sidebar
		 * via a plugin (like Widget Visibility).
		 */
		foreach ( array_keys( $wp_registered_widgets ) as $widget_id ) {
			$setting_id   = $this->get_setting_id( $widget_id );
			$setting_args = $this->get_setting_args( $setting_id );
			if ( ! $this->manager->get_setting( $setting_id ) ) {
				$this->manager->add_setting( $setting_id, $setting_args );
			}
			$new_setting_ids[] = $setting_id;
		}

		/*
		 * Add a setting which will be supplied for the theme's sidebars_widgets
		 * theme_mod when the theme is switched.
		 */
		if ( ! $this->manager->is_theme_active() ) {
			$setting_id   = 'old_sidebars_widgets_data';
			$setting_args = $this->get_setting_args(
				$setting_id,
				array(
					'type'  => 'global_variable',
					'dirty' => true,
				)
			);
			$this->manager->add_setting( $setting_id, $setting_args );
		}

		$this->manager->add_panel(
			'widgets',
			array(
				'type'                     => 'widgets',
				'title'                    => __( 'Widgets' ),
				'description'              => __( 'Widgets are independent sections of content that can be placed into widgetized areas provided by your theme (commonly called sidebars).' ),
				'priority'                 => 110,
				'active_callback'          => array( $this, 'is_panel_active' ),
				'auto_expand_sole_section' => true,
				'theme_supports'           => 'widgets',
			)
		);

		foreach ( $sidebars_widgets as $sidebar_id => $sidebar_widget_ids ) {
			if ( empty( $sidebar_widget_ids ) ) {
				$sidebar_widget_ids = array();
			}

			$is_registered_sidebar = is_registered_sidebar( $sidebar_id );
			$is_inactive_widgets   = ( 'wp_inactive_widgets' === $sidebar_id );
			$is_active_sidebar     = ( $is_registered_sidebar && ! $is_inactive_widgets );

			// Add setting for managing the sidebar's widgets.
			if ( $is_registered_sidebar || $is_inactive_widgets ) {
				$setting_id   = sprintf( 'sidebars_widgets[%s]', $sidebar_id );
				$setting_args = $this->get_setting_args( $setting_id );
				if ( ! $this->manager->get_setting( $setting_id ) ) {
					if ( ! $this->manager->is_theme_active() ) {
						$setting_args['dirty'] = true;
					}
					$this->manager->add_setting( $setting_id, $setting_args );
				}
				$new_setting_ids[] = $setting_id;

				// Add section to contain controls.
				$section_id = sprintf( 'sidebar-widgets-%s', $sidebar_id );
				if ( $is_active_sidebar ) {

					$section_args = array(
						'title'      => $wp_registered_sidebars[ $sidebar_id ]['name'],
						'priority'   => array_search( $sidebar_id, array_keys( $wp_registered_sidebars ), true ),
						'panel'      => 'widgets',
						'sidebar_id' => $sidebar_id,
					);

					if ( $use_widgets_block_editor ) {
						$section_args['description'] = '';
					} else {
						$section_args['description'] = $wp_registered_sidebars[ $sidebar_id ]['description'];
					}

					/**
					 * Filters Customizer widget section arguments for a given sidebar.
					 *
					 * @since 3.9.0
					 *
					 * @param array      $section_args Array of Customizer widget section arguments.
					 * @param string     $section_id   Customizer section ID.
					 * @param int|string $sidebar_id   Sidebar ID.
					 */
					$section_args = apply_filters( 'customizer_widgets_section_args', $section_args, $section_id, $sidebar_id );

					$section = new WP_Customize_Sidebar_Section( $this->manager, $section_id, $section_args );
					$this->manager->add_section( $section );

					if ( $use_widgets_block_editor ) {
						$control = new WP_Sidebar_Block_Editor_Control(
							$this->manager,
							$setting_id,
							array(
								'section'     => $section_id,
								'sidebar_id'  => $sidebar_id,
								'label'       => $section_args['title'],
								'description' => $section_args['description'],
							)
						);
					} else {
						$control = new WP_Widget_Area_Customize_Control(
							$this->manager,
							$setting_id,
							array(
								'section'    => $section_id,
								'sidebar_id' => $sidebar_id,
								'priority'   => count( $sidebar_widget_ids ), // place 'Add Widget' and 'Reorder' buttons at end.
							)
						);
					}

					$this->manager->add_control( $control );

					$new_setting_ids[] = $setting_id;
				}
			}

			if ( ! $use_widgets_block_editor ) {
				// Add a control for each active widget (located in a sidebar).
				foreach ( $sidebar_widget_ids as $i => $widget_id ) {

					// Skip widgets that may have gone away due to a plugin being deactivated.
					if ( ! $is_active_sidebar || ! isset( $wp_registered_widgets[ $widget_id ] ) ) {
						continue;
					}

					$registered_widget = $wp_registered_widgets[ $widget_id ];
					$setting_id        = $this->get_setting_id( $widget_id );
					$id_base           = $wp_registered_widget_controls[ $widget_id ]['id_base'];

					$control = new WP_Widget_Form_Customize_Control(
						$this->manager,
						$setting_id,
						array(
							'label'          => $registered_widget['name'],
							'section'        => $section_id,
							'sidebar_id'     => $sidebar_id,
							'widget_id'      => $widget_id,
							'widget_id_base' => $id_base,
							'priority'       => $i,
							'width'          => $wp_registered_widget_controls[ $widget_id ]['width'],
							'height'         => $wp_registered_widget_controls[ $widget_id ]['height'],
							'is_wide'        => $this->is_wide_widget( $widget_id ),
						)
					);
					$this->manager->add_control( $control );
				}
			}
		}

		if ( $this->manager->settings_previewed() ) {
			foreach ( $new_setting_ids as $new_setting_id ) {
				$this->manager->get_setting( $new_setting_id )->preview();
			}
		}
	}

	/**
	 * Determines whether the widgets panel is active, based on whether there are sidebars registered.
	 *
	 * @since 4.4.0
	 *
	 * @see WP_Customize_Panel::$active_callback
	 *
	 * @global array $wp_registered_sidebars
	 * @return bool Active.
	 */
	public function is_panel_active() {
		global $wp_registered_sidebars;
		return ! empty( $wp_registered_sidebars );
	}

	/**
	 * Converts a widget_id into its corresponding Customizer setting ID (option name).
	 *
	 * @since 3.9.0
	 *
	 * @param string $widget_id Widget ID.
	 * @return string Maybe-parsed widget ID.
	 */
	public function get_setting_id( $widget_id ) {
		$parsed_widget_id = $this->parse_widget_id( $widget_id );
		$setting_id       = sprintf( 'widget_%s', $parsed_widget_id['id_base'] );

		if ( ! is_null( $parsed_widget_id['number'] ) ) {
			$setting_id .= sprintf( '[%d]', $parsed_widget_id['number'] );
		}
		return $setting_id;
	}

	/**
	 * Determines whether the widget is considered "wide".
	 *
	 * Core widgets which may have controls wider than 250, but can still be shown
	 * in the narrow Customizer panel. The RSS and Text widgets in Core, for example,
	 * have widths of 400 and yet they still render fine in the Customizer panel.
	 *
	 * This method will return all Core widgets as being not wide, but this can be
	 * overridden with the {@see 'is_wide_widget_in_customizer'} filter.
	 *
	 * @since 3.9.0
	 *
	 * @global array $wp_registered_widget_controls
	 *
	 * @param string $widget_id Widget ID.
	 * @return bool Whether or not the widget is a "wide" widget.
	 */
	public function is_wide_widget( $widget_id ) {
		global $wp_registered_widget_controls;

		$parsed_widget_id = $this->parse_widget_id( $widget_id );
		$width            = $wp_registered_widget_controls[ $widget_id ]['width'];
		$is_core          = in_array( $parsed_widget_id['id_base'], $this->core_widget_id_bases, true );
		$is_wide          = ( $width > 250 && ! $is_core );

		/**
		 * Filters whether the given widget is considered "wide".
		 *
		 * @since 3.9.0
		 *
		 * @param bool   $is_wide   Whether the widget is wide, Default false.
		 * @param string $widget_id Widget ID.
		 */
		return apply_filters( 'is_wide_widget_in_customizer', $is_wide, $widget_id );
	}

	/**
	 * Converts a widget ID into its id_base and number components.
	 *
	 * @since 3.9.0
	 *
	 * @param string $widget_id Widget ID.
	 * @return array Array containing a widget's id_base and number components.
	 */
	public function parse_widget_id( $widget_id ) {
		$parsed = array(
			'number'  => null,
			'id_base' => null,
		);

		if ( preg_match( '/^(.+)-(\d+)$/', $widget_id, $matches ) ) {
			$parsed['id_base'] = $matches[1];
			$parsed['number']  = (int) $matches[2];
		} else {
			// Likely an old single widget.
			$parsed['id_base'] = $widget_id;
		}
		return $parsed;
	}

	/**
	 * Converts a widget setting ID (option path) to its id_base and number components.
	 *
	 * @since 3.9.0
	 *
	 * @param string $setting_id Widget setting ID.
	 * @return array|WP_Error Array containing a widget's id_base and number components,
	 *                        or a WP_Error object.
	 */
	public function parse_widget_setting_id( $setting_id ) {
		if ( ! preg_match( '/^(widget_(.+?))(?:\[(\d+)\])?$/', $setting_id, $matches ) ) {
			return new WP_Error( 'widget_setting_invalid_id' );
		}

		$id_base = $matches[2];
		$number  = isset( $matches[3] ) ? (int) $matches[3] : null;

		return compact( 'id_base', 'number' );
	}

	/**
	 * Calls admin_print_styles-widgets.php and admin_print_styles hooks to
	 * allow custom styles from plugins.
	 *
	 * @since 3.9.0
	 */
	public function print_styles() {
		/** This action is documented in wp-admin/admin-header.php */
		do_action( 'admin_print_styles-widgets.php' ); // phpcs:ignore WordPress.NamingConventions.ValidHookName.UseUnderscores

		/** This action is documented in wp-admin/admin-header.php */
		do_action( 'admin_print_styles' );
	}

	/**
	 * Calls admin_print_scripts-widgets.php and admin_print_scripts hooks to
	 * allow custom scripts from plugins.
	 *
	 * @since 3.9.0
	 */
	public function print_scripts() {
		/** This action is documented in wp-admin/admin-header.php */
		do_action( 'admin_print_scripts-widgets.php' ); // phpcs:ignore WordPress.NamingConventions.ValidHookName.UseUnderscores

		/** This action is documented in wp-admin/admin-header.php */
		do_action( 'admin_print_scripts' );
	}

	/**
	 * Enqueues scripts and styles for Customizer panel and export data to JavaScript.
	 *
	 * @since 3.9.0
	 *
	 * @global WP_Scripts $wp_scripts
	 * @global array $wp_registered_sidebars
	 * @global array $wp_registered_widgets
	 */
	public function enqueue_scripts() {
		global $wp_scripts, $wp_registered_sidebars, $wp_registered_widgets;

		wp_enqueue_style( 'customize-widgets' );
		wp_enqueue_script( 'customize-widgets' );

		/** This action is documented in wp-admin/admin-header.php */
		do_action( 'admin_enqueue_scripts', 'widgets.php' );

		/*
		 * Export available widgets with control_tpl removed from model
		 * since plugins need templates to be in the DOM.
		 */
		$available_widgets = array();

		foreach ( $this->get_available_widgets() as $available_widget ) {
			unset( $available_widget['control_tpl'] );
			$available_widgets[] = $available_widget;
		}

		$widget_reorder_nav_tpl = sprintf(
			'<div class="widget-reorder-nav"><span class="move-widget" tabindex="0">%1$s</span><span class="move-widget-down" tabindex="0">%2$s</span><span class="move-widget-up" tabindex="0">%3$s</span></div>',
			__( 'Move to another area&hellip;' ),
			__( 'Move down' ),
			__( 'Move up' )
		);

		$move_widget_area_tpl = str_replace(
			array( '{description}', '{btn}' ),
			array(
				__( 'Select an area to move this widget into:' ),
				_x( 'Move', 'Move widget' ),
			),
			'<div class="move-widget-area">
				<p class="description">{description}</p>
				<ul class="widget-area-select">
					<% _.each( sidebars, function ( sidebar ){ %>
						<li class="" data-id="<%- sidebar.id %>" title="<%- sidebar.description %>" tabindex="0"><%- sidebar.name %></li>
					<% }); %>
				</ul>
				<div class="move-widget-actions">
					<button class="move-widget-btn button" type="button">{btn}</button>
				</div>
			</div>'
		);

		/*
		 * Gather all strings in PHP that may be needed by JS on the client.
		 * Once JS i18n is implemented (in #20491), this can be removed.
		 */
		$some_non_rendered_areas_messages    = array();
		$some_non_rendered_areas_messages[1] = html_entity_decode(
			__( 'Your theme has 1 other widget area, but this particular page does not display it.' ),
			ENT_QUOTES,
			get_bloginfo( 'charset' )
		);
		$registered_sidebar_count            = count( $wp_registered_sidebars );
		for ( $non_rendered_count = 2; $non_rendered_count < $registered_sidebar_count; $non_rendered_count++ ) {
			$some_non_rendered_areas_messages[ $non_rendered_count ] = html_entity_decode(
				sprintf(
					/* translators: %s: The number of other widget areas registered but not rendered. */
					_n(
						'Your theme has %s other widget area, but this particular page does not display it.',
						'Your theme has %s other widget areas, but this particular page does not display them.',
						$non_rendered_count
					),
					number_format_i18n( $non_rendered_count )
				),
				ENT_QUOTES,
				get_bloginfo( 'charset' )
			);
		}

		if ( 1 === $registered_sidebar_count ) {
			$no_areas_shown_message = html_entity_decode(
				sprintf(
					__( 'Your theme has 1 widget area, but this particular page does not display it.' )
				),
				ENT_QUOTES,
				get_bloginfo( 'charset' )
			);
		} else {
			$no_areas_shown_message = html_entity_decode(
				sprintf(
					/* translators: %s: The total number of widget areas registered. */
					_n(
						'Your theme has %s widget area, but this particular page does not display it.',
						'Your theme has %s widget areas, but this particular page does not display them.',
						$registered_sidebar_count
					),
					number_format_i18n( $registered_sidebar_count )
				),
				ENT_QUOTES,
				get_bloginfo( 'charset' )
			);
		}

		$settings = array(
			'registeredSidebars'          => array_values( $wp_registered_sidebars ),
			'registeredWidgets'           => $wp_registered_widgets,
			'availableWidgets'            => $available_widgets, // @todo Merge this with registered_widgets.
			'l10n'                        => array(
				'saveBtnLabel'     => __( 'Apply' ),
				'saveBtnTooltip'   => __( 'Save and preview changes before publishing them.' ),
				'removeBtnLabel'   => __( 'Remove' ),
				'removeBtnTooltip' => __( 'Keep widget settings and move it to the inactive widgets' ),
				'error'            => __( 'An error has occurred. Please reload the page and try again.' ),
				'widgetMovedUp'    => __( 'Widget moved up' ),
				'widgetMovedDown'  => __( 'Widget moved down' ),
				'navigatePreview'  => __( 'You can navigate to other pages on your site while using the Customizer to view and edit the widgets displayed on those pages.' ),
				'someAreasShown'   => $some_non_rendered_areas_messages,
				'noAreasShown'     => $no_areas_shown_message,
				'reorderModeOn'    => __( 'Reorder mode enabled' ),
				'reorderModeOff'   => __( 'Reorder mode closed' ),
				'reorderLabelOn'   => esc_attr__( 'Reorder widgets' ),
				/* translators: %d: The number of widgets found. */
				'widgetsFound'     => __( 'Number of widgets found: %d' ),
				'noWidgetsFound'   => __( 'No widgets found.' ),
			),
			'tpl'                         => array(
				'widgetReorderNav' => $widget_reorder_nav_tpl,
				'moveWidgetArea'   => $move_widget_area_tpl,
			),
			'selectiveRefreshableWidgets' => $this->get_selective_refreshable_widgets(),
		);

		foreach ( $settings['registeredWidgets'] as &$registered_widget ) {
			unset( $registered_widget['callback'] ); // May not be JSON-serializeable.
		}

		$wp_scripts->add_data(
			'customize-widgets',
			'data',
			sprintf( 'var _wpCustomizeWidgetsSettings = %s;', wp_json_encode( $settings ) )
		);

		/*
		 * TODO: Update 'wp-customize-widgets' to not rely so much on things in
		 * 'customize-widgets'. This will let us skip most of the above and not
		 * enqueue 'customize-widgets' which saves bytes.
		 */

		if ( wp_use_widgets_block_editor() ) {
			$block_editor_context = new WP_Block_Editor_Context(
				array(
					'name' => 'core/customize-widgets',
				)
			);

			$editor_settings = get_block_editor_settings(
				get_legacy_widget_block_editor_settings(),
				$block_editor_context
			);

			wp_add_inline_script(
				'wp-customize-widgets',
				sprintf(
					'wp.domReady( function() {
					   wp.customizeWidgets.initialize( "widgets-customizer", %s );
					} );',
					wp_json_encode( $editor_settings )
				)
			);

			// Preload server-registered block schemas.
			wp_add_inline_script(
				'wp-blocks',
				'wp.blocks.unstable__bootstrapServerSideBlockDefinitions(' . wp_json_encode( get_block_editor_server_block_settings() ) . ');'
			);

			wp_add_inline_script(
				'wp-blocks',
				sprintf( 'wp.blocks.setCategories( %s );', wp_json_encode( get_block_categories( $block_editor_context ) ) ),
				'after'
			);

			wp_enqueue_script( 'wp-customize-widgets' );
			wp_enqueue_style( 'wp-customize-widgets' );

			/** This action is documented in edit-form-blocks.php */
			do_action( 'enqueue_block_editor_assets' );
		}
	}

	/**
	 * Renders the widget form control templates into the DOM.
	 *
	 * @since 3.9.0
	 */
	public function output_widget_control_templates() {
		?><?php
						/* translators: Hidden accessibility text. */
						_e( 'Back' );
						?><?php
						/* translators: &#9656; is the unicode right-pointing triangle. %s: Section title in the Customizer. */
						printf( __( 'Customizing &#9656; %s' ), esc_html( $this->manager->get_panel( 'widgets' )->title ) );
					?><?php _e( 'Add a Widget' ); ?><?php
					/* translators: Hidden accessibility text. */
					_e( 'Search Widgets' );
					?><?php esc_attr_e( 'Search widgets&hellip;' ); ?><?php
					/* translators: Hidden accessibility text. */
					_e( 'Clear Results' );
					?><?php
					/* translators: Hidden accessibility text. */
					_e( 'The search results will be updated as you type.' );
					?><?php foreach ( $this->get_available_widgets() as $available_widget ) : ?><?php echo esc_attr( $available_widget['id'] ); ?><?php echo esc_attr( $available_widget['id'] ); ?><?php echo esc_attr( $available_widget['id'] ); ?><?php echo $available_widget['control_tpl']; ?><?php endforeach; ?><?php _e( 'No widgets found.' ); ?><?php
	}

	/**
	 * Calls admin_print_footer_scripts and admin_print_scripts hooks to
	 * allow custom scripts from plugins.
	 *
	 * @since 3.9.0
	 */
	public function print_footer_scripts() {
		/** This action is documented in wp-admin/admin-footer.php */
		do_action( 'admin_print_footer_scripts-widgets.php' ); // phpcs:ignore WordPress.NamingConventions.ValidHookName.UseUnderscores

		/** This action is documented in wp-admin/admin-footer.php */
		do_action( 'admin_print_footer_scripts' );

		/** This action is documented in wp-admin/admin-footer.php */
		do_action( 'admin_footer-widgets.php' ); // phpcs:ignore WordPress.NamingConventions.ValidHookName.UseUnderscores
	}

	/**
	 * Retrieves common arguments to supply when constructing a Customizer setting.
	 *
	 * @since 3.9.0
	 *
	 * @param string $id        Widget setting ID.
	 * @param array  $overrides Array of setting overrides.
	 * @return array Possibly modified setting arguments.
	 */
	public function get_setting_args( $id, $overrides = array() ) {
		$args = array(
			'type'       => 'option',
			'capability' => 'edit_theme_options',
			'default'    => array(),
		);

		if ( preg_match( $this->setting_id_patterns['sidebar_widgets'], $id, $matches ) ) {
			$args['sanitize_callback']    = array( $this, 'sanitize_sidebar_widgets' );
			$args['sanitize_js_callback'] = array( $this, 'sanitize_sidebar_widgets_js_instance' );
			$args['transport']            = current_theme_supports( 'customize-selective-refresh-widgets' ) ? 'postMessage' : 'refresh';
		} elseif ( preg_match( $this->setting_id_patterns['widget_instance'], $id, $matches ) ) {
			$id_base                      = $matches['id_base'];
			$args['sanitize_callback']    = function( $value ) use ( $id_base ) {
				return $this->sanitize_widget_instance( $value, $id_base );
			};
			$args['sanitize_js_callback'] = function( $value ) use ( $id_base ) {
				return $this->sanitize_widget_js_instance( $value, $id_base );
			};
			$args['transport']            = $this->is_widget_selective_refreshable( $matches['id_base'] ) ? 'postMessage' : 'refresh';
		}

		$args = array_merge( $args, $overrides );

		/**
		 * Filters the common arguments supplied when constructing a Customizer setting.
		 *
		 * @since 3.9.0
		 *
		 * @see WP_Customize_Setting
		 *
		 * @param array  $args Array of Customizer setting arguments.
		 * @param string $id   Widget setting ID.
		 */
		return apply_filters( 'widget_customizer_setting_args', $args, $id );
	}

	/**
	 * Ensures sidebar widget arrays only ever contain widget IDS.
	 *
	 * Used as the 'sanitize_callback' for each $sidebars_widgets setting.
	 *
	 * @since 3.9.0
	 *
	 * @param string[] $widget_ids Array of widget IDs.
	 * @return string[] Array of sanitized widget IDs.
	 */
	public function sanitize_sidebar_widgets( $widget_ids ) {
		$widget_ids           = array_map( 'strval', (array) $widget_ids );
		$sanitized_widget_ids = array();
		foreach ( $widget_ids as $widget_id ) {
			$sanitized_widget_ids[] = preg_replace( '/[^a-z0-9_\-]/', '', $widget_id );
		}
		return $sanitized_widget_ids;
	}

	/**
	 * Builds up an index of all available widgets for use in Backbone models.
	 *
	 * @since 3.9.0
	 *
	 * @global array $wp_registered_widgets
	 * @global array $wp_registered_widget_controls
	 *
	 * @see wp_list_widgets()
	 *
	 * @return array List of available widgets.
	 */
	public function get_available_widgets() {
		static $available_widgets = array();
		if ( ! empty( $available_widgets ) ) {
			return $available_widgets;
		}

		global $wp_registered_widgets, $wp_registered_widget_controls;
		require_once ABSPATH . 'wp-admin/includes/widgets.php'; // For next_widget_id_number().

		$sort = $wp_registered_widgets;
		usort( $sort, array( $this, '_sort_name_callback' ) );
		$done = array();

		foreach ( $sort as $widget ) {
			if ( in_array( $widget['callback'], $done, true ) ) { // We already showed this multi-widget.
				continue;
			}

			$sidebar = is_active_widget( $widget['callback'], $widget['id'], false, false );
			$done[]  = $widget['callback'];

			if ( ! isset( $widget['params'][0] ) ) {
				$widget['params'][0] = array();
			}

			$available_widget = $widget;
			unset( $available_widget['callback'] ); // Not serializable to JSON.

			$args = array(
				'widget_id'   => $widget['id'],
				'widget_name' => $widget['name'],
				'_display'    => 'template',
			);

			$is_disabled     = false;
			$is_multi_widget = ( isset( $wp_registered_widget_controls[ $widget['id'] ]['id_base'] ) && isset( $widget['params'][0]['number'] ) );
			if ( $is_multi_widget ) {
				$id_base            = $wp_registered_widget_controls[ $widget['id'] ]['id_base'];
				$args['_temp_id']   = "$id_base-__i__";
				$args['_multi_num'] = next_widget_id_number( $id_base );
				$args['_add']       = 'multi';
			} else {
				$args['_add'] = 'single';

				if ( $sidebar && 'wp_inactive_widgets' !== $sidebar ) {
					$is_disabled = true;
				}
				$id_base = $widget['id'];
			}

			$list_widget_controls_args = wp_list_widget_controls_dynamic_sidebar(
				array(
					0 => $args,
					1 => $widget['params'][0],
				)
			);
			$control_tpl               = $this->get_widget_control( $list_widget_controls_args );

			// The properties here are mapped to the Backbone Widget model.
			$available_widget = array_merge(
				$available_widget,
				array(
					'temp_id'      => isset( $args['_temp_id'] ) ? $args['_temp_id'] : null,
					'is_multi'     => $is_multi_widget,
					'control_tpl'  => $control_tpl,
					'multi_number' => ( 'multi' === $args['_add'] ) ? $args['_multi_num'] : false,
					'is_disabled'  => $is_disabled,
					'id_base'      => $id_base,
					'transport'    => $this->is_widget_selective_refreshable( $id_base ) ? 'postMessage' : 'refresh',
					'width'        => $wp_registered_widget_controls[ $widget['id'] ]['width'],
					'height'       => $wp_registered_widget_controls[ $widget['id'] ]['height'],
					'is_wide'      => $this->is_wide_widget( $widget['id'] ),
				)
			);

			$available_widgets[] = $available_widget;
		}

		return $available_widgets;
	}

	/**
	 * Naturally orders available widgets by name.
	 *
	 * @since 3.9.0
	 *
	 * @param array $widget_a The first widget to compare.
	 * @param array $widget_b The second widget to compare.
	 * @return int Reorder position for the current widget comparison.
	 */
	protected function _sort_name_callback( $widget_a, $widget_b ) {
		return strnatcasecmp( $widget_a['name'], $widget_b['name'] );
	}

	/**
	 * Retrieves the widget control markup.
	 *
	 * @since 3.9.0
	 *
	 * @param array $args Widget control arguments.
	 * @return string Widget control form HTML markup.
	 */
	public function get_widget_control( $args ) {
		$args[0]['before_form']           = '<div class="form">';
		$args[0]['after_form']            = '</div><!-- .form -->';
		$args[0]['before_widget_content'] = '<div class="widget-content">';
		$args[0]['after_widget_content']  = '</div><!-- .widget-content -->';
		ob_start();
		wp_widget_control( ...$args );
		$control_tpl = ob_get_clean();
		return $control_tpl;
	}

	/**
	 * Retrieves the widget control markup parts.
	 *
	 * @since 4.4.0
	 *
	 * @param array $args Widget control arguments.
	 * @return array {
	 *     @type string $control Markup for widget control wrapping form.
	 *     @type string $content The contents of the widget form itself.
	 * }
	 */
	public function get_widget_control_parts( $args ) {
		$args[0]['before_widget_content'] = '<div class="widget-content">';
		$args[0]['after_widget_content']  = '</div><!-- .widget-content -->';
		$control_markup                   = $this->get_widget_control( $args );

		$content_start_pos = strpos( $control_markup, $args[0]['before_widget_content'] );
		$content_end_pos   = strrpos( $control_markup, $args[0]['after_widget_content'] );

		$control  = substr( $control_markup, 0, $content_start_pos + strlen( $args[0]['before_widget_content'] ) );
		$control .= substr( $control_markup, $content_end_pos );
		$content  = trim(
			substr(
				$control_markup,
				$content_start_pos + strlen( $args[0]['before_widget_content'] ),
				$content_end_pos - $content_start_pos - strlen( $args[0]['before_widget_content'] )
			)
		);

		return compact( 'control', 'content' );
	}

	/**
	 * Adds hooks for the Customizer preview.
	 *
	 * @since 3.9.0
	 */
	public function customize_preview_init() {
		add_action( 'wp_enqueue_scripts', array( $this, 'customize_preview_enqueue' ) );
		add_action( 'wp_print_styles', array( $this, 'print_preview_css' ), 1 );
		add_action( 'wp_footer', array( $this, 'export_preview_data' ), 20 );
	}

	/**
	 * Refreshes the nonce for widget updates.
	 *
	 * @since 4.2.0
	 *
	 * @param array $nonces Array of nonces.
	 * @return array Array of nonces.
	 */
	public function refresh_nonces( $nonces ) {
		$nonces['update-widget'] = wp_create_nonce( 'update-widget' );
		return $nonces;
	}

	/**
	 * Tells the script loader to load the scripts and styles of custom blocks
	 * if the widgets block editor is enabled.
	 *
	 * @since 5.8.0
	 *
	 * @param bool $is_block_editor_screen Current decision about loading block assets.
	 * @return bool Filtered decision about loading block assets.
	 */
	public function should_load_block_editor_scripts_and_styles( $is_block_editor_screen ) {
		if ( wp_use_widgets_block_editor() ) {
			return true;
		}

		return $is_block_editor_screen;
	}

	/**
	 * When previewing, ensures the proper previewing widgets are used.
	 *
	 * Because wp_get_sidebars_widgets() gets called early at {@see 'init' } (via
	 * wp_convert_widget_settings()) and can set global variable `$_wp_sidebars_widgets`
	 * to the value of `get_option( 'sidebars_widgets' )` before the Customizer preview
	 * filter is added, it has to be reset after the filter has been added.
	 *
	 * @since 3.9.0
	 *
	 * @param array $sidebars_widgets List of widgets for the current sidebar.
	 * @return array
	 */
	public function preview_sidebars_widgets( $sidebars_widgets ) {
		$sidebars_widgets = get_option( 'sidebars_widgets', array() );

		unset( $sidebars_widgets['array_version'] );
		return $sidebars_widgets;
	}

	/**
	 * Enqueues scripts for the Customizer preview.
	 *
	 * @since 3.9.0
	 */
	public function customize_preview_enqueue() {
		wp_enqueue_script( 'customize-preview-widgets' );
	}

	/**
	 * Inserts default style for highlighted widget at early point so theme
	 * stylesheet can override.
	 *
	 * @since 3.9.0
	 */
	public function print_preview_css() {
		?><?php
	}

	/**
	 * Communicates the sidebars that appeared on the page at the very end of the page,
	 * and at the very end of the wp_footer,
	 *
	 * @since 3.9.0
	 *
	 * @global array $wp_registered_sidebars
	 * @global array $wp_registered_widgets
	 */
	public function export_preview_data() {
		global $wp_registered_sidebars, $wp_registered_widgets;

		$switched_locale = switch_to_user_locale( get_current_user_id() );

		$l10n = array(
			'widgetTooltip' => __( 'Shift-click to edit this widget.' ),
		);

		if ( $switched_locale ) {
			restore_previous_locale();
		}

		$rendered_sidebars = array_filter( $this->rendered_sidebars );
		$rendered_widgets  = array_filter( $this->rendered_widgets );

		// Prepare Customizer settings to pass to JavaScript.
		$settings = array(
			'renderedSidebars'            => array_fill_keys( array_keys( $rendered_sidebars ), true ),
			'renderedWidgets'             => array_fill_keys( array_keys( $rendered_widgets ), true ),
			'registeredSidebars'          => array_values( $wp_registered_sidebars ),
			'registeredWidgets'           => $wp_registered_widgets,
			'l10n'                        => $l10n,
			'selectiveRefreshableWidgets' => $this->get_selective_refreshable_widgets(),
		);

		foreach ( $settings['registeredWidgets'] as &$registered_widget ) {
			unset( $registered_widget['callback'] ); // May not be JSON-serializeable.
		}

		?><?php echo wp_json_encode( $settings ); ?>