<?php
	
	include "connection.php";
	
if(isset($_SESSION['email'])){
	
	$email=$_SESSION['email'];	
	
	
	$att_name= $_POST['att_name']; 
	$att_desig=$_POST['att_desig'];
	$testimony=$_POST['testimony']; 
	
 	$resume_loc= $_FILES['att_audio'];
	$targetResumeDir = "images/Testimonials/audios/";
	$ResumeName = basename($_FILES["att_audio"]["name"]);
	$targetResumePath = $targetResumeDir . $ResumeName;
	$ResumeType = pathinfo($targetResumePath,PATHINFO_EXTENSION);
	$allowResumeTypes = array('wav','mp3','ogg','aac','m4a');
	if(in_array($ResumeType, $allowResumeTypes))
		move_uploaded_file($_FILES["att_audio"]["tmp_name"], $targetResumePath); 

	
		
	$fileinfo = pathinfo($_FILES['att_photo']['name']);
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

    
        $uploadedfile = $_FILES['att_photo']['tmp_name'];
        $src = imagecreatefromjpeg($uploadedfile);
        list($width,$height)=getimagesize($uploadedfile);
        
        //set new width
        $newwidth1=350;
        $newheight1=($height/$width)*$newwidth1;
        $tmp1=imagecreatetruecolor($newwidth1,$newheight1);
                
        imagecopyresampled($tmp1,$src,0,0,0,0,$newwidth1,$newheight1,$width,$height);

        //new random name        
        $temp = explode(".", $_FILES["att_photo"]["name"]);
        $newfilename = round(microtime(true)) . '.' . end($temp);
                
        $filename1 = "images/Testimonials/photos/". $newfilename;
                    
        imagejpeg($tmp1,$filename1,100);
        
        imagedestroy($src);
        imagedestroy($tmp1);
        //insert in database
		$sql="INSERT INTO testimonial(att_name, att_desig, testimony, sme_email, att_photo, att_audio) VALUES('$att_name', '$att_desig', '$testimony', '$email', '$filename1', '$ResumeName')";              
		$result=mysqli_query($db, $sql) or die(mysqli_error($db));

        echo '<script>
				alert("Attestant Added Successfully! .");
				window.location.replace("sme_dashboard.php");
			</script>';
		
		
   }
	}	
else{
	header("Location:index.php");
	exit;
} 


?>