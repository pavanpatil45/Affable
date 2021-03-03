<?php
	include "connection.php";


		$questionid = $_POST['questionid'];
		$reason = $_POST['reason'];
		
	
		$stmt3 = $conn->prepare("SELECT email FROM userquestion WHERE questionid = :questionid");
		$stmt3->execute(array(":questionid" => $questionid));
		$row3 = $stmt3->fetch(PDO::FETCH_ASSOC);
		$client_email = $row3['email'];
		
		
		$stmt4 = $conn->prepare("SELECT * FROM consultation WHERE questionid = :questionid");
		$stmt4->execute(array(":questionid" => $questionid));
		$row4 = $stmt4->fetch(PDO::FETCH_ASSOC);
		$sme_email = $row4['smeEmailId'];
		$c_date = $row4['date'];
		
		
		
		$stmt5 = $conn->prepare("SELECT * FROM sme_profile WHERE email = :sme_email");
		$stmt5->execute(array(":sme_email" => $sme_email));
		$row5 = $stmt5->fetch(PDO::FETCH_ASSOC);
		$sme_name = $row5['name'];
		
	
	// Sending an email to Client


		$subject = "Consultation is Cancelled";
		$message = "Your Consultation on ".$c_date." is Cancelled by SME - ".$sme_name."<br>";
		$message .= "<b>SME's Reason : </b>".$reason."<br>";
		$message .= "Kindly wait for another SME to accept your request. Thank you.<br>";

		$header = "MIME-Version: 1.0 \r\n";
		$header .= "Content-Type: text/html; charset=UTF-8 \r\n";
		
		mail($client_email, $subject, $message, $header);
	
	
	// Updating status of consultation as cancelled
		$stmt2 = $conn->prepare("UPDATE consultation SET status = 'Cancelled' WHERE questionid = :questionid");
		$stmt2->execute(array(":questionid" => $questionid));
	



?>
