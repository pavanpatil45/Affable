<?php
	
	include "connection.php";
	
	$date= $_POST['date22']; 
	$fromtime=$_POST['startone22'];
	$totime=$_POST['one22']; 
	$cid=$_POST['followup_cid'];
	$sme_email=$_POST['followup_sme_email'];
	$client_email=$_POST['followup_client_email'];
	//insert in database
	
	
	 $query44 = 'SELECT * FROM followup WHERE consultationid = "'.$cid.'"';
	 $select44 = mysqli_query($db, $query44);
	 $rowcount44=mysqli_num_rows($select44);
		
	if($rowcount44==1){
	echo '<script>
				alert("You cant followup again, Only one Followup is Allowed");
				window.location.replace("sme_dashboard.php");
			</script>';
	}
	else{					
						   
						   
		$sql="INSERT INTO followup(followup_date, starttime, endtime, consultationid, sme_email, client_email) VALUES('$date', '$fromtime', '$totime', '$cid', '$sme_email', '$client_email')";              
		$result=mysqli_query($db, $sql) or die(mysqli_error($db));
		
		
		$sql1='update consultation set status= "followup" where consultationID = "'.$cid.'"';                 
		$result1=mysqli_query($db, $sql1) or die(mysqli_error($db));
		
        echo '<script>
				alert("Followup Scheduled");
				window.location.replace("sme_dashboard.php");
			</script>';
		
	}

?>