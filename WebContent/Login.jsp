<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
          $('#login').click(function(event) 
		  {  
	
	
	       // alert('1');
		  	var role=$('#lrole').val();
		  	if(role=="select")
		  		{
		  		alert("please select role!!");
		  		return false;
		  		}
            var email=$('#emailid').val();
			//alert(email);
		  	var pass=$('#lpassword').val();
            //alert("hello");

         if(role=="" || email=="" || pass =="")
        	 {
        	 alert("All fields are required!!!");
        	 return false;
        	 }
			$.ajax({
				
				url:"RegistrationServlet",
				method:"POST",
				data:{action:"Login", role:role,email:email,password:pass},
				success:function(data)
				{
					$("#role").val("");
					$("#emailid").val("");
					$("#lpassword").val("");
					//alert(data);
					
					if(data=="err")
						{
						alert("Wrong emailid or password");
						}
					
					else
						{
						if(role=="admin")
							{
							window.location.href="uploadnotes.jsp";
							}
						else if(role=="student")
							{
							window.location.href="instruction.jsp";
							}
						else if(role=="faculty")
							{
							
							window.location.href="addquestion.jsp";
							}
						
						else if(role=="alumini")
							{
							window.location.href="alumnidetail.jsp";
							}
						
						}
					
				}
			})
			
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

</head>
<body style="background: linear-gradient(to bottom, #ffcc99 0%, #ff5050 100%);">
<div style="background-color: #4b6b87; height:80px">
<div class="col-sm-4"></div>
				<div class="col-sm-8" style="margin-top:2%">
					<select style="height:30px; width:15%; border:2px solid #729ce0" name="role" id="lrole">
					 <option value="select">Select Role</option>
					  <option value="admin">Admin</option>
					  <option value="student">Student</option>
					  <option value="faculty">Faculty</option>
				
					</select>
				
	
		    <label for="email" style="color:white">Email:</label>
		    <input type="email" name="email" id="emailid" style="border:1px solid #729ce0" required>
		 
		    <label for="pwd" style="color:white">Password:</label>
		    <input type="password"  id="lpassword" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" style="border:1px solid #729ce0" required="">
		 <button type="submit" class="btn" style = "background-color: #5b1416; color:white" id="login" />Login</button>
		  
		
	
		  <a href="forgot.jsp" ><span style="color:white">Forgot Password????</span></a>
		  </div>
</div>

<div class="col-sm-12">
<div class="col-sm-6">
<div style="margin-top:20%">
<img src="img/book.jpg" style="width:70%; heigth:700px">
</div>

</div>
<div class="col-sm-6">

<h2>Register here!!!!!</h2><br>
<div class="col-sm-8">
<div class="form-group" >
 <label for="name">select role:</label>
				
					<select style="height:30px; width:35%; border:2px solid #729ce0" name="role" id="role" >
					  <option value="select">Select Role</option> 
					  <option value="student">Student</option>
					  
					   <option value="faculty">Faculty</option>
					   
					</select>
				
		</div>
		<br>		
		<div class="form-group ">
		    <label for="name">Name:</label>
		    <input type="text" class="form-control" id="name" style="border:1px solid #729ce0">
		  </div>
		<div class="form-group">
		    <label for="email">Email:</label>
		    <input type="email" class="form-control" name="email" id="email" style="border:1px solid #729ce0">
		  </div><br>
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
		  <br>
		  <center><button type="submit" class="btn" id="submit" style="background-color: #5b1416; color:white; margin-bottom:15px"/>Submit</button>
		  <br>
</div>

</div>
</div>






</body>
</html>