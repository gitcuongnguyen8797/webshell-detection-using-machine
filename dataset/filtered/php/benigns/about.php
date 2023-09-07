<?php
/**
 * About This Version administration panel.
 *
 * @package WordPress
 * @subpackage Administration
 */

/** WordPress Administration Bootstrap */
require_once __DIR__ . '/admin.php';

// Used in the HTML title tag.
/* translators: Page title of the About WordPress page in the admin. */
$title = _x( 'About', 'page title' );

list( $display_version ) = explode( '-', get_bloginfo( 'version' ) );

require_once ABSPATH . 'wp-admin/admin-header.php';
?><?php
					printf(
						/* translators: %s: Version number. */
						__( 'WordPress %s' ),
						str_replace( '.', '<span>.</span>', $display_version )
					);
					?><?php esc_attr_e( 'Secondary menu' ); ?><?php _e( 'What&#8217;s New' ); ?><?php _e( 'Credits' ); ?><?php _e( 'Freedoms' ); ?><?php _e( 'Privacy' ); ?><?php _e( 'Maintenance and Security Releases' ); ?><?php
					printf(
						/* translators: 1: WordPress version number, 2: Plural number of bugs. More than one security issue. */
						_n(
							'<strong>Version %1$s</strong> addressed a security issue and fixed %2$s bug.',
							'<strong>Version %1$s</strong> addressed a security issue and fixed %2$s bugs.',
							1
						),
						'6.2.2',
						'1'
					);
					?><?php
					printf(
						/* translators: %s: HelpHub URL. */
						__( 'For more information, see <a href="%s">the release notes</a>.' ),
						sprintf(
							/* translators: %s: WordPress version. */
							esc_url( __( 'https://wordpress.org/support/wordpress-version/version-%s/' ) ),
							sanitize_title( '6.2.2' )
						)
					);
					?><?php
					printf(
						/* translators: 1: WordPress version number, 2: Plural number of bugs. More than one security issue. */
						_n(
							'<strong>Version %1$s</strong> addressed some security issues and fixed %2$s bug.',
							'<strong>Version %1$s</strong> addressed some security issues and fixed %2$s bugs.',
							30
						),
						'6.2.1',
						'30'
					);
					?><?php
					printf(
						/* translators: %s: HelpHub URL. */
						__( 'For more information, see <a href="%s">the release notes</a>.' ),
						sprintf(
							/* translators: %s: WordPress version. */
							esc_url( __( 'https://wordpress.org/support/wordpress-version/version-%s/' ) ),
							sanitize_title( '6.2.1' )
						)
					);
					?><?php
					printf(
						/* translators: %s: Version number. */
						__( 'Welcome to WordPress %s' ),
						$display_version
					);
					?><?php
					printf(
						/* translators: 1: Count of enhancements, 2: Count of bug fixes. */
						__( 'WordPress 6.2 includes more than %1$s enhancements and %2$s bug fixes. This page highlights the latest features since the November 2022 release of WordPress 6.1. From quick highlights to developer resources, there&#8217;s a lot to explore.' ),
						292, // Enhancements.
						394 // Bug fixes.
					);
					?><?php _e( 'Explore and edit your site from the Site Editor' ); ?><?php _e( 'An updated interface gives you more control over your site editing experience. Browse through full previews of your templates and template parts, then jump into editing your site from wherever you choose.' ); ?><?php _e( 'Manage your menu in more ways with the Navigation block' ); ?><?php _e( 'A new sidebar experience makes it easier to edit your site&#8217;s navigation. Add, remove, and reorder menu items faster—no matter how complex your menus are.' ); ?><?php _e( 'Discover a smoother experience for the Block Inserter' ); ?><?php _e( 'A refreshed design gives you more visibility and easier access to the content you need. Use the Media tab to drag and drop content from your existing Media Library quickly. Find patterns faster with a split view that lets you navigate categories and see previews all at once.' ); ?><?php _e( 'Find the controls you want when you need them' ); ?><?php _e( 'Your block settings sidebar is better organized with tabs for Settings and Styles. So the tools you need are easy to identify and access.' ); ?><?php _e( 'Build faster with headers and footers for block themes' ); ?><?php _e( 'Discover a new collection of header and footer patterns to choose from. Use them with any block theme as a quick, high-quality starting point for your site&#8217;s templates.' ); ?><?php _e( 'Explore Openverse media right from the Editor' ); ?><?php _e( 'Openverse&#8217;s library catalogs over 600 million free, openly licensed stock images and audio—and now it&#8217;s directly integrated into the Editor.' ); ?><?php _e( 'Focus on writing with Distraction Free mode' ); ?><?php _e( 'For those times you want to be alone with your ideas. You can now hide all your panels and controls, leaving you free to bring your content to life.' ); ?><?php _e( 'Experience the Site Editor, now out of beta' ); ?><?php _e( 'Stable and ready for you to dive in and explore: 6.2 is your personal invitation to discover what the next generation of WordPress—and Block themes—can do.' ); ?><?php _e( 'Style Book' ); ?><?php _e( 'Use the new Style Book to get a complete overview of how every block in your site&#8217;s library looks. All in one place, all at a glance.' ); ?><?php _e( 'Copy and paste styles' ); ?><?php _e( 'Perfect the design on one type of block, then copy and paste those styles to other blocks to get just the look you want.' ); ?><?php _e( 'Custom CSS' ); ?><?php _e( 'Power up your site any way you wish. Add CSS to your site, or your blocks, for another level of control over your site&#8217;s look and feel.' ); ?><?php _e( 'Sticky positioning' ); ?><?php _e( 'Choose to keep top-level group blocks fixed to the top of a page as visitors scroll.' ); ?><?php _e( 'Importing widgets' ); ?><?php _e( 'Options to import your favorite widgets from Classic themes to Block themes.' ); ?><?php _e( 'Local fonts in themes' ); ?><?php _e( 'Default WordPress themes offer better privacy with Google Fonts now included.' ); ?><?php
					printf(
						/* translators: %s: Version number. */
						__( 'Learn more about WordPress %s' ),
						$display_version
					);
					?><?php
					printf(
						/* translators: 1: Learn WordPress link. */
						__( 'Explore <a href="%s">learn.wordpress.org</a> for tutorial videos, online workshops, courses, and lesson plans for Meetup organizers, including new features in WordPress.' ),
						'https://learn.wordpress.org/'
					);
					?><?php
					printf(
						/* translators: %s: WordPress Field Guide link. */
						__( 'Check out the latest version of the <a href="%s">WordPress Field Guide</a>. It is overflowing with detailed developer notes to help you build with WordPress.' ),
						__( 'https://make.wordpress.org/core/2023/03/09/wordpress-6-2-field-guide/' )
					);
					?><?php
					printf(
						/* translators: 1: WordPress Release Notes link, 2: WordPress version number. */
						__( '<a href="%1$s">Read the WordPress %2$s Release Notes</a> for more information on the included enhancements and issues fixed, installation information, developer notes and resources, release contributors, and the list of file changes in this release.' ),
						sprintf(
							/* translators: %s: WordPress version number. */
							esc_url( __( 'https://wordpress.org/support/wordpress-version/version-%s/' ) ),
							'6-2'
						),
						'6.2'
					);
					?><?php if ( current_user_can( 'update_core' ) && isset( $_GET['updated'] ) ) : ?><?php echo esc_url( self_admin_url( 'update-core.php' ) ); ?><?php is_multisite() ? _e( 'Go to Updates' ) : _e( 'Go to Dashboard &rarr; Updates' ); ?><?php endif; ?><?php echo esc_url( self_admin_url() ); ?><?php is_blog_admin() ? _e( 'Go to Dashboard &rarr; Home' ) : _e( 'Go to Dashboard' ); ?><?php require_once ABSPATH . 'wp-admin/admin-footer.php'; ?>