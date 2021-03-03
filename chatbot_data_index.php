<?php
	
	include "connection.php";
	
	$user_type= $_POST['user_type']; 
	$name=$_POST['name'];
	$email=$_POST['email']; 
	$category=$_POST['category'];
	
	
	if (empty($_POST['request_details'])){ 
    $request_details="NULL";
	}
	else{
	$request_details=$_POST['request_details'];
	}
			
		//insert in database
		$sql="INSERT INTO chatbot_data(user_type, name, email, category, request_details) VALUES('$user_type', '$name', '$email', '$category', '$request_details')";              
		$result=mysqli_query($db, $sql) or die(mysqli_error($db));

        header("Location:index.php");
		exit;


?>