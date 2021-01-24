function validate_login() {  
	var result = "";	
	result += validateEmail(); 
	result += validatePassword();

	if (result == "") return true;
	
	alert("Validation Result:\n\n" + result);
	return false;	
}

function validateEmail() {
	var email = document.getElementsByName("email")[0].value;
	if (!email)
		return "please Enter Email.\n";	
	return "";
	
}


function validatePassword() {
	var pass = document.getElementsByName("password")[0].value;
	
	if (!pass) 
		return "Please Enter password\n\n";
	return "";	
}


function valueOf(name) {
	return document.getElementsByName(name)[0].value;
}
