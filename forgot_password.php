
<?php
$message="";
$valid='true';
include("connection.php");
session_start();
if($_SERVER["REQUEST_METHOD"] == "POST"){
    $email=mysqli_real_escape_string($db,$_POST['email']);
    $details=mysqli_query($db,"SELECT name,email FROM sme_reg WHERE email='$email'");
    if (mysqli_num_rows($details)>0) { //if the given email is in database, ie. registered
        $message_success=" Please check your email inbox or spam folder and follow the steps";
        //generating the random key
        $key=md5(time()+123456789% rand(4000, 55000000));
        //insert this temporary key into database
        $sql_insert=mysqli_query($db,"INSERT INTO forget_password(email,temp_key) VALUES('$email','$key')");
        //sending email about update
        $to      = $email;
		$subject = 'RESET PASSWORD DEMO by Pavan';
        $msg = "Please click the URL to Reset your Password". "\r\n"."http://localhost/Affable/forgot_password_reset.php?key=".$key."&email=".$email;
        $headers = 'From: AFFABLE' . "\r\n";
       if(mail($to, $subject, $msg, $headers))
				{
					echo "Email successfully sent to $to...";
				} 	else {
					echo "Email sending failed...";
				}
    }
    else{
        $message="Sorry! no account associated with this email";
    }
}
?>
<!DOCTYPE html>
<html>
  <head>
    
    <title>Forgot Password</title>
  </head>
  <body>
			<form role="form" method="POST">
            <div class="form-group"><br><br>
			
			<label>Email</label>
              <input type="text" name="email"  placeholder="Email" >
            </div>
            
            <?php if (isset($error)) {
                      echo"Error:".$error."</div>";
                 } ?>
            <?php if ($message<>"") {
                      echo $message;
                } ?>
            <?php if (isset($message_success)) {
                      echo"Success:".$message_success;
                  } ?>
				  
			<br><br>
              <button type="submit" class="btn" name="submit">Send Reset Email</button>
              <br><br>
              <a href="login.php">Back to Login</a>
              <br>
          </form>
 

 
  </body>
</html>
