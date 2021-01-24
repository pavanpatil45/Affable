<?php include('server.php') ?>
<!DOCTYPE html>
<html>
<head>
	<title>Registration system PHP and MySQL</title>
	<script type="text/javascript" src="/Affable/js/script_sme_reg.js"></script>
</head>
<body>
	<div class="header">
		<h2>Register</h2>
	</div>
	
	<form method="post" action="register.php">


		<div class="input-group">
			<label>name</label>
			<input type="text" name="name" >
		</div>
		<div class="input-group">
			<label>Email</label>
			<input type="email" name="email">
		</div>
		<div class="input-group">
			<label>Mobile</label>
			<input type="phone" name="phone">
		</div>
		<div class="input-group">
			<label>Password</label>
			<input type="password" name="password_1">
		</div>
		<div class="input-group">
			<label>Confirm password</label>
			<input type="password" name="password_2">
			
		</div>
		<div class="input-group">
			<button type="submit" class="btn" name="reg_sme" onclick="return validate_reg()">Register</button>
		</div>
		<p>
			Already a member? <a href="login.php">Sign in</a>
		</p>
	</form>
</body>
</html>