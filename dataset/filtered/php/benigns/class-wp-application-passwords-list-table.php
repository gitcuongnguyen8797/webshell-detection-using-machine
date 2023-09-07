<?php
/**
 * List Table API: WP_Application_Passwords_List_Table class
 *
 * @package WordPress
 * @subpackage Administration
 * @since 5.6.0
 */

/**
 * Class for displaying the list of application password items.
 *
 * @since 5.6.0
 *
 * @see WP_List_Table
 */
class WP_Application_Passwords_List_Table extends WP_List_Table {

	/**
	 * Gets the list of columns.
	 *
	 * @since 5.6.0
	 *
	 * @return array
	 */
	public function get_columns() {
		return array(
			'name'      => __( 'Name' ),
			'created'   => __( 'Created' ),
			'last_used' => __( 'Last Used' ),
			'last_ip'   => __( 'Last IP' ),
			'revoke'    => __( 'Revoke' ),
		);
	}

	/**
	 * Prepares the list of items for displaying.
	 *
	 * @since 5.6.0
	 *
	 * @global int $user_id User ID.
	 */
	public function prepare_items() {
		global $user_id;
		$this->items = array_reverse( WP_Application_Passwords::get_user_application_passwords( $user_id ) );
	}

	/**
	 * Handles the name column output.
	 *
	 * @since 5.6.0
	 *
	 * @param array $item The current application password item.
	 */
	public function column_name( $item ) {
		echo esc_html( $item['name'] );
	}

	/**
	 * Handles the created column output.
	 *
	 * @since 5.6.0
	 *
	 * @param array $item The current application password item.
	 */
	public function column_created( $item ) {
		if ( empty( $item['created'] ) ) {
			echo '&mdash;';
		} else {
			echo date_i18n( __( 'F j, Y' ), $item['created'] );
		}
	}

	/**
	 * Handles the last used column output.
	 *
	 * @since 5.6.0
	 *
	 * @param array $item The current application password item.
	 */
	public function column_last_used( $item ) {
		if ( empty( $item['last_used'] ) ) {
			echo '&mdash;';
		} else {
			echo date_i18n( __( 'F j, Y' ), $item['last_used'] );
		}
	}

	/**
	 * Handles the last ip column output.
	 *
	 * @since 5.6.0
	 *
	 * @param array $item The current application password item.
	 */
	public function column_last_ip( $item ) {
		if ( empty( $item['last_ip'] ) ) {
			echo '&mdash;';
		} else {
			echo $item['last_ip'];
		}
	}

	/**
	 * Handles the revoke column output.
	 *
	 * @since 5.6.0
	 *
	 * @param array $item The current application password item.
	 */
	public function column_revoke( $item ) {
		$name = 'revoke-application-password-' . $item['uuid'];
		printf(
			'<button type="button" name="%1$s" id="%1$s" class="button delete" aria-label="%2$s">%3$s</button>',
			esc_attr( $name ),
			/* translators: %s: the application password's given name. */
			esc_attr( sprintf( __( 'Revoke "%s"' ), $item['name'] ) ),
			__( 'Revoke' )
		);
	}

	/**
	 * Generates content for a single row of the table
	 *
	 * @since 5.6.0
	 *
	 * @param array  $item        The current item.
	 * @param string $column_name The current column name.
	 */
	protected function column_default( $item, $column_name ) {
		/**
		 * Fires for each custom column in the Application Passwords list table.
		 *
		 * Custom columns are registered using the {@see 'manage_application-passwords-user_columns'} filter.
		 *
		 * @since 5.6.0
		 *
		 * @param string $column_name Name of the custom column.
		 * @param array  $item        The application password item.
		 */
		do_action( "manage_{$this->screen->id}_custom_column", $column_name, $item );
	}

	/**
	 * Generates custom table navigation to prevent conflicting nonces.
	 *
	 * @since 5.6.0
	 *
	 * @param string $which The location of the bulk actions: 'top' or 'bottom'.
	 */
	protected function display_tablenav( $which ) {
		?><?php echo esc_attr( $which ); ?><?php if ( 'bottom' === $which ) : ?><?php _e( 'Revoke all application passwords' ); ?><?php endif; ?><?php $this->bulk_actions( $which ); ?><?php
			$this->extra_tablenav( $which );
			$this->pagination( $which );
			?>