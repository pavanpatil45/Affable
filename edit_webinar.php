<?php
	include "connection.php";
	
if(isset($_SESSION['email'])){
	$email=$_SESSION['email'];
	$webinar_id=$_POST['webinar_id1'];
	$webinar_topic=$_POST['webinar_topic1'];
	$webinar_desc=$_POST['webinar_desc1']; 
	$who_attend= $_POST['who_attend1']; 
	$key_takeaways=$_POST['key_takeaways1'];
	$webinar_fees=$_POST['webinar_fees1']; 
	$webinar_venue=$_POST['webinar_venue1'];
	$webinar_date=$_POST['date11']; 
	$webinar_from_time=$_POST['startone11']; 
	$webinar_to_time=$_POST['one11'];
	

/* 	//FOR STORING PATH IMAGE

	$course_image=trim($_POST['course_image']);
	$targetPhotoDir = "Data/course_image/";
	$photoName = basename($_FILES["course_image"]["name"]);
	$targetPhotoPath = $targetPhotoDir . $photoName;
	$PhotoType = pathinfo($targetPhotoPath,PATHINFO_EXTENSION);
	$allowPhotoTypes = array('jpg','png','jpeg');
	if(in_array($PhotoType, $allowPhotoTypes))
		move_uploaded_file($_FILES["course_image"]["tmp_name"], $targetPhotoPath);   */
	
	
	$query = "SELECT course_image FROM sme_webinar WHERE webinar_id='{$webinar_id}'";
	$result1 = mysqli_query($db, $query);
	$row = false;
	if (mysqli_num_rows($result1) > 0) {
		$row = mysqli_fetch_assoc($result1);
	}
	
	if(file_exists($_FILES['course_image1']['tmp_name'])){

		$fileinfo = pathinfo($_FILES['course_image1']['name']);
		//getting the file extension 
		 $extension = $fileinfo['extension'];
		if (($extension != "jpg") && ($extension != "jpeg") && ($extension != "jfif"))
			{
				echo '<script>
						alert("Unknown Image Format. types allowed - jpg / jpeg / jfif ");
						window.location.replace("sme_dashboard.php");
				</script>';
			}
		else{
				$uploadedfile = $_FILES['course_image1']['tmp_name'];
				$src = imagecreatefromjpeg($uploadedfile);
				list($width,$height)=getimagesize($uploadedfile);
				
				//set new width
				$newwidth1=350;
				$newheight1=($height/$width)*$newwidth1;
				$tmp1=imagecreatetruecolor($newwidth1,$newheight1);
						
				imagecopyresampled($tmp1,$src,0,0,0,0,$newwidth1,$newheight1,$width,$height);

				//new random name        
				$temp = explode(".", $_FILES["course_image1"]["name"]);
				$newfilename = round(microtime(true)) . '.' . end($temp);
				 

				if(!(is_null($row['course_image']))){
				unlink($row['course_image']); //Delete old photo
				}
				$filename1 = "images/course_img/". $newfilename;
							
				imagejpeg($tmp1,$filename1,100);
				
				imagedestroy($src);
				imagedestroy($tmp1);
				//insert in database
				$sql='update sme_webinar set webinar_topic= "'.$webinar_topic.'", webinar_venue= "'.$webinar_venue.'", course_image= "'.$filename1.'", webinar_desc= "'.$webinar_desc.'", who_attend= "'.$who_attend.'", key_takeaways= "'.$key_takeaways.'", webinar_fees= "'.$webinar_fees.'", webinar_date= "'.$webinar_date.'", webinar_from_time= "'.$webinar_from_time.'", webinar_to_time= "'.$webinar_to_time.'", sme_email= "'.$email.'" where webinar_id ="'.$webinar_id.'"';           
				$result=mysqli_query($db, $sql) or die(mysqli_error($db));

				echo '<script>
						alert("Your Webinar is Updated Successfully! .");
						window.location.replace("sme_dashboard.php");
					</script>';
			}	
	}
	else{
			//insert in database
			$sql='update sme_webinar set webinar_topic= "'.$webinar_topic.'", webinar_venue= "'.$webinar_venue.'", webinar_desc= "'.$webinar_desc.'", who_attend= "'.$who_attend.'", key_takeaways= "'.$key_takeaways.'", webinar_fees= "'.$webinar_fees.'", webinar_date= "'.$webinar_date.'", webinar_from_time= "'.$webinar_from_time.'", webinar_to_time= "'.$webinar_to_time.'", sme_email= "'.$email.'" where webinar_id ="'.$webinar_id.'"';           
			$result=mysqli_query($db, $sql) or die(mysqli_error($db));

			echo '<script>
					alert("Your Webinar is Updated Successfully! .");
					window.location.replace("sme_dashboard.php");
				</script>';
		}		
}
else{
	header("Location:index.php");
	exit;
} 
		
?>