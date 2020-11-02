<?php if ( have_rows('list') ): ?>
    <ul class="list">
    <?php while ( have_rows('list') ) : the_row(); ?>
        <li>
            <?= the_sub_field('text') ?>
        </li>
    <?php endwhile; ?>
    </ul>
<?php endif; ?>