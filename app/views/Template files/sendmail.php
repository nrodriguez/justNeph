<?php
/*
 * Mail sender script
 * 
 * Please change destination email, title and messages text settings.
 */

// Destination email address (example: john@doe.com)
define('EMAIL_DEST', 'john@doe.com');

// Email message title
define('EMAIL_TITLE', 'Email from contact form');

// Success message
define('SUCCESS_MESSAGE', 'Thank you! We will get back to you as soon as possible');

// Error message
define('ERROR_MESSAGE', 'Something went wrong, please try to submit later.');


/* Set variables with submitted data */
$name    = isset($_POST['cf_name']) ? $_POST['cf_name'] : '';
$email   = isset($_POST['cf_email']) ? $_POST['cf_email'] : '';
$subject = isset($_POST['cf_subject']) ? $_POST['cf_subject'] : '';
$message = isset($_POST['cf_message']) ? $_POST['cf_message'] : '';


/*
 * Check if all required fields are filled.
 * If everything is correct then send mail and show success message.
 */
if(!empty($name) && !empty($email) && !empty($message)) {
    // Send mail function
    mail(EMAIL_DEST, EMAIL_TITLE, $message);

    // Success message
    echo '<div class="box-success round-3"><div class="box-content"><p>' . SUCCESS_MESSAGE . '</p></div></div>';
    exit;
} else {
    // Error message
    echo '<div class="box-error round-3"><div class="box-content"><p>' . ERROR_MESSAGE . '</p></div></div>';
    exit;
}

?>