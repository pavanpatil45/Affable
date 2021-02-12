<?php
	include "connection.php";
	
if(isset($_SESSION['email'])){
	
	$email=$_SESSION['email'];	
	$webinar_topic=$_POST['webinar_topic'];
	$webinar_desc=$_POST['webinar_desc']; 
	$who_attend= $_POST['who_attend']; 
	$key_takeaways=$_POST['key_takeaways'];
	$webinar_fees=$_POST['webinar_fees']; 
	$webinar_venue=$_POST['webinar_venue'];
	$webinar_date=$_POST['date']; 
	$webinar_from_time=$_POST['startone1']; 
	$webinar_to_time=$_POST['one1'];
	

/* 	//FOR STORING PATH IMAGE

	$course_image=trim($_POST['course_image']);
	$targetPhotoDir = "Data/course_image/";
	$photoName = basename($_FILES["course_image"]["name"]);
	$targetPhotoPath = $targetPhotoDir . $photoName;
	$PhotoType = pathinfo($targetPhotoPath,PATHINFO_EXTENSION);
	$allowPhotoTypes = array('jpg','png','jpeg');
	if(in_array($PhotoType, $allowPhotoTypes))
		move_uploaded_file($_FILES["course_image"]["tmp_name"], $targetPhotoPath);   */
	
	
	//FOR STORING BLOB IMAGE
	$imageName=$_FILES["course_image"]["name"];
	$imageType=$_FILES["course_image"]["type"];
	$imageTempLoc=$_FILES["course_image"]["tmp_name"];
	$imageSize=$_FILES["course_image"]["size"];
	$PhotoType = pathinfo($imageName,PATHINFO_EXTENSION);
	$allowPhotoTypes = array('jpg','png','jpeg','jfif');
	if(in_array($PhotoType, $allowPhotoTypes))
		$image=base64_encode(file_get_contents($imageTempLoc));

		
  
  
	$sql="INSERT INTO sme_webinar(webinar_topic, webinar_venue, course_image, webinar_desc, who_attend, key_takeaways, webinar_fees, webinar_date, webinar_from_time, webinar_to_time, sme_email) VALUES('$webinar_topic', '$webinar_venue', '$image', '$webinar_desc', '$who_attend', '$key_takeaways', '$webinar_fees', '$webinar_date', '$webinar_from_time', '$webinar_to_time', '$email')";              
	$result=mysqli_query($db, $sql) or die(mysqli_error($db));
	header("Location:sme_dashboard.php");

		

}

else{
	header("Location:index.php");
	exit;
} 
	
?>
