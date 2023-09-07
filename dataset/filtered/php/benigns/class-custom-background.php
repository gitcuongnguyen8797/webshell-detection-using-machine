<?php
/**
 * The custom background script.
 *
 * @package WordPress
 * @subpackage Administration
 */

/**
 * The custom background class.
 *
 * @since 3.0.0
 */
#[AllowDynamicProperties]
class Custom_Background {

	/**
	 * Callback for administration header.
	 *
	 * @var callable
	 * @since 3.0.0
	 */
	public $admin_header_callback;

	/**
	 * Callback for header div.
	 *
	 * @var callable
	 * @since 3.0.0
	 */
	public $admin_image_div_callback;

	/**
	 * Used to trigger a success message when settings updated and set to true.
	 *
	 * @since 3.0.0
	 * @var bool
	 */
	private $updated;

	/**
	 * Constructor - Registers administration header callback.
	 *
	 * @since 3.0.0
	 * @param callable $admin_header_callback
	 * @param callable $admin_image_div_callback Optional custom image div output callback.
	 */
	public function __construct( $admin_header_callback = '', $admin_image_div_callback = '' ) {
		$this->admin_header_callback    = $admin_header_callback;
		$this->admin_image_div_callback = $admin_image_div_callback;

		add_action( 'admin_menu', array( $this, 'init' ) );

		add_action( 'wp_ajax_custom-background-add', array( $this, 'ajax_background_add' ) );

		// Unused since 3.5.0.
		add_action( 'wp_ajax_set-background-image', array( $this, 'wp_set_background_image' ) );
	}

	/**
	 * Sets up the hooks for the Custom Background admin page.
	 *
	 * @since 3.0.0
	 */
	public function init() {
		$page = add_theme_page( __( 'Background' ), __( 'Background' ), 'edit_theme_options', 'custom-background', array( $this, 'admin_page' ) );
		if ( ! $page ) {
			return;
		}

		add_action( "load-{$page}", array( $this, 'admin_load' ) );
		add_action( "load-{$page}", array( $this, 'take_action' ), 49 );
		add_action( "load-{$page}", array( $this, 'handle_upload' ), 49 );

		if ( $this->admin_header_callback ) {
			add_action( "admin_head-{$page}", $this->admin_header_callback, 51 );
		}
	}

	/**
	 * Sets up the enqueue for the CSS & JavaScript files.
	 *
	 * @since 3.0.0
	 */
	public function admin_load() {
		get_current_screen()->add_help_tab(
			array(
				'id'      => 'overview',
				'title'   => __( 'Overview' ),
				'content' =>
					'<p>' . __( 'You can customize the look of your site without touching any of your theme&#8217;s code by using a custom background. Your background can be an image or a color.' ) . '</p>' .
					'<p>' . __( 'To use a background image, simply upload it or choose an image that has already been uploaded to your Media Library by clicking the &#8220;Choose Image&#8221; button. You can display a single instance of your image, or tile it to fill the screen. You can have your background fixed in place, so your site content moves on top of it, or you can have it scroll with your site.' ) . '</p>' .
					'<p>' . __( 'You can also choose a background color by clicking the Select Color button and either typing in a legitimate HTML hex value, e.g. &#8220;#ff0000&#8221; for red, or by choosing a color using the color picker.' ) . '</p>' .
					'<p>' . __( 'Do not forget to click on the Save Changes button when you are finished.' ) . '</p>',
			)
		);

		get_current_screen()->set_help_sidebar(
			'<p><strong>' . __( 'For more information:' ) . '</strong></p>' .
			'<p>' . __( '<a href="https://codex.wordpress.org/Appearance_Background_Screen">Documentation on Custom Background</a>' ) . '</p>' .
			'<p>' . __( '<a href="https://wordpress.org/support/forums/">Support forums</a>' ) . '</p>'
		);

		wp_enqueue_media();
		wp_enqueue_script( 'custom-background' );
		wp_enqueue_style( 'wp-color-picker' );
	}

	/**
	 * Executes custom background modification.
	 *
	 * @since 3.0.0
	 */
	public function take_action() {
		if ( empty( $_POST ) ) {
			return;
		}

		if ( isset( $_POST['reset-background'] ) ) {
			check_admin_referer( 'custom-background-reset', '_wpnonce-custom-background-reset' );

			remove_theme_mod( 'background_image' );
			remove_theme_mod( 'background_image_thumb' );

			$this->updated = true;
			return;
		}

		if ( isset( $_POST['remove-background'] ) ) {
			// @todo Uploaded files are not removed here.
			check_admin_referer( 'custom-background-remove', '_wpnonce-custom-background-remove' );

			set_theme_mod( 'background_image', '' );
			set_theme_mod( 'background_image_thumb', '' );

			$this->updated = true;
			wp_safe_redirect( $_POST['_wp_http_referer'] );
			return;
		}

		if ( isset( $_POST['background-preset'] ) ) {
			check_admin_referer( 'custom-background' );

			if ( in_array( $_POST['background-preset'], array( 'default', 'fill', 'fit', 'repeat', 'custom' ), true ) ) {
				$preset = $_POST['background-preset'];
			} else {
				$preset = 'default';
			}

			set_theme_mod( 'background_preset', $preset );
		}

		if ( isset( $_POST['background-position'] ) ) {
			check_admin_referer( 'custom-background' );

			$position = explode( ' ', $_POST['background-position'] );

			if ( in_array( $position[0], array( 'left', 'center', 'right' ), true ) ) {
				$position_x = $position[0];
			} else {
				$position_x = 'left';
			}

			if ( in_array( $position[1], array( 'top', 'center', 'bottom' ), true ) ) {
				$position_y = $position[1];
			} else {
				$position_y = 'top';
			}

			set_theme_mod( 'background_position_x', $position_x );
			set_theme_mod( 'background_position_y', $position_y );
		}

		if ( isset( $_POST['background-size'] ) ) {
			check_admin_referer( 'custom-background' );

			if ( in_array( $_POST['background-size'], array( 'auto', 'contain', 'cover' ), true ) ) {
				$size = $_POST['background-size'];
			} else {
				$size = 'auto';
			}

			set_theme_mod( 'background_size', $size );
		}

		if ( isset( $_POST['background-repeat'] ) ) {
			check_admin_referer( 'custom-background' );

			$repeat = $_POST['background-repeat'];

			if ( 'no-repeat' !== $repeat ) {
				$repeat = 'repeat';
			}

			set_theme_mod( 'background_repeat', $repeat );
		}

		if ( isset( $_POST['background-attachment'] ) ) {
			check_admin_referer( 'custom-background' );

			$attachment = $_POST['background-attachment'];

			if ( 'fixed' !== $attachment ) {
				$attachment = 'scroll';
			}

			set_theme_mod( 'background_attachment', $attachment );
		}

		if ( isset( $_POST['background-color'] ) ) {
			check_admin_referer( 'custom-background' );

			$color = preg_replace( '/[^0-9a-fA-F]/', '', $_POST['background-color'] );

			if ( strlen( $color ) === 6 || strlen( $color ) === 3 ) {
				set_theme_mod( 'background_color', $color );
			} else {
				set_theme_mod( 'background_color', '' );
			}
		}

		$this->updated = true;
	}

	/**
	 * Displays the custom background page.
	 *
	 * @since 3.0.0
	 */
	public function admin_page() {
		?><?php _e( 'Custom Background' ); ?><?php if ( current_user_can( 'customize' ) ) { ?><?php
			printf(
				/* translators: %s: URL to background image configuration in Customizer. */
				__( 'You can now manage and live-preview Custom Backgrounds in the <a href="%s">Customizer</a>.' ),
				admin_url( 'customize.php?autofocus[control]=background_image' )
			);
			?><?php } ?><?php if ( ! empty( $this->updated ) ) { ?><?php
			/* translators: %s: Home URL. */
			printf( __( 'Background updated. <a href="%s">Visit your site</a> to see how it looks.' ), esc_url( home_url( '/' ) ) );
			?><?php } ?><?php _e( 'Background Image' ); ?><?php _e( 'Preview' ); ?><?php
		if ( $this->admin_image_div_callback ) {
			call_user_func( $this->admin_image_div_callback );
		} else {
			$background_styles = '';
			$bgcolor           = get_background_color();
			if ( $bgcolor ) {
				$background_styles .= 'background-color: #' . $bgcolor . ';';
			}

			$background_image_thumb = get_background_image();
			if ( $background_image_thumb ) {
				$background_image_thumb = esc_url( set_url_scheme( get_theme_mod( 'background_image_thumb', str_replace( '%', '%%', $background_image_thumb ) ) ) );
				$background_position_x  = get_theme_mod( 'background_position_x', get_theme_support( 'custom-background', 'default-position-x' ) );
				$background_position_y  = get_theme_mod( 'background_position_y', get_theme_support( 'custom-background', 'default-position-y' ) );
				$background_size        = get_theme_mod( 'background_size', get_theme_support( 'custom-background', 'default-size' ) );
				$background_repeat      = get_theme_mod( 'background_repeat', get_theme_support( 'custom-background', 'default-repeat' ) );
				$background_attachment  = get_theme_mod( 'background_attachment', get_theme_support( 'custom-background', 'default-attachment' ) );

				// Background-image URL must be single quote, see below.
				$background_styles .= " background-image: url('$background_image_thumb');"
				. " background-size: $background_size;"
				. " background-position: $background_position_x $background_position_y;"
				. " background-repeat: $background_repeat;"
				. " background-attachment: $background_attachment;";
			}
			?><?php echo $background_styles; ?><?php // Must be double quote, see above. ?><?php if ( $background_image_thumb ) { ?><?php echo $background_image_thumb; ?><?php echo $background_image_thumb; ?><?php } ?><?php } ?><?php if ( get_background_image() ) : ?><?php _e( 'Remove Image' ); ?><?php wp_nonce_field( 'custom-background-remove', '_wpnonce-custom-background-remove' ); ?><?php submit_button( __( 'Remove Background Image' ), '', 'remove-background', false ); ?><?php _e( 'This will remove the background image. You will not be able to restore any customizations.' ); ?><?php endif; ?><?php $default_image = get_theme_support( 'custom-background', 'default-image' ); ?><?php if ( $default_image && get_background_image() !== $default_image ) : ?><?php _e( 'Restore Original Image' ); ?><?php wp_nonce_field( 'custom-background-reset', '_wpnonce-custom-background-reset' ); ?><?php submit_button( __( 'Restore Original Image' ), '', 'reset-background', false ); ?><?php _e( 'This will restore the original background image. You will not be able to restore any customizations.' ); ?><?php endif; ?><?php if ( current_user_can( 'upload_files' ) ) : ?><?php _e( 'Select Image' ); ?><?php _e( 'Choose an image from your computer:' ); ?><?php wp_nonce_field( 'custom-background-upload', '_wpnonce-custom-background-upload' ); ?><?php submit_button( __( 'Upload' ), '', 'submit', false ); ?><?php _e( 'Or choose an image from your media library:' ); ?><?php esc_attr_e( 'Choose a Background Image' ); ?><?php esc_attr_e( 'Set as background' ); ?><?php _e( 'Choose Image' ); ?><?php endif; ?><?php _e( 'Display Options' ); ?><?php if ( get_background_image() ) : ?><?php
			$background_position = sprintf(
				'%s %s',
				get_theme_mod( 'background_position_x', get_theme_support( 'custom-background', 'default-position-x' ) ),
				get_theme_mod( 'background_position_y', get_theme_support( 'custom-background', 'default-position-y' ) )
			);

			$background_position_options = array(
				array(
					'left top'   => array(
						'label' => __( 'Top Left' ),
						'icon'  => 'dashicons dashicons-arrow-left-alt',
					),
					'center top' => array(
						'label' => __( 'Top' ),
						'icon'  => 'dashicons dashicons-arrow-up-alt',
					),
					'right top'  => array(
						'label' => __( 'Top Right' ),
						'icon'  => 'dashicons dashicons-arrow-right-alt',
					),
				),
				array(
					'left center'   => array(
						'label' => __( 'Left' ),
						'icon'  => 'dashicons dashicons-arrow-left-alt',
					),
					'center center' => array(
						'label' => __( 'Center' ),
						'icon'  => 'background-position-center-icon',
					),
					'right center'  => array(
						'label' => __( 'Right' ),
						'icon'  => 'dashicons dashicons-arrow-right-alt',
					),
				),
				array(
					'left bottom'   => array(
						'label' => __( 'Bottom Left' ),
						'icon'  => 'dashicons dashicons-arrow-left-alt',
					),
					'center bottom' => array(
						'label' => __( 'Bottom' ),
						'icon'  => 'dashicons dashicons-arrow-down-alt',
					),
					'right bottom'  => array(
						'label' => __( 'Bottom Right' ),
						'icon'  => 'dashicons dashicons-arrow-right-alt',
					),
				),
			);
			?><?php _e( 'Image Position' ); ?><?php
			/* translators: Hidden accessibility text. */
			_e( 'Image Position' );
			?><?php foreach ( $background_position_options as $group ) : ?><?php foreach ( $group as $value => $input ) : ?><?php echo esc_attr( $value ); ?><?php checked( $value, $background_position ); ?><?php echo esc_attr( $input['icon'] ); ?><?php echo $input['label']; ?><?php endforeach; ?><?php endforeach; ?><?php _e( 'Image Size' ); ?><?php
			/* translators: Hidden accessibility text. */
			_e( 'Image Size' );
			?><?php selected( 'auto', get_theme_mod( 'background_size', get_theme_support( 'custom-background', 'default-size' ) ) ); ?><?php _ex( 'Original', 'Original Size' ); ?><?php selected( 'contain', get_theme_mod( 'background_size', get_theme_support( 'custom-background', 'default-size' ) ) ); ?><?php _e( 'Fit to Screen' ); ?><?php selected( 'cover', get_theme_mod( 'background_size', get_theme_support( 'custom-background', 'default-size' ) ) ); ?><?php _e( 'Fill Screen' ); ?><?php _ex( 'Repeat', 'Background Repeat' ); ?><?php
			/* translators: Hidden accessibility text. */
			_ex( 'Repeat', 'Background Repeat' );
			?><?php checked( 'repeat', get_theme_mod( 'background_repeat', get_theme_support( 'custom-background', 'default-repeat' ) ) ); ?><?php _e( 'Repeat Background Image' ); ?><?php _ex( 'Scroll', 'Background Scroll' ); ?><?php
			/* translators: Hidden accessibility text. */
			_ex( 'Scroll', 'Background Scroll' );
			?><?php checked( 'scroll', get_theme_mod( 'background_attachment', get_theme_support( 'custom-background', 'default-attachment' ) ) ); ?><?php _e( 'Scroll with Page' ); ?><?php endif; // get_background_image() ?><?php _e( 'Background Color' ); ?><?php
		/* translators: Hidden accessibility text. */
		_e( 'Background Color' );
		?><?php
		$default_color = '';
		if ( current_theme_supports( 'custom-background', 'default-color' ) ) {
			$default_color = ' data-default-color="#' . esc_attr( get_theme_support( 'custom-background', 'default-color' ) ) . '"';
		}
		?><?php echo esc_attr( get_background_color() ); ?><?php echo $default_color; ?><?php wp_nonce_field( 'custom-background' ); ?><?php submit_button( null, 'primary', 'save-background-options' ); ?>