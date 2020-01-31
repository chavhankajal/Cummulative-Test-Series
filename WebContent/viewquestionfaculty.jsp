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
<link rel="stylesheet" href="css/style.css">

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
			$("#branch").append("<option value='select'>Select</option>");
			$.each(JSON.parse(data),function(key,value)
					{
						$("#branch").append("<option value="+value+">"+value+"</option>");
					});
		}
		
	});
	
		});
		
		
$(document).ready(function() 
		{
		
	$("#branch").change(function(){
	var br=$('#branch').val();
	alert("branch "+br);
	
	if(br=="select")
		{
		alert("Select valid branch!!");
		return false;
		}
	var count=1;
  	$("#select").empty();


	$.ajax({
	
		
		url:"FacultyServlet",
		type:"POST",
		datatype:"JSON",
		data:{action:"fetchSubject",br:br},
		success:function(data)
		{
		alert(data);
		
		$("#select").append('<option value="select">Select</option>');
		$.each(JSON.parse(data), function(key, value){
			
		
		$("#select").append('<option value='+value.subject_name+' id="sub'+count+'" class="subject">'+value.subject_name+'</option>');
		$("#count").val(count);
		
		
		count++;
		});
		}
		});
		});
	
	
	$("#select").change(function(){
		
		var sub = $("#select").val();
		alert(sub);
		var br = $("#branch").val();
		alert(br);
		if(sub=="select")
		{
		alert("Select valid branch!!");
		return false;
		}
		else
	{
			$.ajax({
			
				url:"FacultyServlet",
				type:"POST",
				data:{action:"getQuestionList", br:br, sub:sub},
				success:function(data)
				{
					console.log(data);
					$.each(JSON.parse(data),  function(key, val){
					console.log(val);
					
						$("#question").append("<div><div class='col-sm-4'>"+val.question+"</div><div class='col-sm-4'>"+val.correct+"</div></div><br>");
						
						
						
					})
					
					
					
				}
				
				
				
			})
			
			
			
	}
		
		
		
	})
	
	
	
		});


</script>


</head>
<body>

<div class="nav" style="background-color:#4b6b87"	>
<div style="float:right">
<ul>
<li class="logout"><a href="Login.jsp" style="font-size:20px; padding-right:20px">Logout</a></li>
<ul style="text-align:right">
<li class="btn " style="text-align:right; margin-top:10px; background-color:#4b6b87"><a href="addBranch.jsp" ><span style="color:white;">Add Branch</span></a></li>
<li class="btn " style="text-align:right; margin-top:10px; background-color:#4b6b87"><a href="addsubject.jsp" ><span style="color:white;">Add Subject</span></a></li>
<li class="btn " style="text-align:right; margin-top:10px; background-color:#4b6b87"><a href="editmarks.jsp" ><span style="color:white;">Edit Marks</span></a></li>
<li class="btn " style="text-align:right; margin-top:10px; background-color:#4b6b87"><a href="#" ><span style="color:white;">Add Question</span></a></li>
<li class="btn " style="text-align:right; margin-top:10px; background-color:#4b6b87"><a href="studentMarks.jsp" ><span style="color:white;">Mark List</span></a></li>
<li class="btn " style="text-align:right; margin-top:10px; background-color:#4b6b87"><a href="viewquestionfaculty.jsp" ><span style="color:white;">View Question</span></a></li>

</ul>
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
<div  class="col-md-6" >
<div class="form-group">
<center><h2>Add Subject</h2></center><br><br>
<div class="col-sm-2"></div>

<div class="col-sm-8">
	<div class ="col-sm-2">	<label class="control-label">Branch:</label></div>
	<div class="col-sm-6">
		<select style="height:30px; border:1px solid #729ce0" name="branch" id="branch" >
		</select>
	</div>
</div><br>
<div class="col-sm-2"></div>
	</div>
	
<div class="form-group">
<div class="col-sm-2"></div>
<div class="col-sm-8">
	<div class ="col-sm-2">	
	<label class="control-label">Subject:</label>
	</div>
	<div class="col-sm-6" >
	<select style="height:30px; border:1px solid #729ce0" name="sub" id="select" >

	</select>
	</div>	

</div>
</div>
<br>


<div class="form-group">
<div class="col-sm-2"></div>
<div class="col-sm-4">Questions</div>
<div class="col-sm-4">Answer</div>
</div>
<br>
<div class="form-group">
<div class="col-sm-2"></div>
<div id="question">


</div>



</div>
</div>

</body>
</html>