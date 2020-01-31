<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
	
		url:"StudentServlet",
		type:"POST",
		datatype:"JSON",
		data:{action:"getSubject"},
		success:function(data)
		{
			$("#sub").empty();
			$("#sub").append('<option value="select">Select</option>');
			var id =1;
			$.each(JSON.parse(data), function(key, value)
					{
			
			$("#tbl").append("<tr style='width:500';><td style='width:50%;height:50px;border:2px solid black;text-align:center'>"+value.subject_name+"</td><td style='width:50%;height:50px;border:2px solid black;text-align:center'><input type='button' class='btn btn-primary lg'  value='Start Exam' id='start' onclick='getSubject("+id+")'></td><td><input type='hidden' class='btn btn-primary lg'   id='sub"+id+"' value='"+value.subject_name+"'></td></tr>");
					
					id = parseInt(id) + parseInt(1);
					});
		}
		
		
	})
	
	
})


</script>


<script>


function getSubject(data)
{
	
	var sub = $("#sub"+data).val();
	alert("ppppppppppppppp"+sub);
	
	$.ajax({
		
		url:"StudentServlet",
		type:"POST",
		
		data:{action:"setSubject",subject:sub},
		success:function(data)
		{
			window.location.href="test.jsp?sub="+sub;
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
		data:{action:"studentedit",  fname:fname,femail:femail},
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
<body>
<div class="nav" style="background-color:#4b6b87"	>
<div style="float:right">
<ul>
<li class="btn " style="text-align:right;font-size:20px; margin-top:10px; "><a href="viewnotes.jsp"><span style="color:white;">View Notes</span></a></li>
<!-- <li class="btn " style="text-align:right; margin-top:10px; background-color:#a32d41"> <a href="StudentServlet?action=checkfirsttest"><span style="color:white;">Test</span></a></li>-->
 <li class="btn " style="text-align:right;font-size:20px; margin-top:10px; "><a href="instruction.jsp"><span style="color:white;">Test</span></a></li>

<li class="btn"><a href="Login.jsp" style="font-size:20px;color:white; padding-right:20px">Logout</a></li>
</ul>
</div>
<div >
<ul>
<li style="color:white">Welcome: ${sname}</li>
</ul>
</div>


</div>
<div class="container-fluid">
<div class="row" style="background-color:white;">
 <div class="col-md-6" style="background-color:#4b6b87;height:570px;width:300px;padding-top:50px;">
 <label style="font-size: 15px;font-style: italic ;padding-top:15px;color:white">
 Name
 </label>
 <input type="text" style ="border-radius:25px;width:200px;" id="fname" value="${sname}"><br><br>
 
 <label style="font-size: 15px;font-style: italic;color:white;">
Email
 </label>
 <input type="text" style ="border-radius:25px;width:200px;" id="femail" value="${semail}"><br><br>
<center> <button class="btn btn-primary" id="edit" value="EDIT"  onclick="edit();">EDIT</button></center>
 
 </div>
 <div class="col-md-9"> 
 

<div class="col-sm-11" style="background-color:white">
<div>
<ul style="text-align:right">

</ul>
</div>
<br><br>

<div class="col-sm-5">
<label style="text-align:center; margin-top:5px; margin-left:50px;font-size:18px;">Select Subject:</label>
</div>


<div class="col-sm-1"></div>

<div class="col-sm-11" >


<table id="tbl" style ="border:2px solid black;">



</table>

<div class="col-sm-1"></div>
</div>





<br><br>

<div>
<label style="font-size:25px; color:red">Instructions For Exam!!!</label>
</div><br><br>
<div style="color:green">
<label>1.</label><span style="padding-left:10px; font-size:15px">Exam .</span><br>
<label>2.</label><span style="padding-left:10px; font-size:15px">Do not refresh page and do not press back button otherwise your exam get finish.</span>
<br><br>
<label style="font-size:30px">All The Best!!!!</label>
</div>
<br>
<br>
<br>

<center>
<!-- <div>
<input type="button" class="btn btn-primary lg"  value="Start Exam" id="start">

</div> -->

</center>
</div>




</body>
</html>