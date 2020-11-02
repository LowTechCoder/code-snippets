<div class="text_area">
<?php
    $email = antispambot(get_field('email', 'options'));
    $phone = antispambot(get_field('phone', 'options'));
    $replaced = str_replace('[PHONE]', '<a href="tel:'. $phone. '">'. $phone .'</a>', $field['text_area']);
    echo str_replace('[EMAIL]', '<a href="mailto:'. $email. '">'. $email .'</a>', $replaced);
?>
</div>