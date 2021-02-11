<?php
	include "connection.php";


	if($_POST['do'] == "post_webinar") {
		$webinar_topic=$_POST['webinar_topic'];
		$webinar_desc=$_POST['webinar_desc']; 
		$who_attend= $_POST['who_attend']; 
		$key_takeaways=$_POST['key_takeaways'];
		$webinar_fees=$_POST['webinar_fees']; 
		$webinar_date=$_POST['webinar_date']; 
		$webinar_from_time=$_POST['webinar_from_time']; 
		$webinar_to_time=$_POST['webinar_to_time']; 

		
		$sql = "INSERT INTO sme_webinar(webinar_topic, webinar_desc, who_attend, key_takeaways, webinar_fees, webinar_date, webinar_from_time, webinar_to_time, sme_email) values(:webinar_topic, :webinar_desc, :who_attend, :key_takeaways, :webinar_fees, :webinar_date, :webinar_from_time, :webinar_to_time, :email)";
		$stmt = $conn->prepare($sql);
		$stmt->execute(array(

			':webinar_topic'=>$webinar_topic, 
			':webinar_desc'=> $webinar_desc, 
			':who_attend'=> $who_attend, 
			':key_takeaways'=>$key_takeaways, 
			':webinar_fees'=>$webinar_fees, 
			':webinar_date'=>$webinar_date,
			':webinar_from_time'=>$webinar_from_time, 
			':webinar_to_time'=>$webinar_to_time,
			':email' => $_SESSION['email']
		));
		echo 1;
	}
	
?>
