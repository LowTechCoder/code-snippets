<!-- UNTESTED with get_bg_img() -->
<?php if( get_sub_field('background_image') ): ?>
    <div class="overlay background_image" <?= get_bg_img(get_sub_field('background_image'), 'tap_xl') ?>></div>
<?php endif; ?>