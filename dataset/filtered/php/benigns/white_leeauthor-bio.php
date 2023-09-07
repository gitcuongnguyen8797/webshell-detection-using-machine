<?php
/**
 * The template for displaying Author bios
 *
 * @package WordPress
 * @subpackage Twenty_Thirteen
 * @since Twenty Thirteen 1.0
 */
?><?php
		/**
		 * Filter the author bio avatar size.
		 *
		 * @since Twenty Thirteen 1.0
		 *
		 * @param int $size The avatar height and width size in pixels.
		 */
		$author_bio_avatar_size = apply_filters( 'twentythirteen_author_bio_avatar_size', 74 );
		echo get_avatar( get_the_author_meta( 'user_email' ), $author_bio_avatar_size );
		?><?php printf( __( 'About %s', 'twentythirteen' ), get_the_author() ); ?><?php the_author_meta( 'description' ); ?><?php echo esc_url( get_author_posts_url( get_the_author_meta( 'ID' ) ) ); ?><?php printf( __( 'View all posts by %s <span class="meta-nav">&rarr;</span>', 'twentythirteen' ), get_the_author() ); ?>