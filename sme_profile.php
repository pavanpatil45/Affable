<?php 
	session_start(); 

	if (!isset($_SESSION['name'])) {
		$_SESSION['msg'] = "You must log in first";
		header('location: login.php');
	}
?>

<!DOCTYPE html>
<html>
  <head>
    <title>Dashboard</title>
  </head>
  <body>
		<br><br>
          <h2>Hi <b><?=$_SESSION['name']?></b>, Welcome to your dashboard.</h2><br>
		<p>Click here to <a href="login.php">logout</a></p>
  </body>
</html>