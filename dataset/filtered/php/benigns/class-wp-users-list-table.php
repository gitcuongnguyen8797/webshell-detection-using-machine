<?php
/**
 * List Table API: WP_Users_List_Table class
 *
 * @package WordPress
 * @subpackage Administration
 * @since 3.1.0
 */

/**
 * Core class used to implement displaying users in a list table.
 *
 * @since 3.1.0
 *
 * @see WP_List_Table
 */
class WP_Users_List_Table extends WP_List_Table {

	/**
	 * Site ID to generate the Users list table for.
	 *
	 * @since 3.1.0
	 * @var int
	 */
	public $site_id;

	/**
	 * Whether or not the current Users list table is for Multisite.
	 *
	 * @since 3.1.0
	 * @var bool
	 */
	public $is_site_users;

	/**
	 * Constructor.
	 *
	 * @since 3.1.0
	 *
	 * @see WP_List_Table::__construct() for more information on default arguments.
	 *
	 * @param array $args An associative array of arguments.
	 */
	public function __construct( $args = array() ) {
		parent::__construct(
			array(
				'singular' => 'user',
				'plural'   => 'users',
				'screen'   => isset( $args['screen'] ) ? $args['screen'] : null,
			)
		);

		$this->is_site_users = 'site-users-network' === $this->screen->id;

		if ( $this->is_site_users ) {
			$this->site_id = isset( $_REQUEST['id'] ) ? (int) $_REQUEST['id'] : 0;
		}
	}

	/**
	 * Check the current user's permissions.
	 *
	 * @since 3.1.0
	 *
	 * @return bool
	 */
	public function ajax_user_can() {
		if ( $this->is_site_users ) {
			return current_user_can( 'manage_sites' );
		} else {
			return current_user_can( 'list_users' );
		}
	}

	/**
	 * Prepare the users list for display.
	 *
	 * @since 3.1.0
	 *
	 * @global string $role
	 * @global string $usersearch
	 */
	public function prepare_items() {
		global $role, $usersearch;

		$usersearch = isset( $_REQUEST['s'] ) ? wp_unslash( trim( $_REQUEST['s'] ) ) : '';

		$role = isset( $_REQUEST['role'] ) ? $_REQUEST['role'] : '';

		$per_page       = ( $this->is_site_users ) ? 'site_users_network_per_page' : 'users_per_page';
		$users_per_page = $this->get_items_per_page( $per_page );

		$paged = $this->get_pagenum();

		if ( 'none' === $role ) {
			$args = array(
				'number'  => $users_per_page,
				'offset'  => ( $paged - 1 ) * $users_per_page,
				'include' => wp_get_users_with_no_role( $this->site_id ),
				'search'  => $usersearch,
				'fields'  => 'all_with_meta',
			);
		} else {
			$args = array(
				'number' => $users_per_page,
				'offset' => ( $paged - 1 ) * $users_per_page,
				'role'   => $role,
				'search' => $usersearch,
				'fields' => 'all_with_meta',
			);
		}

		if ( '' !== $args['search'] ) {
			$args['search'] = '*' . $args['search'] . '*';
		}

		if ( $this->is_site_users ) {
			$args['blog_id'] = $this->site_id;
		}

		if ( isset( $_REQUEST['orderby'] ) ) {
			$args['orderby'] = $_REQUEST['orderby'];
		}

		if ( isset( $_REQUEST['order'] ) ) {
			$args['order'] = $_REQUEST['order'];
		}

		/**
		 * Filters the query arguments used to retrieve users for the current users list table.
		 *
		 * @since 4.4.0
		 *
		 * @param array $args Arguments passed to WP_User_Query to retrieve items for the current
		 *                    users list table.
		 */
		$args = apply_filters( 'users_list_table_query_args', $args );

		// Query the user IDs for this page.
		$wp_user_search = new WP_User_Query( $args );

		$this->items = $wp_user_search->get_results();

		$this->set_pagination_args(
			array(
				'total_items' => $wp_user_search->get_total(),
				'per_page'    => $users_per_page,
			)
		);
	}

	/**
	 * Output 'no users' message.
	 *
	 * @since 3.1.0
	 */
	public function no_items() {
		_e( 'No users found.' );
	}

	/**
	 * Return an associative array listing all the views that can be used
	 * with this table.
	 *
	 * Provides a list of roles and user count for that role for easy
	 * Filtersing of the user table.
	 *
	 * @since 3.1.0
	 *
	 * @global string $role
	 *
	 * @return string[] An array of HTML links keyed by their view.
	 */
	protected function get_views() {
		global $role;

		$wp_roles = wp_roles();

		$count_users = ! wp_is_large_user_count();

		if ( $this->is_site_users ) {
			$url = 'site-users.php?id=' . $this->site_id;
		} else {
			$url = 'users.php';
		}

		$role_links  = array();
		$avail_roles = array();
		$all_text    = __( 'All' );

		if ( $count_users ) {
			if ( $this->is_site_users ) {
				switch_to_blog( $this->site_id );
				$users_of_blog = count_users( 'time', $this->site_id );
				restore_current_blog();
			} else {
				$users_of_blog = count_users();
			}

			$total_users = $users_of_blog['total_users'];
			$avail_roles =& $users_of_blog['avail_roles'];
			unset( $users_of_blog );

			$all_text = sprintf(
				/* translators: %s: Number of users. */
				_nx(
					'All <span class="count">(%s)</span>',
					'All <span class="count">(%s)</span>',
					$total_users,
					'users'
				),
				number_format_i18n( $total_users )
			);
		}

		$role_links['all'] = array(
			'url'     => $url,
			'label'   => $all_text,
			'current' => empty( $role ),
		);

		foreach ( $wp_roles->get_names() as $this_role => $name ) {
			if ( $count_users && ! isset( $avail_roles[ $this_role ] ) ) {
				continue;
			}

			$name = translate_user_role( $name );
			if ( $count_users ) {
				$name = sprintf(
					/* translators: 1: User role name, 2: Number of users. */
					__( '%1$s <span class="count">(%2$s)</span>' ),
					$name,
					number_format_i18n( $avail_roles[ $this_role ] )
				);
			}

			$role_links[ $this_role ] = array(
				'url'     => esc_url( add_query_arg( 'role', $this_role, $url ) ),
				'label'   => $name,
				'current' => $this_role === $role,
			);
		}

		if ( ! empty( $avail_roles['none'] ) ) {

			$name = __( 'No role' );
			$name = sprintf(
				/* translators: 1: User role name, 2: Number of users. */
				__( '%1$s <span class="count">(%2$s)</span>' ),
				$name,
				number_format_i18n( $avail_roles['none'] )
			);

			$role_links['none'] = array(
				'url'     => esc_url( add_query_arg( 'role', 'none', $url ) ),
				'label'   => $name,
				'current' => 'none' === $role,
			);
		}

		return $this->get_views_links( $role_links );
	}

	/**
	 * Retrieve an associative array of bulk actions available on this table.
	 *
	 * @since 3.1.0
	 *
	 * @return array Array of bulk action labels keyed by their action.
	 */
	protected function get_bulk_actions() {
		$actions = array();

		if ( is_multisite() ) {
			if ( current_user_can( 'remove_users' ) ) {
				$actions['remove'] = __( 'Remove' );
			}
		} else {
			if ( current_user_can( 'delete_users' ) ) {
				$actions['delete'] = __( 'Delete' );
			}
		}

		// Add a password reset link to the bulk actions dropdown.
		if ( current_user_can( 'edit_users' ) ) {
			$actions['resetpassword'] = __( 'Send password reset' );
		}

		return $actions;
	}

	/**
	 * Output the controls to allow user roles to be changed in bulk.
	 *
	 * @since 3.1.0
	 *
	 * @param string $which Whether this is being invoked above ("top")
	 *                      or below the table ("bottom").
	 */
	protected function extra_tablenav( $which ) {
		$id        = 'bottom' === $which ? 'new_role2' : 'new_role';
		$button_id = 'bottom' === $which ? 'changeit2' : 'changeit';
		?><?php if ( current_user_can( 'promote_users' ) && $this->has_items() ) : ?><?php echo $id; ?><?php
			/* translators: Hidden accessibility text. */
			_e( 'Change role to&hellip;' );
			?><?php echo $id; ?><?php echo $id; ?><?php _e( 'Change role to&hellip;' ); ?><?php wp_dropdown_roles(); ?><?php _e( '&mdash; No role for this site &mdash;' ); ?><?php
			submit_button( __( 'Change' ), '', $button_id, false );
		endif;

		/**
		 * Fires just before the closing div containing the bulk role-change controls
		 * in the Users list table.
		 *
		 * @since 3.5.0
		 * @since 4.6.0 The `$which` parameter was added.
		 *
		 * @param string $which The location of the extra table nav markup: 'top' or 'bottom'.
		 */
		do_action( 'restrict_manage_users', $which );
		?>