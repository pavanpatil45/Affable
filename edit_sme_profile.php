<?php
include "connection.php";
	

if(isset($_SESSION['email'])){
	$email=$_SESSION['email'];	

	$name=trim($_POST['name']);
	$email=trim($_POST['email']);
	$phone=trim($_POST['phone']);
	$pincode=trim($_POST['pincode']);
	$postal_addr=trim($_POST['postal_addr']);
	$categoryname=trim($_POST['categoryname']);
	$about_sme=trim($_POST['about_sme']);
	$experience=trim($_POST['experience']);
	$skillset=trim($_POST['skillset']);
	$sme_cert=trim($_POST['sme_cert']);
	$sme_language=trim($_POST['sme_language']);
	$webinars=trim($_POST['webinars']);
	$sme_fees=trim($_POST['sme_fees']);
	$review_rating=trim($_POST['review_rating']); 
	$sme_designation=trim($_POST['sme_designation']);
	$mode_of_cons = $_POST['MOC'] ;
	$chk="";  
    foreach($mode_of_cons as $chk1)  
       {  
          $chk.= $chk1.",";  
       }  
	

	//FOR STORING PATH IMAGE
	
	/* $photo_loc=trim($_POST['photo_loc']);
	$targetPhotoDir = "Data/photo_loc/";
	$photoName = basename($_FILES["photo_loc"]["name"]);
	$targetPhotoPath = $targetPhotoDir . $photoName;
	$PhotoType = pathinfo($targetPhotoPath,PATHINFO_EXTENSION);
	$allowPhotoTypes = array('jpg','png','jpeg');
	if(in_array($PhotoType, $allowPhotoTypes))
		move_uploaded_file($_FILES["photo_loc"]["tmp_name"], $targetPhotoPath); */
	
	
	//FOR STORING BLOB IMAGE
	$imageName=$_FILES["photo_loc"]["name"];
	$imageType=$_FILES["photo_loc"]["type"];
	$imageTempLoc=$_FILES["photo_loc"]["tmp_name"];
	$imageSize=$_FILES["photo_loc"]["size"];
	$PhotoType = pathinfo($imageName,PATHINFO_EXTENSION);
	$allowPhotoTypes = array('jpg','png','jpeg','jfif');
	if(in_array($PhotoType, $allowPhotoTypes))
		$image=base64_encode(file_get_contents($imageTempLoc));
		
		
		
	$resume_loc=trim($_POST['resume_loc']);
	$targetResumeDir = "sme_resume/";
	$ResumeName = basename($_FILES["resume_loc"]["name"]);
	$targetResumePath = $targetResumeDir . $ResumeName;
	$ResumeType = pathinfo($targetResumePath,PATHINFO_EXTENSION);
	$allowResumeTypes = array('pdf','doc','docx');
	if(in_array($ResumeType, $allowResumeTypes))
		move_uploaded_file($_FILES["resume_loc"]["tmp_name"], $targetResumePath);
	
	
	
	$sql='UPDATE sme_profile set name="'.$name.'",  phone="'.$phone.'", about_sme="'.$about_sme.'", postal_addr="'.$postal_addr.'", pincode="'.$pincode.'", categoryname="'.$categoryname.'", sme_designation="'.$sme_designation.'", experience="'.$experience.'", skillset="'.$skillset.'", sme_cert="'.$sme_cert.'", sme_language="'.$sme_language.'", webinars="'.$webinars.'", sme_fees="'.$sme_fees.'", mode_of_cons="'.$chk.'", photo_loc="'.$image.'", resume_loc="'.$ResumeName.'" WHERE email ="'.$email.'"';              
	$result=mysqli_query($db, $sql) or die(mysqli_error($db));
	header("Location:sme_dashboard.php");

}
else{
	header("Location:index.php");
	exit;
} 


?>