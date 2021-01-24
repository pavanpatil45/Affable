<?php
 $db = mysqli_connect('localhost', 'root', '') or
        die ('Unable to connect. Check connection.');
        mysqli_select_db($db, 'sme_portal' ) or die(mysqli_error($db));
?>
