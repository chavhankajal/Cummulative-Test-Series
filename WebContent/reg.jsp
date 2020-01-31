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
<script>
    history.forward();
</script>
<style>
.div1
{
	border:2px solid gray;
	padding:80px;
	width:500px;
	margin-top:20px;
	background-color:LightGray ;
	
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
 alert(role);
 
  if(role=="student")
	{
	$("#selectdiv").show();
	}


 else
	{
	$("#selectdiv").hide();
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
	     alert(name);
	     
	     var patternname = /^[a-zA-Z\s]+$/;
	     if(!name.match(patternname))
	    	 {
	    	 alert("hhhh");
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
		  		alert(select);
		  		if(select=="select")
		  			{
		  			alert("Please select your branch!!");
		  			return false;
		  		 }
		  		 }
		  		 
		  		 
		  	
  
			$.ajax({
				
				url:"RegistrationServlet",
				method:"POST",
				data:{action:"Registration", role:role,name:name,email:email,password:pass, select:select},
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
					
					alert('pooja');
					alert("Email is already exists");
					document.getElementById("email").value="";
					}
			}
		});
		
	});
})

</script>

</head>
<body style="background-color: #E83D35">
<div class="container" >
<div class="col-sm-4"></div>

<div class="col-sm-5 div1" style="background-color: white">
	<div>
	<h2 style="text-align:center;">Registration Form</h2>
	<br><br>
		<div class="form-group">
				<center>
					<select style="height:25px;" name="role" id="role">
					  <option value="select">Select Role</option> 
					  <option value="student">Student</option>
					  <option value="tpo">TPO</option>
					   <option value="faculty">Faculty</option>
					   <option value="alumini">Alumini</option>
					</select>
				</center>
		</div>		
	<br>		
		<div class="form-group">
		    <label for="name">Name:</label>
		    <input type="text" class="form-control" id="name" >
		  </div>
		<div class="form-group">
		    <label for="email">Email:</label>
		    <input type="email" class="form-control" name="email" id="email" >
		  </div>
		  <div class="form-group">
		    <label for="pwd">Password:</label>
		    <input type="password" class="form-control" id="password" >
		  </div>
		  
		  <div class="form-group" id="selectdiv" style="display:none">
		
		  <label for="branch">Branch</label><br>
		  <select style="height:30px" name="branch" id="selectbranch">
		  <option value="select">Select Branch</option>	
		  <option value="extc">EXTC</option>
		  <option value="electronic">ELECTRONIC</option>
		  <option value="computer">COMPUTER</option>
		  <option value="mechanical">MECHANICAL</option>
		</select>
		  
		  </div>
		  <br><br>
		  <center><button type="submit" class="btn btn-primary" id="submit"/>Submit</button>
		  <br><br>
		  Already have an account?<a href="Login.jsp"><span style="color:black;">&nbsp;&nbsp;Login Here</span></a>
		  </center>
		  
	</div>
	
</div>

</div>
<!-- <script src="email-validation.js"></script> -->
</body>
</html>