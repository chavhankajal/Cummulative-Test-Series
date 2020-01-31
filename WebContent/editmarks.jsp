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
			$("#branch").append("<option value='Select'>SELECT</option>");
			$.each(JSON.parse(data),function(key,value)
					{
						$("#branch").append("<option value="+value+">"+value+"</option>");
					});
		}
		
	});
	
		});
		
function fetchSubject()
{
	
	var branch = $("#branch option:selected").val();
	alert("branch "+branch);
	
	$.ajax({
		url:"FacultyServlet",
		type:"POST",
		datatype:"JSON",
		data:{action:"fetchFacultySubject",branch:branch},
		success:function(data)
		{
			$("#subject").empty();
			$("#subject").append("<option value='select'>SELECT</option>")
			$.each(JSON.parse(data),function(key,value)
			{
			$("#subject").append("<option value="+value+">"+value+"</option>")
			});
		}
		
	});
	
}


function fetchMarks()
{
	var branch = $("#branch option:selected").val();
	var subject =$("#subject option:selected").val();
	$.ajax({
		url:"FacultyServlet",
		type:"POST",
		datatype:"JSON",
		data:{action:"fetchSubjectMarks",branch:branch,subject:subject},
		success:function(data)
		{
		  $("#marks").val(data);
		}
		
	});
	
}

function Update()
{
	var branch = $("#branch option:selected").val();
	var subject =$("#subject option:selected").val();
	var marks=$("#marks").val();
	$.ajax({
		url:"FacultyServlet",
		type:"POST",
		
		data:{action:"editSubjectMarks",branch:branch,subject:subject,marks:marks},
		success:function(data)
		{
		  alert(data);
		}
		
	});
	
}

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
<li class="btn " style="text-align:right; margin-top:10px;font-size:20px; "><a href="addBranch.jsp" ><span style="color:white;">Add Branch</span></a></li>
<li class="btn " style="text-align:right; margin-top:10px;font-size:20px; "><a href="addsubject.jsp" ><span style="color:white;">Add Subject</span></a></li>
<li class="btn " style="text-align:right; margin-top:10px;font-size:20px; "><a href="#" ><span style="color:white;">Edit Marks</span></a></li>
<li class="btn " style="text-align:right; margin-top:10px;font-size:20px;"><a href="addquestion.jsp" ><span style="color:white;">Add Question</span></a></li>
<li class="btn " style="text-align:right; margin-top:10px;font-size:20px; "><a href="studentMarks.jsp" ><span style="color:white;">Mark List</span></a></li>

<li class="btn"><a href="Login.jsp" style="font-size:20px;color:white; padding-right:20px">Logout</a></li>
</ul>
</div>
<div >
<ul>
<li style="color:white">Welcome: ${fname}</li>
</ul>
</div>


</div>




<div class="container-fluid">
<div class="row" style="background-color: white;">
 <div class="col-md-6" style="padding-top:50px;height:580px;width:300px;background-color:#4b6b87 ;">
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
 
 
 
 
 
 
 <div class="col-md-6"> 
<div class="form-group" >
<center><h2>Edit Marks</h2></center><br><br>
<div class="col-sm-2"></div>
<div class="col-sm-8">
<div class ="col-sm-4">	<label class=" control-label">Branch:</label></div>
	<div class="col-sm-6">
		<select style="height:30px; border:1px solid #729ce0;width: 250px;" name="branch" id="branch" onchange="fetchSubject();">
		  
		  
		</select>
	</div>
	</div>
	<div class="col-sm-2"></div>
	</div>
	<br>
	<div class="form-group">
	
	<div class="col-sm-2"></div>
	<div class="col-sm-8">
	<div class="col-sm-4">
	<label class="control-label">Subject:</label>
	</div>
	<div class="col-sm-6">
		<select id="subject" style="height:30px; border:1px solid #729ce0;width:250px;" name="subject"  onchange="fetchMarks();">
		
		
		</select>
	</div>
	
	</div>
	
	<div class="col-sm-2"></div>
	
	
	
	
</div><br><br>


<div class="form-group">
	
	<div class="col-sm-2"></div>
	<div class="col-sm-8">
	<div class="col-sm-4">
	<label class="control-label">Total Marks:</label>
	</div>
	<div class="col-sm-6">
		<input type="text" name="marks" id ="marks"  class="form-control" style="border:1px solid #729ce0;width:250px;">
	</div>
	
	</div>
	
	<div class="col-sm-2"></div>
	
	
	
	
</div><br><br>


<div>
<center>
<input type="submit" name="submit" value="Update" id="update" onclick="Update();"  class="btn btn-primary btn-lg">
</center>
</div>
</div>

</body>
</html>