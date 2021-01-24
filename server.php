<?php 
include'connection.php';
	session_start();

	// variable declaration
	$name = "";
	$email    = "";
	$errors = array(); 
	$_SESSION['success'] = "";

	

	// REGISTER SME
	if (isset($_POST['reg_sme'])) {
		// receive all input values from the form
		$name = mysqli_real_escape_string($db, $_POST['name']);
		$email = mysqli_real_escape_string($db, $_POST['email']);
		$phone = mysqli_real_escape_string($db, $_POST['phone']);
		$password_1 = mysqli_real_escape_string($db, $_POST['password_1']);
		$password_2 = mysqli_real_escape_string($db, $_POST['password_2']);

		// form validation: ensure that the form is correctly filled
		if (empty($name)) { array_push($errors, "name is required"); }
		if (empty($email)) { array_push($errors, "Email is required"); }
		if (empty($password_1)) { array_push($errors, "Password is required"); }

		if ($password_1 != $password_2) {
			array_push($errors, "The two passwords do not match");
		}

		// register SME if there are no errors in the form
		if (count($errors) == 0) {
			$password = md5($password_1);//encrypt password before saving in DB
			$query = "INSERT INTO sme_reg (name, email, password, phone) 
					  VALUES('$name', '$email', '$password', '$phone')";
			mysqli_query($db, $query);

			$_SESSION['name'] = $name;
			$_SESSION['success'] = "You are now logged in";
			header('location: sme_profile.php');
		}

	}

	// ... 

	// LOGIN SME
	if (isset($_POST['login_sme'])) {
		$email = mysqli_real_escape_string($db, $_POST['email']);
		$password = mysqli_real_escape_string($db, $_POST['password']);

		if (empty($email)) {
			array_push($errors, "Email is required");
		}
		if (empty($password)) {
			array_push($errors, "Password is required");
		}

		if (count($errors) == 0) {
			$password = md5($password);
			$query = "SELECT * FROM sme_reg WHERE email='$email' AND password='$password'";
			$results = mysqli_query($db, $query);

			if (mysqli_num_rows($results) == 1) {
				$_SESSION['name'] = $name;
				$_SESSION['success'] = "You are now logged in";
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
	}

?>