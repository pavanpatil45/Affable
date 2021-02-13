<?php
	include "connection.php";

	if($_POST['do'] == "accept_request") {
		$questionid = $_POST['questionid'];
		$mode_of_cons = $_POST['mode_of_cons'];
		
		// Inserting data in sme answer table
		$stmt1 = $conn->prepare("INSERT INTO sme_answer(questionid, answered_by, answer) VALUES (:questionid, :email, :answer)");
		$stmt1->execute(array(
			":questionid" => $questionid,
			":email" => $_SESSION['email'],
			":answer" => $_POST['answer']
		));

		// Updating status of client question as accepted
		$stmt2 = $conn->prepare("UPDATE userquestion SET status = 'Accepted' WHERE questionid = :questionid");
		$stmt2->execute(array(":questionid" => $questionid));

		// Retrieving client's email from user question table
		$stmt3 = $conn->prepare("SELECT email FROM userquestion WHERE questionid = :questionid");
		$stmt3->execute(array(":questionid" => $questionid));
		$row3 = $stmt3->fetch(PDO::FETCH_ASSOC);
		$client_email = $row3['email'];

		if($mode_of_cons != "email") {
			// Inserting SME's selected slots in consultation slots table
			$sql = "INSERT INTO consultation_slots(sme_email, client_email, questionid, mode_of_cons, ";
			$sql .= "slot1_date, slot1_from_time, slot1_to_time, slot2_date, slot2_from_time, slot2_to_time, slot3_date, slot3_from_time, slot3_to_time) ";
			$sql .= " VALUES(:sme_email, :client_email, :questionid, :mode_of_cons, ";
			$sql .= ":slot1_date, :slot1_from_time, :slot1_to_time, :slot2_date, :slot2_from_time, :slot2_to_time, :slot3_date, :slot3_from_time, :slot3_to_time)";
			
			$stmt4 = $conn->prepare($sql);

			$stmt4->execute(array(
				":sme_email" => $_SESSION['email'],
				":client_email" => $client_email,
				":questionid" => $questionid,
				":mode_of_cons" => $mode_of_cons,
				":slot1_date" => $_POST['date1'],
				":slot1_from_time" => $_POST['ftime1'],
				":slot1_to_time" => $_POST['ttime1'],
				":slot2_date" => $_POST['date2'],
				":slot2_from_time" => $_POST['ftime2'],
				":slot2_to_time" => $_POST['ttime2'],
				":slot3_date" => $_POST['date3'],
				":slot3_from_time" => $_POST['ftime3'],
				":slot3_to_time" => $_POST['ttime3']
			));
		}

		echo $client_email;
	}

	if($_POST['do'] == "decline_request") {
		$questionid = $_POST['questionid'];
		
		// Updating status of client question as declined
		$stmt1 = $conn->prepare("UPDATE userquestion SET status = 'Declined' WHERE questionid = :questionid");
		$stmt1->execute(array(":questionid" => $questionid));

		// Inserting data in declined requests table
		$stmt2 = $conn->prepare("INSERT INTO declined_requests (questionid, sme_email) VALUES(:questionid, :email)");
		$stmt2->execute(array(
			":questionid" => $questionid,
			":email" => $_SESSION['email']
		));
		
		echo 1;
	}

	// Sending an email to Client
	if($_POST['do'] == "mail") {	
		$subject = "Request accepted";
		$message = 'Your request is accepted by our SME.';

		$header = "MIME-Version: 1.0 \r\n";
		$header .= "Content-Type: text/html; charset=UTF-8 \r\n";
		
		mail($_POST['client_email'], $subject, $message, $header);
	}
	
	
	
	if($_POST['do'] == "email_ans") {
		
	$sme_thoughts=$_POST['sme_thoughts'];
	//$ans_file = $_POST['ans_file'];
	//$to = $_POST['client_email'];
	$to = "pavanadhao685@gmail.com";

	//Uploaded File Details
	$ans_file = $_FILES['fileName'];
	$ans_file_name = $ans_file['name'];
	$ans_file_type = $ans_file['type'];
	$tmp_name = $ans_file['tmp_name'];
	$ans_file_size = $ans_file['size'];
	
	//Start Mail Function here
	$subject = 'Email Consultation by SME';
	$from = $_SESSION['email'];
	$aa=filesize($tmp_name);
	$headers = "From: $from";
	$message = "SME's Thoughts on your Question - ".$sme_thoughts."<br><br>";
	$message .= "SME's Attachment - ";
	//$message = strip_tags($msg);
	
	$file = fopen($tmp_name,'sme_ans');
	$data = fread($file,filesize($tmp_name));
	fclose($file);
	$semi_rand = md5(time());

	$mime_boundary = "==Multipart_Boundary_x{$semi_rand}x";
	$headers .= "\nMIME-Version: 1.0\n" ."Content-Type: multipart/mixed;\n" . " boundary=\"{$mime_boundary}\"";
	// Add a multipart boundary above the plain message
	$message .= "This is a multi-part message in MIME format.\n\n" . "--{$mime_boundary}\n" ."Content-Type: text/html; charset=\"iso-8859-1\"\n" ."Content-Transfer-Encoding: 7bit\n\n" . $message . "\n\n";
	// Base64 encode the file data
	$data = chunk_split(base64_encode($data));
	// Add file attachment to the message
	$message .= "--{$mime_boundary}\n" ."Content-Type: {$ans_file_type};\n" . " name=\"{$ans_file_name}\"\n" ."Content-Transfer-Encoding: base64\n\n" .
	$data . "\n\n" ."--{$mime_boundary}--\n";

	// Send the message;
	$ok = @mail($to, $subject, $message, $headers);
	

}

?>
