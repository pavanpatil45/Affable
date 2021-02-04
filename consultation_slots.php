<?php
include "connection.php";
	
//session_start();
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
	
	$mode_of_cons = $_POST['consultation_mode'] ;
	
	
	
	
	
	$sql="INSERT INTO consultation_slots(sme_email, mode_of_cons, slot1_date, slot1_from_time, slot1_to_time, slot2_date, slot2_from_time, slot2_to_time, slot3_date, slot3_from_time, slot3_to_time) VALUES('$email', '$mode_of_cons', '$date1', '$startone','$endone', '$date2', '$starttwo','$endtwo', '$date3', '$startthree','$endthree')";           
	$result=mysqli_query($db, $sql) or die(mysqli_error($db));
	header("Location:sme_dashboard.php");

}
else{
	header("Location:index.php");
	exit;
} 


?>