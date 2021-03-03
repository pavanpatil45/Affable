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
	

	
	$query1 = "SELECT photo_loc FROM sme_profile WHERE email='{$email}'";
	$result1 = mysqli_query($db, $query1);
	$row1 = false;
	if (mysqli_num_rows($result1) > 0) {
		$row1 = mysqli_fetch_assoc($result1);
	}
		
	$query2 = "SELECT resume_loc FROM sme_profile WHERE email='{$email}'";
	$result2 = mysqli_query($db, $query2);
	$row2 = false;
	if (mysqli_num_rows($result2) > 0) {
		$row2 = mysqli_fetch_assoc($result2);
	}
	


	if((file_exists($_FILES['photo_loc']['tmp_name'])) && (file_exists($_FILES['resume_loc']['tmp_name']))){

		
	$fileinfo1 = pathinfo($_FILES['resume_loc']['name']);
		//getting the file extension 
		 $extension1 = $fileinfo1['extension'];
		if (($extension1 != "pdf") && ($extension1 != "doc") && ($extension1 != "docx") )
			{
				echo '<script>
						alert("Unknown Document Format. types allowed - pdf / doc / docx");
						window.location.replace("sme_dashboard.php");
				</script>';
			}
		else{
		
			$temp1 = explode(".", $_FILES["resume_loc"]["name"]);
			$newfilename1 = round(microtime(true)) . '.' . end($temp1);
			if(!(is_null($row2['resume_loc']))){
			unlink($row2['resume_loc']); //Delete old resume
			}
			
			$filename2 = "images/sme_resume/". $newfilename1;
			move_uploaded_file($_FILES["resume_loc"]["tmp_name"], $filename2);
		}
	
	

		$fileinfo = pathinfo($_FILES['photo_loc']['name']);
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
				$uploadedfile = $_FILES['photo_loc']['tmp_name'];
				$src = imagecreatefromjpeg($uploadedfile);
				list($width,$height)=getimagesize($uploadedfile);
				
				//set new width
				$newwidth1=350;
				$newheight1=($height/$width)*$newwidth1;
				$tmp1=imagecreatetruecolor($newwidth1,$newheight1);
						
				imagecopyresampled($tmp1,$src,0,0,0,0,$newwidth1,$newheight1,$width,$height);

				//new random name        
				$temp = explode(".", $_FILES["photo_loc"]["name"]);
				$newfilename = round(microtime(true)) . '.' . end($temp);
				 

				if(!(is_null($row1['photo_loc'])) && ($row1['photo_loc']!= "images/Dimensions/d_profile.jpg" ) ){
				unlink($row1['photo_loc']); //Delete old photo
				}
				$filename1 = "images/profile_img/". $newfilename;
							
				imagejpeg($tmp1,$filename1,100);
				
				imagedestroy($src);
				imagedestroy($tmp1);
				//insert in database
				$sql='UPDATE sme_profile set name="'.$name.'",  phone="'.$phone.'", about_sme="'.$about_sme.'", postal_addr="'.$postal_addr.'", pincode="'.$pincode.'", categoryname="'.$categoryname.'", sme_designation="'.$sme_designation.'", experience="'.$experience.'", skillset="'.$skillset.'", sme_cert="'.$sme_cert.'", sme_language="'.$sme_language.'", webinars="'.$webinars.'", sme_fees="'.$sme_fees.'", mode_of_cons="'.$chk.'", photo_loc="'.$filename1.'", resume_loc="'.$filename2.'", review_rating= 4 WHERE email ="'.$email.'"';           
				$result=mysqli_query($db, $sql) or die(mysqli_error($db));

				echo '<script>
						alert("Your Profile is Updated Successfully! .");
						window.location.replace("sme_dashboard.php");
					</script>';
			}	
	}
	
	elseif(file_exists($_FILES['resume_loc']['tmp_name'])){

		
	$fileinfo1 = pathinfo($_FILES['resume_loc']['name']);
		//getting the file extension 
		 $extension1 = $fileinfo1['extension'];
		if (($extension1 != "pdf") && ($extension1 != "doc") && ($extension1 != "docx") )
			{
				echo '<script>
						alert("Unknown Document Format. types allowed - pdf / doc / docx");
						window.location.replace("sme_dashboard.php");
				</script>';
			}
		else{
		
			$temp1 = explode(".", $_FILES["resume_loc"]["name"]);
			$newfilename1 = round(microtime(true)) . '.' . end($temp1);
			if(!(is_null($row2['resume_loc']))){
			unlink($row2['resume_loc']); //Delete old resume
			}
			
			$filename2 = "images/sme_resume/". $newfilename1;
			move_uploaded_file($_FILES["resume_loc"]["tmp_name"], $filename2);
		}
		
				//insert in database
				$sql='UPDATE sme_profile set name="'.$name.'",  phone="'.$phone.'", about_sme="'.$about_sme.'", postal_addr="'.$postal_addr.'", pincode="'.$pincode.'", categoryname="'.$categoryname.'", sme_designation="'.$sme_designation.'", experience="'.$experience.'", skillset="'.$skillset.'", sme_cert="'.$sme_cert.'", sme_language="'.$sme_language.'", webinars="'.$webinars.'", sme_fees="'.$sme_fees.'", mode_of_cons="'.$chk.'", resume_loc="'.$filename2.'", review_rating= 4 WHERE email ="'.$email.'"';           
				$result=mysqli_query($db, $sql) or die(mysqli_error($db));

				echo '<script>
						alert("Your Profile is Updated Successfully! .");
						window.location.replace("sme_dashboard.php");
					</script>';
	}





	elseif(file_exists($_FILES['photo_loc']['tmp_name'])){

		$fileinfo = pathinfo($_FILES['photo_loc']['name']);
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
				$uploadedfile = $_FILES['photo_loc']['tmp_name'];
				$src = imagecreatefromjpeg($uploadedfile);
				list($width,$height)=getimagesize($uploadedfile);
				
				//set new width
				$newwidth1=350;
				$newheight1=($height/$width)*$newwidth1;
				$tmp1=imagecreatetruecolor($newwidth1,$newheight1);
						
				imagecopyresampled($tmp1,$src,0,0,0,0,$newwidth1,$newheight1,$width,$height);

				//new random name        
				$temp = explode(".", $_FILES["photo_loc"]["name"]);
				$newfilename = round(microtime(true)) . '.' . end($temp);
				 

				if(!(is_null($row1['photo_loc'])) && ($row1['photo_loc']!= "images/Dimensions/d_profile.jpg" ) ){
				unlink($row1['photo_loc']); //Delete old photo
				}
				$filename1 = "images/profile_img/". $newfilename;
							
				imagejpeg($tmp1,$filename1,100);
				
				imagedestroy($src);
				imagedestroy($tmp1);
				//insert in database
				$sql='UPDATE sme_profile set name="'.$name.'",  phone="'.$phone.'", about_sme="'.$about_sme.'", postal_addr="'.$postal_addr.'", pincode="'.$pincode.'", categoryname="'.$categoryname.'", sme_designation="'.$sme_designation.'", experience="'.$experience.'", skillset="'.$skillset.'", sme_cert="'.$sme_cert.'", sme_language="'.$sme_language.'", webinars="'.$webinars.'", sme_fees="'.$sme_fees.'", mode_of_cons="'.$chk.'", photo_loc="'.$filename1.'",  review_rating= 4 WHERE email ="'.$email.'"';           
				$result=mysqli_query($db, $sql) or die(mysqli_error($db));

				echo '<script>
						alert("Your Profile is Updated Successfully! .");
						window.location.replace("sme_dashboard.php");
					</script>';
			}	
	}

			

	else{
			//insert in database
			$sql='UPDATE sme_profile set name="'.$name.'",  phone="'.$phone.'", about_sme="'.$about_sme.'", postal_addr="'.$postal_addr.'", pincode="'.$pincode.'", categoryname="'.$categoryname.'", sme_designation="'.$sme_designation.'", experience="'.$experience.'", skillset="'.$skillset.'", sme_cert="'.$sme_cert.'", sme_language="'.$sme_language.'", webinars="'.$webinars.'", sme_fees="'.$sme_fees.'", mode_of_cons="'.$chk.'",  review_rating= 4 WHERE email ="'.$email.'"';         
			$result=mysqli_query($db, $sql) or die(mysqli_error($db));

			echo '<script>
					alert("Your Profile is Updated Successfully! .");
					window.location.replace("sme_dashboard.php");
				</script>';
		}		
}
else{
	header("Location:index.php");
	exit;
} 
		
?>