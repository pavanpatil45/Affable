<?php
require_once ('connection.php');
//session_start();
if(isset($_SESSION['email'])){
	$email=$_SESSION['email'];
	$results = mysqli_query($db,"SELECT name, phone, email, pincode, postal_addr, categoryname, experience, skillset, sme_cert, sme_language, webinars, sme_fees, mode_of_cons, photo_loc, resume_loc, review_rating FROM sme_profile WHERE email = '{$email}'") or die(mysqli_error($db));
	$row_cnt=mysqli_num_rows($results);
	
	if($row_cnt==1){
		$row=mysqli_fetch_array($results);
		$name=$row['name'];
		$phone=$row['phone'];
		$email=$row['email'];
		$pincode=$row['pincode'];
		$postal_addr=$row['postal_addr'];
		$categoryname=$row['categoryname'];
		$experience=$row['experience'];
		$skillset=$row['skillset'];
		$sme_cert=$row['sme_cert'];
		$sme_language=$row['sme_language'];
		$webinars=$row['webinars'];
		$sme_fees=$row['sme_fees'];
		$mode_of_cons=$row['mode_of_cons'];
		$photo_loc=$row['photo_loc'];
		$resume_loc=$row['resume_loc'];
		$review_rating=$row['review_rating'];
		
	}
}
else{
	header("Location:index.php?smeSignIn=1");
	exit;
}
 



?>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
   <head>
      <!-- Mobile Specific Meta -->
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <meta charset="UTF-8">
      <!-- Site Title -->
      <title>AFFABLE || DASHBOARD</title>
      <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:300,400,700|Roboto:400,500" rel="stylesheet">
      <!--fontawesome-->
      <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css">
      <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600&display=swap">
      <!-- Bootstrap CSS -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
      <link rel="stylesheet" href="css/bootstrap.css">
      <!-- Owl carousel --->
      <link rel="stylesheet" href="css/owl.carousel.css">
      <!--Flickity carousel --->
      <link rel="stylesheet" href="https://unpkg.com/flickity@2/dist/flickity.min.css">
      <!--Page css -->
      <link rel="stylesheet" href="css/style.css">
      <!--jQuery Script-->
      <script src="js/jquery-2.2.4.min.js"></script>
   </head>
   <body data-spy="scroll" data-target=".navbar" data-offset="50" onload="sme_dashboard();">
      <!-- Start Header Area -->
      <header class="default-header" style="background-color: #38489E;">
         <nav class="navbar navbar-expand-lg navbar-light">
            <div class="container sme_dashboard">
               <a class="navbar-brand" href="index.html">
                  <!-- <img src="images/logo.png" alt="" style="max-width: 50%;"> -->
               </a>
               <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
               <span class="fa fa-bars"></span>
               </button>
               <div class="collapse navbar-collapse justify-content-end align-items-center" id="navbarSupportedContent">
                  <ul class="navbar-nav sme_dashboard_navbar">
                     <li><a class="active" href="#section1">CLIENT REQUESTS</a></li>
                     <li><a href="#section2">CONSULTATIONS</a></li>
                     <li><a href="#section3">TESTIMONIALS</a></li>
                     <li><a href="#section4">WEBINARS</a></li>
                     <li class="notifications_humberger"><a href="#section3">NOTIFICATIONS</a></li>
                     <li class="dropdown profile_humberger">
                        <a class="dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                        ACCOUNT</i>
                        </a>
                        <div class="dropdown-menu">
                           <a class="dropdown-item" href="#">View Profile</a>
                           <a class="dropdown-item" href="#" type="button" data-toggle="modal" data-target="#passwordChangeSME">Change Password</a>
                           <a class="dropdown-item" href="logout.php">Logout</a>
                        </div>
                     </li>
                     <li class="notifications"><a href="#"><i class="fas fa-bell fa-2x"></i></a></li>
                     <li class="dropdown profile">
                        <a class="dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                        <i class="fas fa-user-circle fa-2x"></i>
                        </a>
                        <div class="dropdown-menu" style="background-color: #f7f7f7;">
                           <a class="dropdown-item" href="#" onclick="viewSMEprofile();">View Profile</a>
                           <a class="dropdown-item" href="#" type="button" data-toggle="modal" data-target="#passwordChangeSME">Change Password</a>
                           <a class="dropdown-item" href="logout.php">Logout</a>
                        </div>
                     </li>
                  </ul>
               </div>
            </div>
         </nav>
      </header>
      <!-- End Header Area -->
      <br><br>
      <!-- Start About Area -->
      <section class="about-area section-gap" id="section1">
         <div class="container-fluid">
            <div class="row align-items-center justify-content-center">
               <div class="col-lg-6 col-md-12 about-right">
                  <div class="section-title text-left">
                     <h2>Who are we?</h2>
                     <h4>We are here to make it easier for you</h4>
                     <!-- <h2>We are here <br /> to make it easier for you</h2> -->
                  </div>
                  <div>
                     <p>
                        We connect you to Subject Matter Experts from various areas of expertise who will answer your questions and help you in taking right decisions in all your phases of life.
                     </p>
                  </div>
                  <a href="#" class="primary-btn">Read More</a>
               </div>
               <div class="col-lg-6 col-md-12 about-left">
                  <!-- <img class="img-fluid" src="images/about.png" alt=""> -->
                  <video controls class="img-fluid" loop autoplay muted>
                     <source src="images/test_video.mp4" type="video/mp4">
                  </video>
               </div>
            </div>
         </div>
      </section>
      <!-- End About Area -->
      <!-- <div class="container" id="sme_profile">
         <div class="profile_section">
            <div class="title">CREATE YOUR PROFILE</div>
            <div class="form">
               <form>
                  <div class="row">
                     <div class="col-sm-6">
                        <div class="inputfield">
                           <label>Email Address</label>
                           <input type="text" class="input" required="">
                        </div>
                        <div class="inputfield">
                           <label>Pincode</label>
                           <input type="text" class="input" required="">
                        </div>
                        <div class="inputfield">
                           <label>Postal Address</label>
                           <textarea class="textarea"></textarea>
                        </div>
                        <div class="inputfield">
                           <label>Fees per hour</label>
                           <input type="text" class="input" required="">
                        </div>
                        <div class="inputfield">
                           <label>Mode of cunsultation</label>
                           <label class="check">
                           <input type="checkbox">
                           <span class="checkmark"></span>
                           </label>
                           <p>Chat</p>
                           <label class="check">
                           <input type="checkbox">
                           <span class="checkmark"></span>
                           </label>
                           <p>Email</p>
                           <label class="check">
                           <input type="checkbox">
                           <span class="checkmark"></span>
                           </label>
                           <p>Call</p>
                        </div>
                        <div class="inputfield">
                           <label>Upload profile photo</label>
                           <input class="input" type="file" id="myFile" name="filename" required="">
                        </div>
                        <div class="inputfield">
                           <label>Upload resume</label>
                           <input class="input" type="file" id="myFile" name="filename" required="">
                        </div>
                     </div>
                     <div class="col-sm-6">
                        <div class="inputfield">
                           <label>Category</label>
                           <div class="custom_select">
                              <select required="">
                                 <option value="">Select</option>
                                 <option value="male">Category A</option>
                                 <option value="female">Category B</option>
                                 <option value="female">Category C</option>
                              </select>
                           </div>
                        </div>
                        <div class="inputfield">
                           <label>Experience</label>
                           <input type="text" class="input" placeholder="Enter years of experience">
                        </div>
                        <div class="inputfield">
                           <label>Skillset</label>
                           <textarea class="textarea" required=""></textarea>
                        </div>
                        <div class="inputfield">
                           <label>Languages known</label>
                           <input type="text" class="input" required="">
                        </div>
                        <div class="inputfield">
                           <label>Willingness for webinars</label>
                           <label class="check">
                           <input type="checkbox">
                           <span class="checkmark"></span>
                           </label>
                           <p>Yes</p>
                           <label class="check">
                           <input type="checkbox">
                           <span class="checkmark"></span>
                           </label>
                           <p>No</p>
                        </div>
                        <div class="inputfield">
                           <label>Upload certificates</label>
                           <input class="input" type="file" id="myFile" name="filename">
                        </div>
                        <div class="inputfield">
                           <input type="submit" value="UPLOAD PROFILE" class="btn">
                        </div>
                     </div>
                  </div>
               </form>
            </div>
         </div>
      </div> -->


      <!--Profile section of SME--->
      <div class="container" id="sme_profile">
         <div class="profile_section">
            <div class="title">YOUR PROFILE<span type="button" data-toggle="modal" data-target="#edit_profile"><i class="fas fa-pen" style="margin-left: 10px;"></i></span></div>
            <div class="form" >
               <form method="POST" action="sme_dashboard.php?email=<?php echo $email?>">
                  <div class="row">
                     <div class="col-sm-2">
						<img src="Data/photo_loc/<?php echo $photo_loc;?>" style="max-width: 100%;">

                     </div>
                     <div class="col-sm-5">

                        <div class="inputfield">
						<label>Name</label>
                          <label><?php echo $name;?></label>
						</div>
						
                        <div class="inputfield">
						<label>Phone Number</label>
                           <label><?php echo $phone;?></label>
						</div>
						
						
                        <div class="inputfield">
						<label>Email Address</label>
                           <label><?php echo $email;?></label>
						</div>
						
				
                        <div class="inputfield">
						<label>Pincode</label>
                          <label><?php echo $pincode;?></label>
						</div>
						
						
                        <div class="inputfield">
						<label>Postal Address</label>
                           <label><?php echo $postal_addr;?></label>
						</div>
						
						
                        <div class="inputfield">
						<label>Category</label>
                           <label><?php echo $categoryname;?></label>
						</div>
						
						
                        <div class="inputfield">
						<label>Experience in years</label>
                           <label><?php echo $experience;?></label>
						</div>
						
						
                        <div class="inputfield">
						<label>Skillset</label>
                           <label><?php echo $skillset;?></label>
						</div>
						
						
                     </div>
					 
					  <div class="col-sm-5" style="border-left: 1px solid #38489E;">
					  
                        <div class="inputfield">
						<label>Certifications and recognitions</label>
                           <label><?php echo $sme_cert;?></label>
						</div>
						
						
                        <div class="inputfield">
						<label>Languages known</label>
                           <label><?php echo $sme_language;?></label>
						</div>
						
						
                        <div class="inputfield">
						<label>Willingness for webinars</label>
                           <label><?php echo $webinars;?></label>
						</div>
						
						
                        <div class="inputfield">
						<label>Consultation Fees per hour</label>
                           <label><?php echo $sme_fees;?></label>
						</div>
						
						
                        <div class="inputfield">
						<label>Mode of cunsultation</label>
                           <label><?php echo $mode_of_cons;?></label>
						</div>
						
						
                        <div class="inputfield">
						<label>Upload profile photo</label>
                           <label><?php echo $photo_loc;?></label>
						</div>
						
						
                        <div class="inputfield">
						<label>Upload resume</label>
                           <label><?php echo $resume_loc;?></label>
						</div>
						
						 <div class="inputfield">
						<label>Review Rating</label>
                           <label><?php echo $review_rating;?></label>
						</div>
						
						
                     </div>
					</div>
                  </div>
                  <br>
                  <!-- <div class="row">
                     <div class="col-sm-4"></div>
                     <div class="col-sm-4">
                        <div class="inputfield">
                           <input value="EDIT PROFILE" class="btn" type="button" data-toggle="modal" data-target="#edit_profile">
                        </div>
                     </div>
                     <div class="col-sm-4"></div>
                  </div> -->
               </form>
            </div>
         </div>
      </div>
      <!--Profile section of SME end--->

      <!-- modal for SME profile edit --->
      <div class="modal fade" id="edit_profile" role="dialog">
         <div class="modal-dialog modal-lg">
            <!-- Modal content-->
            <div class="modal-content">
               <div class="modal-body">
                  <div class="profile_section">
                     <div class="title">EDIT YOUR PROFILE</div>
                     <div class="form">
                        
						<!--<form method="post" action="edit_sme_profile.php>-->
						<form method="POST" action="edit_sme_profile.php" enctype="multipart/form-data"> 
                          



						  <div class="row">
						  <div class="col-sm-3">
							 <img src="Data/photo_loc/<?php echo $photo_loc;?>" style="max-width: 100%;">
						  </div>
                        
							<div class="col-sm-9">
							  
							  
                       <div class="inputfield">
						<label>Name</label>
                          <input type="input" class="input" id="name" name="name" value="<?php echo $name;?>"  >
						</div>
						
                        <div class="inputfield">
						<label>Phone Number</label>
                          <input type="input" class="input"  id="phone" name="phone" value="<?php echo $phone;?>" >
						</div>
						
						
                        <div class="inputfield">
						<label>Email Address</label>
                          <input type="input" class="input"   id="email" name="email" value="<?php echo $email;?>" readonly >
						</div>
						
						
                           <div class="inputfield">
                              <label>Pincode</label>
                              <input type="input" class="input"  id="pincode" name="pincode"  placeholder="721301" value="<?php echo $pincode;?>">
                           </div>
						   
						   
                           <div class="inputfield">
                              <label>Postal Address</label>
                              <input type="input" class="input"  id="postal_addr" name="postal_addr"  placeholder="Mirpur, near H.P. Gas Godown, Kharagpur, Paschim Medinipur" value="<?php echo $postal_addr;?>">
                           </div>
						   
						   
                              </div>
                           </div><br>
						   
						   
						   
                           <div class="inputfield">
                              <label>Category</label>
                              <div class="custom_select">
                                 <select name="categoryname" required="">
                                    <option value="Entrepreneurship">Entrepreneurship</option>
                                    <option value="Health and Fitness">Health and Fitness</option>
                                    <option value="IT">IT</option>
									<option value="RealEstate">RealEstate</option>
                                    <option value="Others">Others</option>
                                 </select>
                              </div>                           
							  </div>
						   
						   
                           <div class="inputfield">
                              <label>Experience in years</label>
                              <input type="input" class="input"  id="experience" name="experience" placeholder="7" value="<?php echo $experience;?>">
                           </div>
						   
						   
                           <div class="inputfield">
                              <label>Skillset</label>
                              <input type="input" class="input" id="skillset"   name="skillset" placeholder="Excellent in Frontend Web development using HTML, CSS and JavaScript" value="<?php echo $skillset;?>">
                           </div>
						   
						   
                           <div class="inputfield">
                              <label>Certifications and recognitions</label>
                              <input type="input" class="input"  id="sme_cert" name="sme_cert" placeholder="Graduate from B.P. Poddar Institute of Management and Technology" value="<?php echo $sme_cert;?>">
                           </div>
						   
						   
                           <div class="inputfield">
                              <label>Languages known</label>
                              <input type="input" class="input"   id="sme_language" name="sme_language"  placeholder="English, Hindi, Bengali" value="<?php echo $sme_language;?>">
                           </div>
						   
						   
                           <div class="inputfield">
                              <label>Willingness for webinars</label>
							  
							  <label class="check">
                              <input type="radio" name="webinars" value="Yes" checked="">
							  </label>
                              <p>Yes</p>
                             
							 <label class="check">
                              <input type="radio" name="webinars" value="No">
                              </label>
                              <p>No</p>
                             
							 </div>
						   
						   
                           <div class="inputfield">
                              <label>Consultation Fees per hour</label>
                              <input type="input" class="input"  id="sme_fees" name="sme_fees" value="<?php echo $sme_fees;?>">
                           </div>
						   
						   
                           <div class="inputfield">
                              <label>Mode of Consultation</label>
                              <label class="check">
                              <input type="checkbox" name="MOC[ ]" value="Chat" checked="">
                              <span class="checkmark"></span>
                              </label>
                              <p>Chat</p>
                              <label class="check">
                              <input type="checkbox" name="MOC[ ]" value="Email" checked="">
                              <span class="checkmark"></span>
                              </label>
                              <p>Email</p>
                              <label class="check">
                              <input type="checkbox" name="MOC[ ]" value="Call">
                              <span class="checkmark"></span>
                              </label>
                              <p>Call</p>                      
						  </div>
						   
						   
                           <!-- <div class="inputfield">
                              <label>Upload profile photo</label>
                              <input class="input" type="file" id="myFile" name="filename" required="">
                           </div> -->
                           <div class="inputfield">
                              <label>Upload resume</label>
                              <input type="file"  id="resume_loc" name="resume_loc" value="<?php echo $resume_loc;?>">
                           </div>
						   
						   
                           <div class="inputfield">
                              <label>Upload profile photo</label>
                              <input type="file" id="photo_loc" name="photo_loc" value="<?php echo $photo_loc;?>">
                           </div>
						   
						   
						    <div class="inputfield">
                              <label>Review Rating</label>
                              <input type="input" class="input" id="review_rating" name="review_rating" value="<?php echo $review_rating;?>" readonly>
                           </div>
						   
						   
                           <div class="row">
                              <div class="col-sm-4"></div>
                              <div class="col-sm-4">
							  
							  
                                 <div class="inputfield">
                                    <input type="submit" id="sme_update" name="sme_update" value="UPLOAD CHANGES" class="btn">
                                 </div>
								 
								 
                              </div>
                              <div class="col-sm-4"></div>
                           </div>
                        </form>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>

 <!--end modal for SME profile edit --->

      <!-- modal for SME password change --->
      <div class="modal fade" id="passwordChangeSME" role="dialog">
         <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
               <div class="modal-body">
                  <div class="profile_section">
                     <div class="title">CHANGE PASSWORD</div>
                     <div class="form">
                        <form>
                           <div class="inputfield">
                              <label>Current Password</label>
                              <input type="Password" class="input pwd" id="old-password" required="">
                           </div>
                           <div class="inputfield">
                              <label>New Password</label>
                              <input type="Password" class="input pwd" id="new-password" required="">
                           </div>
                           <div class="inputfield">
                              <label>Confirm Password</label>
                              <input type="Password" class="input pwd" id="cpassword" required="">
                           </div>
                           <div class="row">
                              <div class="col-sm-3"></div>
                              <div class="col-sm-6">
                                 <div class="inputfield">
                                    <input type="button" value="SAVE PASSWORD" id="update-password" class="btn">
                                 </div>
                              </div>
                              <div class="col-sm-3"></div>
						   </div>
						   <br><div class="alert alert-success" role="alert" id="status" style="display: none;"></div>
                        </form>
                     </div>
                  </div>
               </div>
            </div>
         </div>
	  </div>
	  
	  
	  <script>
		$(document).ready(function() {
			$('#update-password').click(function() {
				var oldPassword = $('#old-password').val();
				var newPassword = $('#new-password').val();
				var cpassword = $('#cpassword').val();
				var status = document.getElementById("status");
				var error = 0;
				
				if(oldPassword.length == 0)
					error = "Please fill out old password field";
				else if(newPassword.length == 0)
					error = "Please fill out new password field";
				else if(newPassword != cpassword)
					error = "Passwords do not match";	
				
				if(error != 0) {
					status.innerHTML = error;
					status.setAttribute("class", "alert alert-danger");
					status.style.display = "block";
				}
				
				else {
					$.ajax({
						url: "update_sme_password.php",
						method: "POST",
						data: {oldPassword: oldPassword, newPassword: newPassword},
						success: function(error) {
							if(error != 0) {
								status.innerHTML = error;
								status.setAttribute("class", "alert alert-danger");
							}
							else {
								for(var i=0; i<3; i++)
									document.getElementsByClassName("pwd")[i].value="";
								status.innerHTML = "Password updated successfully.";
								status.setAttribute("class", "alert alert-success");
							}
							status.style.display = "block";
						}
					});
				}
			});
		});
	  </script>
	  
	  
      <!--end modal for SME password change --->


      <!-- Start footer -->
      <footer style="background-color: #f2f2f2">
         <div class="container">
            <div class="row">
               <div class="col-md-2">
                  <h2><i><b>AFFABLE</b></i></h2>
               </div>
               <div class="col-md-5">
                  <span style="color: #38489E;">Copyright © 2019, All Right Reserved Affable</span>
               </div>
               <div class="col-md-2"></div>
               <div class="col-md-3 social_icons">
                  <i class="fab fa-twitter"></i>
                  <i class="fab fa-facebook"></i>
                  <i class="fab fa-linkedin"></i>
                  <i class="fab fa-pinterest"></i>
                  <i class="fab fa-instagram"></i>
               </div>
            </div>
         </div>
      </footer>
      <!-- end footer -->
      
      <!--- Scripts section --->
      <!-- sticky nav -->
      <script src="js/jquery-2.2.4.min.js"></script>
      <script src="js/parallax.min.js"></script>
      <script src="js/owl.carousel.min.js"></script>
      <script src="js/isotope.pkgd.min.js"></script>
      <script src="js/jquery.magnific-popup.min.js"></script>
      <script src="js/jquery.sticky.js"></script>
      <script src="js/main.js"></script>
      <script src="js/pageHandler.js"></script>
      <!-- For carousel --->
      <script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/easytimer@1.1.1/src/easytimer.min.js"></script>
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
      <!-- For accordion in FAQ section --->
      <script>
         const accordion = document.getElementsByClassName('contentBx');
         
         for(i=0; i< accordion.length; i++ ){
         
           accordion[i].addEventListener('click', function(){
         
             this.classList.toggle('active')
         
           })
         
         }
      </script>
      <script>
         function clickEvent(first,last){
             if(first.value.length){
                 document.getElementById(last).focus();
             }
         }
      </script>
   </body>
</html>