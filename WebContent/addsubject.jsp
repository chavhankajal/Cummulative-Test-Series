<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.training.pojo.FacultyPojo"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
$(document).ready(function()
		{
	
	$.ajax({
		url:"FacultyServlet",
		type:"POST",
		datatype:"JSON",
		data:{action:"getBranch"},
		success:function(data)
		{
			alert(data);
			$("#branch").empty();
			$.each(JSON.parse(data),function(key,value)
					{
						$("#branch").append("<option value="+value+">"+value+"</option>");
					});
		}
		
	});
	
		});
$(document).ready(function(){
	
	
	$("#add").click(function(){
		alert("hiii");
		var subject = $("#sub").val();
		var branch = $("#branch").val();
		var marks=$("#marks").val();
		if(subject=="" )
			{
			alert("subject is required");
			return false;
			}
	
		$.ajax({
			
		url:"FacultyServlet",
		type:"POST",
		data:{action:"addsubject", subject:subject, branch:branch,marks:marks},
		success:function(data){
			alert(data);
			window.location.href("addsubject.jsp");
		}
		
		
		})
		
		
		
		
		
	})
	
	
})

function edit()
{
	var fname =$("#fname").val();
	var femail =$("#femail").val();
	$.ajax({
		
		url:"FacultyServlet",
		type:"POST",
		data:{action:"facultyedit",  fname:fname,femail:femail},
		success:function(data){
			alert("uccessfully edited");
			
		}
		
		
		})
}




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
<body >
<div class="nav" style="background-color:#4b6b87"	>
<div style="float:right">
<ul>
<li class="btn " style="font-size:20px;text-align:right; margin-top:10px; "><a href="addBranch.jsp" ><span style="color:white;">Add Branch</span></a></li>
<li class="btn " style="font-size:20px;text-align:right; margin-top:10px; "><a href="#" ><span style="color:white;">Add Subject</span></a></li>
<li class="btn " style="font-size:20px;text-align:right; margin-top:10px; "><a href="editmarks.jsp" ><span style="color:white;">Edit Marks</span></a></li>
<li class="btn " style="font-size:20px;text-align:right; margin-top:10px; "><a href="addquestion.jsp" ><span style="color:white;">Add Question</span></a></li>
<li class="btn " style="font-size:20px;text-align:right; margin-top:10px; "><a href="studentMarks.jsp" ><span style="color:white;">Mark List</span></a></li>

<li class="btn"><a href="Login.jsp" style="font-size:20px;color:white; padding-right:20px">Logout</a></li>
</ul>
</div>
<div >
<ul>
<li style="color:white">Welcome: ${fname}</li>
</ul>
</div>


</div>
 <div class = "container-fluid">




<div class="row" style="background-color:white;">
 <div class="col-md-3" style="border:2px solid #4b6b87;height:580px;background-color:#4b6b87;padding-top:50px;">
 <label style="font-size: 15px;font-style: italic ;padding-top:15px;color:white">
 Name
 </label>
 <input type="text" style ="border-radius:25px;width:200px;" id="fname" value="${fname}"><br><br>
 
 <label style="font-size: 15px;font-style: italic;color:white">
Email
 </label>
 <input type="text" style ="border-radius:25px;width:200px;" id="femail" value="${femail}"><br><br>
<center> <button class="btn btn-primary" id="edit" value="EDIT"  onclick="edit();">EDIT</button></center>
 
 </div>
 
 
 
 
 
 
 <div class="col-md-9"> 

<center><h2 style="font-size: 18px;font-style: italic ;padding-top:15px;">Add Subject</h2></center><br><br>
<div class="row" >
<div class="col-sm-2"></div>
<div class="col-sm-8">
<div class ="col-sm-4">	<label style="font-size: 15px;font-style: italic ;padding-top:15px;" class=" control-label">Branch:</label></div>
	<div class="col-sm-8">
		<select style="height:30px;width:200px; border:1px solid #729ce0" name="branch" id="branch">
		  <option value="extc">SELECT</option>
		  
		</select>
	</div>
	</div>
	<div class="col-sm-2"></div>
</div>
	<br>
	<div class="row">
	
	<div class="col-sm-2"></div>
	<div class="col-sm-8">
	<div class="col-sm-4">
	<label class="control-label" style="font-size: 15px;font-style: italic ;padding-top:15px;">Subject:</label>
	</div>
	<div class="col-sm-8">
		<input type="text" name="sub" id ="sub"  class="form-control" style="border:1px solid #729ce0">
	</div>
	
	</div>
	
	<div class="col-sm-2"></div>
	
	
	
	
</div><br><br>


<div class="row">
	
	<div class="col-sm-2"></div>
	<div class="col-sm-8">
	<div class="col-sm-4">
	<label class="control-label">Total Marks:</label>
	</div>
	<div class="col-sm-8">
		<input type="text" name="marks" id ="marks"  class="form-control" style="border:1px solid #729ce0">
	</div>
	
	</div>
	
	<div class="col-sm-2"></div>
	
	
	
	
</div><br><br>


<div>
<center>
<input type="submit" name="submit" value="Add" id="add" class="btn btn-primary btn-lg">
</center>
</div>
</div>

</body>
</html>