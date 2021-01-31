<?php
	include "base.php";
	include "connection.php";

	// Inserting user data in database
	$name = trim($_POST['name']);
	$email = trim($_POST['email']);
	$phoneNumber = trim($_POST['phone']);
	$password = $_POST['password'];
	$hash = password_hash($password, PASSWORD_DEFAULT);
	$vkey = md5(time().$email);

	$sql = "INSERT INTO sme_profile (email, name, phone, password, verified, vkey, review_rating) VALUES (:email, :name, :phone, :hash, 0, :vkey, 4.0)";
	$stmt = $conn->prepare($sql);
	$stmt->execute(array(
		':email' => $email,
		':name' => $name,
		':phone' => $phoneNumber,
		':hash' => $hash,
		":vkey" => $vkey
	));

	// Sending verification email
	$subject = 'SME Registration Verification';
	
	$message = "You have been registered for SME Portal.<br>";
	$message .= "Please <a href='".BASE_URL."/sme_registration_verification.php?vkey=".$vkey."&email=".$email."'>click here</a> to Login.";
	
	$header = "MIME-Version: 1.0 \r\n";
	$header .= "Content-Type: text/html; charset=UTF-8 \r\n";
	
	mail($email, $subject, $message, $header);
?>
