<?php
include "connection.php";
	
//post values from consultation slot form
if(isset($_SESSION['email'])){
	$email=$_SESSION['email'];
	$date1=trim($_POST['date1']);
	$startone=trim($_POST['startone']);
	$endone=trim($_POST['endone']);
	$date2=trim($_POST['date2']);
	$starttwo=trim($_POST['starttwo']);
	$endtwo=trim($_POST['endtwo']);
	$date3=trim($_POST['date3']);
	$startthree=trim($_POST['startthree']);
	$endthree=trim($_POST['endthree']);
	$mode_of_cons = $_POST['consultation_mode'];
	$answer = $_POST['SMEthoughts1'];
	
	//get Que ID from userquestion (Here I Didnt Understand How to get values from selected request)
	$results1 = mysqli_query($db,'SELECT questionid, email FROM userquestion') or die(mysqli_error($db));
	$row_cnt1=mysqli_num_rows($results1);
	$row1=mysqli_fetch_array($results1);
	$client_email=$row1['email'];
	$questionid = $row1['questionid'];	
	
	
	//insert slots values in consultation_slot
	$sql="INSERT INTO consultation_slots(sme_email, client_email, questionid, mode_of_cons, slot1_date, slot1_from_time, slot1_to_time, slot2_date, slot2_from_time, slot2_to_time, slot3_date, slot3_from_time, slot3_to_time) VALUES('$email', '$client_email', '$questionid', '$mode_of_cons', '$date1', '$startone','$endone', '$date2', '$starttwo','$endtwo', '$date3', '$startthree','$endthree')";           
	$result=mysqli_query($db, $sql) or die(mysqli_error($db));
	
	
	
	//insert SMEthoughts(answer) 
	$sql2="INSERT INTO sme_answer(questionid, answered_by, answer) VALUES('$questionid', '$email', '$answer')";           
	$result2=mysqli_query($db, $sql2) or die(mysqli_error($db));


	//Update Status "Accepted" for that Question ID
	$sql1='UPDATE userquestion set status= "Accepted" WHERE questionid ="'.$questionid.'"';              
	$result1=mysqli_query($db, $sql1) or die(mysqli_error($db));
	header("Location:sme_dashboard.php");


}
else{
	header("Location:index.php");
	exit;
} 

	//Send Email to client
		$subject = 'Question has been Accepted by our SME';
		$msg = 'Your question has been Accepted by our SME.';
		$headers = "MIME-Version: 1.0 \r\n";
		$headers = "Content-Type: text/html; charset=UTF-8 \r\n";
        mail($client_email, $subject, $msg, $headers);



?>