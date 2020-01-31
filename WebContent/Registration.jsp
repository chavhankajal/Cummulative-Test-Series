<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="scripts/validation.js"></script>
<title>Registration</title>
<style>
.div1
{
	border:2px solid gray;
	padding:80px;
	width:500px;
	margin-top:20px;
	
	background-color:white ;
	
}
label
{
	font-size:20px;
}
.btn
{
	font-size:20px;
}
</style>
<!-- <script>
$(document).ready(function(){
 $("#password").blur(function(){
	
		 
	
			  alert("hiiiiiiiiiiiii");
			var pass = $("#password").val();
			alert(pass);
			var pattern =  /^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])([a-zA-Z0-9]{8})$/;
			
			if(pass.match(pattern))
			{
				alert("jjk");
				return true;
			}
			else
				{
				alert("jjjkjkjkj");
				return false;
				}
			  
		  });
 })
 </script>
 -->
 
 <script>
 $(document).ready(function(){
	 $("#role").change(function(){
			
 var role=$('#role').val();
 //alert(role);
 
  if(role=="student")
	{
	$("#selectdiv").show();
	$("#parentsdiv").show();
	}


 else
	{
	$("#selectdiv").hide();
	$("#parentsdiv").hide();
	} 
	
	});
	 });

 
 
 </script>
 
 
<script>
        $(document).ready(function() 
		{                        
          $('#submit').click(function(event) 
		  {  
	
	      if($("#name").val()=='' || $('#email').val()=='' || $('#password').val()=='')
	    	  {
	    	  alert("All fields are required!!!");
	    	  return false;
	    	  }
		  
		  var pass = $("#password").val();
			//alert(pass);
			var pattern =  /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
			
			if(!pass.match(pattern))
		
				{
				alert("Password must contain atleast 1 number, special character and capital letter");
				$("#password").val("");
				return false;
				}
		  
	     var name = $("#name").val();
	   //  alert(name);
	     
	     var patternname = /^[a-zA-Z\s]+$/;
	     if(!name.match(patternname))
	    	 {
	    	 //alert("hhhh");
	    	 alert("only characters are allowed in name!!");
	    	 $("#name").val("");
	    	 return false;
	    	 }
		    var role=$('#role').val();
		   
            var name=$('#name').val();
           // alert(name);
		  	var email=$('#email').val();
		  	var pass=$('#password').val();
		  	 if(role=="select")
		    	{
		  		 alert("Please select role!!!");
		  		 return false;
		    	}
		  	 if(role=="student")
		  		 {
		  		var select =  $("#selectbranch").val();
		  		var pemail = $("#pemail").val();
		  		//alert(select);
		  		if(select=="select")
		  			{
		  			alert("Please select your branch!!");
		  			return false;
		  		 }
		  		 atpos = pemail.indexOf("@");
				  dotpos = pemail.lastIndexOf(".");
				  
				  if (atpos < 1 || ( dotpos - atpos < 2 )) 
					{
					
						alert("Please enter correct email ID.")
						document.getElementById("pemail").value="";
						return false;
						}
		  		 }
		  	 var cnfpass=$("#cnfpass").val();
		  		 
		  	if($("#cnfpass").val()!=$("#password").val())
		  		{
		  		alert("Password and confirm password should be same");
		  		$("#cnfpass").val("");
		  		return false;
		  		}
		  	
  
			$.ajax({
				
				url:"RegistrationServlet",
				method:"POST",
				data:{action:"Registration", role:role,name:name,email:email,password:pass,cnfpass:cnfpass, select:select, pemail:pemail},
				success:function(data){
					$("#role").val("");
					$("#name").val("");
					$("#email").val("");
					$("#password").val("");
					alert(data);
					window.location.href="Login.jsp";
				
				}
			})
			if ($('.message-input').val() == '') {
            return false;
 }
          });
      });
</script>

<script>
$(document).ready(function(){
	
	
	$("#email").blur(function(){
		var email = $("#email").val();
		
		 atpos = email.indexOf("@");
		  dotpos = email.lastIndexOf(".");
		  
		  if (atpos < 1 || ( dotpos - atpos < 2 )) 
			{
			
				alert("Please enter correct email ID.")
				document.getElementById("email").value="";
				return false;
				}
		
		alert(email);
		var role = $("#role").val();
		alert(role);
		$.ajax({
			
			type:"POST",
			url:"ValidationServlet",
			data:{email:email, role:role},
			success:function(data)
			{
				if(data=="success")
					{
					
				//	alert('pooja');
					alert("Email is already exists");
					document.getElementById("email").value="";
					}
			}
		});
		
	});
})

</script>
<style>
body
{
background-image: url("img/user.jpg");
background-repeat: no-repeat;
background-size:cover;

}

</style>

</head>
<body>
<div class="container">
<div class="col-sm-4"></div>

<div class="col-sm-5 div1">
	<div>
	<h2 style="text-align:center;font-family: cursive;">Registration </h2>
	<br><br>
		<div class="form-group" >
				<center>
					<select style="height:30px; width:35%; border:2px solid #729ce0" name="role" id="role" >
					  <option value="select">Select Role</option> 
					  <option value="student">Student</option>
					  
					   <option value="faculty">Faculty</option>
					   
					</select>
				</center>
		</div>		
	<br>		
		<div class="form-group">
		    <label for="name">Name:</label>
		    <input type="text" class="form-control" id="name" style="border:1px solid #729ce0">
		  </div>
		<div class="form-group">
		    <label for="email">Email:</label>
		    <input type="email" class="form-control" name="email" id="email" style="border:1px solid #729ce0">
		  </div>
		  <div class="form-group">
		    <label for="pwd">Password:</label>
		    <input type="password" class="form-control" id="password" style="border:1px solid #729ce0">
		  </div>
		  <div class="form-group">
		    <label for="pwd">Confirm Password:</label>
		    <input type="password" class="form-control" id="cnfpass" style="border:1px solid #729ce0">
		  </div>
		  <div class="form-group" id="parentsdiv" style="display:none; color:black">
		  <label for="pwd">Parents Email:</label>
		    <input type="email" class="form-control" id="pemail" style="border:1px solid #729ce0">
		   </div>
		  
		  <div class="form-group" id="selectdiv" style="display:none; color:black">
		
		  <label for="branch">Branch</label><br>
		  <select style="height:30px; width:35%; border:2px solid #729ce0" name="branch" id="selectbranch" >
		  <option value="select">Select Branch</option>	
		  <option value="extc">EXTC</option>
		  <option value="electronic">ELECTRONIC</option>
		  <option value="computer">COMPUTER</option>
		  <option value="mechanical">MECHANICAL</option>
		  <option value="it">IT</option>
		</select>
		  
		  </div>
		  <br><br>
		  <center><button type="submit" class="btn btn-primary" id="submit"/>Submit</button>
		  <br><br>
		 <b> Already have an account?</b><a href="Login.jsp"><span style="color:red; font-family: cursive; font-size:20px">&nbsp;&nbsp;Login Here!!!!</span></a>
		  </center>
		  
	</div>
	
</div>

</div>
<!-- <script src="email-validation.js"></script> -->
</body>
</html>