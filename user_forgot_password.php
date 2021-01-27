<?php
	include "connection.php";
	
	// User Sign In Entry Validation
	$email = $_POST['email'];
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
		//	echo "Please check your email inbox or spam folder to change Password.";
		
		$key=md5(time()+123456789% rand(4000, 55000000));
        //insert this temporary key into database
        $sql_insert=mysqli_query($db,"INSERT INTO forget_password(email,temp_key) VALUES('$email','$key')");
        //sending email about update
        $to      = $email;
		$subject = 'RESET PASSWORD DEMO BY PAVAN';
        $msg = "Please click the URL to Reset your Password". "\r\n"."http://localhost/Affable/user_forgot_password_reset.php?key=".$key."&email=".$email;
        $headers = 'From: AFFABLE' . "\r\n";
       if(mail($to, $subject, $msg, $headers))
				{
					echo "Email successfully sent to $to...";
				} 	else {
					echo "Email sending failed...";
				}
    }
?>