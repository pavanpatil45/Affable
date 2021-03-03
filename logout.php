<?php // logout.php
include 'connection.php';

if (isset($_SESSION['email']))
{
	session_unset();
	header("Location:index.php");
}

?>