<?php
    if( have_rows('links_repeater') ):
        while ( have_rows('links_repeater') ) : the_row();
            $text = (get_sub_field('text')) ? get_sub_field('text') : '';
            $url = (get_sub_field('url')) ? 'href="'. get_sub_field('url') .'"' : '';
?>
                <div class="link-wrap"><a href="<?= $url ?>"><?= $text ?></a></div>

<?php
        endwhile;
    endif;
?>