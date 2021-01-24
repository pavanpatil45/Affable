<?php 
include'connection.php';
	session_start();

	// variable declaration
	$name = "";
	$email    = "";

	

	// After Validation REGISTER SME
	if (isset($_POST['reg_sme'])) {
		// receive all input values from the form
		$name = mysqli_real_escape_string($db, $_POST['name']);
		$email = mysqli_real_escape_string($db, $_POST['email']);
		$phone = mysqli_real_escape_string($db, $_POST['phone']);
		$password_1 = mysqli_real_escape_string($db, $_POST['password_1']);
		$password_2 = mysqli_real_escape_string($db, $_POST['password_2']);

		//Insert DATA into DB	
		$password = md5($password_1);//encrypt password before saving in DB
			$query = "INSERT INTO sme_reg (name, email, password, phone) 
					  VALUES('$name', '$email', '$password', '$phone')";
			mysqli_query($db, $query);

			$_SESSION['name'] = $name;
			header('location: sme_profile.php');
		}

	// ... 

	// LOGIN SME
	if (isset($_POST['login_sme'])) {
		$email = mysqli_real_escape_string($db, $_POST['email']);
		$password = mysqli_real_escape_string($db, $_POST['password']);

			$password = md5($password);
			$query = "SELECT * FROM sme_reg WHERE email='$email' AND password='$password'";
			$results = mysqli_query($db, $query);

			if (mysqli_num_rows($results) == 1) {
				$_SESSION['name'] = $name;
				header('location: sme_profile.php');
			}else {
				// Function def
					function function_alert($message) { 
					echo "<script>alert('$message');</script>"; 
					} 
					// Function call 
					function_alert("Email/Password do not match.");
				}
		}
	

?>