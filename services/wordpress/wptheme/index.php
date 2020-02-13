<?php
/**
 * @package wptheme
 */

function myguten_enqueue() {
    wp_enqueue_script(
        'myguten-script',
        get_template_directory_uri() . '/myguten.js'
    );
}
add_action( 'enqueue_block_editor_assets', 'myguten_enqueue' );