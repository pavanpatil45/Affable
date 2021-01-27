<?php
	include "connection.php";
	
	// User Sign In Entry Validation
	$email = $_POST['email'];
	echo "ERRORRRRRRRR";
	if(!filter_var($email, FILTER_VALIDATE_EMAIL))
		echo "Please enter valid Email address";
		
	else {
		$stmt = $conn->prepare("SELECT email FROM user WHERE email = :email");
		$stmt->execute(array(":email" => $email));
		$row = $stmt->fetch(PDO::FETCH_ASSOC);
		
		// Validating the credentials
		if($stmt->rowCount() == 0)
			echo "Account $email does not exist";
		else
			echo 0;
	}
?>