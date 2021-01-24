function validate_reg() {  
		var result = "";	
		result += validateName(); 	
		result += validateEmail();
		result += validatePhone();
		result += validatePassword();
		
		
		if (result == "") return true;
	
	alert("Validation Result:\n\n" + result);
	return false;
	}

	function validateName() {
		var name = document.getElementsByName("name")[0].value;
		if (name.length <= 3)
			return "Name should be at least three characters.\n";	
		return "";
		
	}

	function validatePassword() {
		var password = valueOf("password_1");
		var retype = valueOf("password_2");
		
		if (password.length < 3) 
			return "Password should be at least 3 characters.\n";
		
		if (password != retype) 
			return "Passwords do not match.\n";	
		return "";
	}

	function validateEmail() {
		var email = valueOf("email");
		
		
		if (email.indexOf('@') == -1) 
			return "Email is not valid.\n";
		
		
		return "";	
	}
	
	
	function validatePhone() {
		var phone = valueOf("phone");
		if (phone.length!=10) 
			return "Mobile number must be of 10 Digits.\n";

		return "";	
	}



	function valueOf(name) {
		return document.getElementsByName(name)[0].value;
	}