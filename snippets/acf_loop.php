<?php
    if( have_rows('repeater_field_name') ):
        // $i = 0;
?>
        <section class="section">
            <div class="section_wrap">
                <div class="row-wrap">
<?php
                while ( have_rows('repeater_field_name') ) : the_row();
                    // $i++;
                    $example1 = get_sub_field('example1');
                    $example2 = (get_sub_field('example2')) ? 'href="'. get_sub_field('example2') .'"' : '';
?>
                    <div class="col">
                        <div class="wrap1">

                        </div>
                    </div>
<?php
                    // $i++;
                endwhile;
?>
                </div>
            </div>
        </section>
<?php
    endif;
?>