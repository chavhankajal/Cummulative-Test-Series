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
<link rel="stylesheet" href="css/style.css">
<title>Insert title here</title>

<script>
    history.forward();
</script>


<script>

function fetchmsg()
{
	alert("hello");
	$(document).ready(function(){
		alert("hello");
		var name=$('#user').val();
		alert(name);
		$.ajax({
			url:"TpoServlet",
			method:"POST",
			data:{action:"getmsg", name:name},
			success:function(data)
			{
				$("#msg").val(data);
			}
			
			
			
			
		})
		
		
		
		
		
	})
	
	
	}


</script>


<script>
        $(document).ready(function() 
		{                
          $('#submit').click(function(event) 
		  {  
	
	

	$("#submit").prop('disabled', true);
            var subjectname=$('#subjectname').val();
		  	var msg=$('#msg').val();
            /* $.get('ActionServlet',{user:username},function(responseText) 
		    { 
              $('#welcometext').text(responseText);         
            }); */
			$.ajax({
				
				url:"TpoServlet",
				method:"POST",
				data:{action:"Sendsubject", subjectname:subjectname,msg:msg},
				success:function(data){
					
					alert("mail has been sent to B.E Student");
					window.location.href="index.jsp";
					
					
				}
			})
			
          });
      });
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
<div class="nav" style="background-color:#4b6b87">
<div style="float:right">
<ul>
<li class="btn " style="text-align:right;font-size:20px;  "><a href="index.jsp" ><span style="color:white">Details</span></a></li>
<li class="btn " style="text-align:right; font-size:20px; "><a href="AddCriteria.jsp" ><span style="color:white">Add Criteria</span></a></li>

<li class="btn"><a href="Login.jsp" style="font-size:20px;color:white; padding-right:20px">Logout</a></li>
</ul>
</div>
<div >
<ul>

<li style="color:white">Welcome: ${tname}</li>
</ul>
</div>
</div>

<div class="container-fluid">
<div class="col-sm-1"></div>
<div class="div1 col-sm-10" style="background-color:white; border:2px solid #a32d41">
<div>
<ul style="text-align:right">
</ul>
</div>
<br><br>
<div>
<strong style="font-size:20px;">Subject:</strong><br><br>
<!-- select style="height:40px;width:150px;font-size:18px;" id="user">
  <option value="Java">Java</option>
  <option value="Php">Php</option>
  <option value="Android">Android</option>
  <option value=".Net">.Net</option>
</select> -->
<input type="text" name="subjectname" id = "subjectname" class="form-control" style="border:1px solid #729ce0">
</div>
<br><br>
<div class="form-group">
<label for=" Email1msg" style="float:left;font-size:20px;">Message:</label>
<textarea class="form-control" rows="5" id="msg" style="border:1px solid #729ce0"></textarea>
</div>
<br><br>
<center>
<input type="submit" value="Send" style="height:50px;width:100px;font-size:18px;" id="submit" class="btn btn-primary">
</center>
</div>
</center>
</body>
</html>