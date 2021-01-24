<?php 
	session_start(); 

	if (!isset($_SESSION['name'])) {
		$_SESSION['msg'] = "You must log in first";
		header('location: login.php');
	}

	if (isset($_GET['logout'])) {
		session_destroy();
		unset($_SESSION['name']);
		header("location: login.php");
	}
		?>
		<!DOCTYPE html>
		<html>
		<head>
			<title>SME</title>
		</head>
		<body>
			<div class="header">
				<h2>SME Profile</h2>
			</div>
			<div class="content">

		<!-- logged in user information -->
				<?php  if (isset($_SESSION['name'])) : ?>
					<p>Welcome <strong><?php echo $_SESSION['name']; ?></strong></p>
					<p> <a href="login.php" style="color: red;">logout</a> </p>
				<?php endif ?>
			</div>
				
		</body>
		</html>