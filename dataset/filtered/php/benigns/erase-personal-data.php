<?php
/**
 * Privacy tools, Erase Personal Data screen.
 *
 * @package WordPress
 * @subpackage Administration
 */

/** WordPress Administration Bootstrap */
require_once __DIR__ . '/admin.php';

if ( ! current_user_can( 'erase_others_personal_data' ) || ! current_user_can( 'delete_users' ) ) {
	wp_die( __( 'Sorry, you are not allowed to erase personal data on this site.' ) );
}

// Used in the HTML title tag.
$title = __( 'Erase Personal Data' );

// Contextual help - choose Help on the top right of admin panel to preview this.
get_current_screen()->add_help_tab(
	array(
		'id'      => 'overview',
		'title'   => __( 'Overview' ),
		'content' =>
					'<p>' . __( 'This screen is where you manage requests to erase personal data.' ) . '</p>' .
					'<p>' . __( 'Privacy Laws around the world require businesses and online services to delete, anonymize, or forget the data they collect about an individual. The rights those laws enshrine are sometimes called the "Right to be Forgotten".' ) . '</p>' .
					'<p>' . __( 'The tool associates data stored in WordPress with a supplied email address, including profile data and comments.' ) . '</p>' .
					'<p><strong>' . __( 'Note: As this tool only gathers data from WordPress and participating plugins, you may need to do more to comply with erasure requests. For example, you are also responsible for ensuring that data collected by or stored with the 3rd party services your organization uses gets deleted.' ) . '</strong></p>',
	)
);

get_current_screen()->add_help_tab(
	array(
		'id'      => 'default-data',
		'title'   => __( 'Default Data' ),
		'content' =>
					'<p>' . __( 'WordPress collects (but <em>never</em> publishes) a limited amount of data from logged-in users but then deletes it or anonymizes it. That data can include: ' ) . '</p>' .
					'<p>' . __( '<strong>Profile Information</strong> &mdash; user email address, username, display name, nickname, first name, last name, description/bio, and registration date.' ) . '</p>' .
					'<p>' . __( '<strong>Community Events Location</strong> &mdash; The IP Address of the user which is used for the Upcoming Community Events shown in the dashboard widget.' ) . '</p>' .
					'<p>' . __( '<strong>Session Tokens</strong> &mdash; User login information, IP Addresses, Expiration Date, User Agent (Browser/OS), and Last Login.' ) . '</p>' .
					'<p>' . __( '<strong>Comments</strong> &mdash; WordPress does not delete comments. The software does anonymize (but, again, <em>never</em> publishes) the associated Email Address, IP Address, and User Agent (Browser/OS).' ) . '</p>' .
					'<p>' . __( '<strong>Media</strong> &mdash; A list of URLs for all media file uploads made by the user.' ) . '</p>',
	)
);

$privacy_policy_guide = '<p>' . sprintf(
	/* translators: %s: URL to Privacy Policy Guide screen. */
	__( 'If you are not sure, check the plugin documentation or contact the plugin author to see if the plugin collects data and if it supports the Data Eraser tool. This information may be available in the <a href="%s">Privacy Policy Guide</a>.' ),
	admin_url( 'options-privacy.php?tab=policyguide' )
) . '</p>';

get_current_screen()->add_help_tab(
	array(
		'id'      => 'plugin-data',
		'title'   => __( 'Plugin Data' ),
		'content' =>
					'<p>' . __( 'Many plugins may collect or store personal data either in the WordPress database or remotely. Any Erase Personal Data request should delete data from plugins as well.' ) . '</p>' .
					'<p>' . __( 'If you are a plugin author, you can <a href="https://developer.wordpress.org/plugins/privacy/adding-the-personal-data-eraser-to-your-plugin/" target="_blank">learn more about how to add support for the Personal Data Eraser to a plugin here</a>.' ) . '</p>' .
					$privacy_policy_guide,
	)
);

get_current_screen()->set_help_sidebar(
	'<p><strong>' . __( 'For more information:' ) . '</strong></p>' .
	'<p>' . __( '<a href="https://wordpress.org/documentation/article/tools-erase-personal-data-screen/">Documentation on Erase Personal Data</a>' ) . '</p>' .
	'<p>' . __( '<a href="https://wordpress.org/support/forums/">Support forums</a>' ) . '</p>'
);

// Handle list table actions.
_wp_personal_data_handle_actions();

// Cleans up failed and expired requests before displaying the list table.
_wp_personal_data_cleanup_requests();

wp_enqueue_script( 'privacy-tools' );

add_screen_option(
	'per_page',
	array(
		'default' => 20,
		'option'  => 'remove_personal_data_requests_per_page',
	)
);

$_list_table_args = array(
	'plural'   => 'privacy_requests',
	'singular' => 'privacy_request',
);

$requests_table = _get_list_table( 'WP_Privacy_Data_Removal_Requests_List_Table', $_list_table_args );

$requests_table->screen->set_screen_reader_content(
	array(
		'heading_views'      => __( 'Filter erase personal data list' ),
		'heading_pagination' => __( 'Erase personal data list navigation' ),
		'heading_list'       => __( 'Erase personal data list' ),
	)
);

$requests_table->process_bulk_action();
$requests_table->prepare_items();

require_once ABSPATH . 'wp-admin/admin-header.php';
?><?php esc_html_e( 'Erase Personal Data' ); ?><?php _e( 'This tool helps site owners comply with local laws and regulations by deleting or anonymizing known data for a given user.' ); ?><?php settings_errors(); ?><?php echo esc_url( admin_url( 'erase-personal-data.php' ) ); ?><?php esc_html_e( 'Add Data Erasure Request' ); ?><?php esc_html_e( 'Username or email address' ); ?><?php _e( 'Confirmation email' ); ?><?php _e( 'Send personal data erasure confirmation email.' ); ?><?php submit_button( __( 'Send Request' ), 'secondary', 'submit', false ); ?><?php wp_nonce_field( 'personal-data-request' ); ?><?php $requests_table->views(); ?><?php $requests_table->search_box( __( 'Search Requests' ), 'requests' ); ?><?php echo isset( $_REQUEST['filter-status'] ) ? esc_attr( sanitize_text_field( $_REQUEST['filter-status'] ) ) : ''; ?><?php echo isset( $_REQUEST['orderby'] ) ? esc_attr( sanitize_text_field( $_REQUEST['orderby'] ) ) : ''; ?><?php echo isset( $_REQUEST['order'] ) ? esc_attr( sanitize_text_field( $_REQUEST['order'] ) ) : ''; ?><?php
		$requests_table->display();
		$requests_table->embed_scripts();
		?>