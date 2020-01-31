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
    history.forward();
</script>
<script>

$(document).ready(function(){
	
	$("#video").click(function(){
		
	
	alert("hiiiii");
	
	$("#field").empty();
		var count=1;
		$("#tab1").show();
		$("#tab2").hide();
		$("#tab3").hide();
		$("#tab4").hide();
		alert("hello");
		
		var type=$("#type").val();
		alert(type);
		$.ajax({
			url:"StudentServlet",
			type:"POST",
			datatype:"json",
			data:{action:"getvideos", type:type},
			success:function(data)
			{
				$.each(JSON.parse(data), function(key, val){
					console.log(val);
					
					$("#field").append('<tr id="row'+count+'" style="border:1px solid black"><td id="file'+count+'" style="text-align:center; border:1px solid black"">'+val.notes_name+'</td><td style="border:1px solid black"><center><button class="btn btn-primary" id="download'+count+'" value="'+val.id+'" onclick="clickfunc('+val.id+')">Download</button></center></td></tr>');
					$("#id").val(count);
				
					count++;
					
				});
				
			}
			
			
			
			
	
		
		
		
	});
	})
	
	$("#pdf").click(function(){
		
		$("#fieldpdf").empty();
		var count=1;
		
		$("#tab2").show();
		$("#tab1").hide();
		$("#tab3").hide();
		$("#tab4").hide();
		
		var type=$("#pdftype").val();
		alert(type);
		
$.ajax({
		url:"StudentServlet",
		type:"POST",
		datatype:"json",
		data:{action:"getvideos", type:type},
		success:function(data)
		{
			$.each(JSON.parse(data), function(key, val){
				console.log(val);
				
				$("#fieldpdf").append('<tr id="row'+count+'" style="border:1px solid black"><td id="file'+count+'" style="text-align:center;border:1px solid black"">'+val.notes_name+'</td><td style="border:1px solid black"><center><button class="btn btn-primary" id="download'+count+'" value="'+val.id+'" onclick="clickfunc('+val.id+')">Download</button></center></td></tr>');
				$("#id").val(count);
			
				count++;
				
			});
			
		}
		
		
		
		

	
	
	
});
		
		
		
	})
	
	$("#doc").click(function(){
		$("#fielddoc").empty();
		var count=1;
		
		$("#tab3").show();
		$("#tab2").hide();
		$("#tab2").hide();
		$("#tab4").hide();
		
		var type=$("#doctype").val();
		alert(type);
		$.ajax({
			url:"StudentServlet",
			type:"POST",
			datatype:"json",
			data:{action:"getvideos", type:type},
			success:function(data)
			{
				$.each(JSON.parse(data), function(key, val){
					console.log(val);
					alert(data);
					$("#fielddoc").append('<tr id="row'+count+'" style="border:1px solid black"><td id="file'+count+'" style="text-align:center;border:1px solid black"">'+val.notes_name+'</td><td style="border:1px solid black"><center><button class="btn btn-primary" id="download'+count+'" value="'+val.id+'" onclick="clickfunc('+val.id+')">Download</button></center></td></tr>');
					$("#id").val(count);
				
					count++;
					
				});
				
			}
			
		
	});
		
		
	})
	
	$("#img").click(function(){
		
		$("#fieldimg").empty();
		var count=1;
		$("#tab4").show();
		$("#tab1").hide();
		$("#tab2").hide();
		$("#tab3").hide();
		
		var type=$("#imgtype").val();
		alert(type);
		$.ajax({
			url:"StudentServlet",
			type:"POST",
			datatype:"json",
			data:{action:"getvideos", type:type},
			success:function(data)
			{
				$.each(JSON.parse(data), function(key, val){
					console.log(val);
					alert(data);
					$("#fieldimg").append('<tr id="row'+count+'" style="border:1px solid black"><td id="file'+count+'" style="text-align:center; border:1px solid black">'+val.notes_name+'</td><td style="border:1px solid black"><center><button class="btn btn-primary" id="download'+count+'" value="'+val.id+'" onclick="clickfunc('+val.id+')">Download</button></center></td></tr>');
					$("#id").val(count);
				
					count++;
					
				});
				
			}
		
		
	})
});
});







</script>

<script>
function clickfunc(val)
{
	var count = $("#id").val();
	alert(count);
	
	var id = val;
	alert(val);
	
    location.href="DownloadNotes?id="+id;
	



	
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
<li class="btn " style="text-align:right;font-size:20px;"><a href="#"><span style="color:white">View Notes</span></a></li>
<li class="btn " style="text-align:right;font-size:20px;"><a href="instruction.jsp"><span style="color:white;">Test</span></a></li>

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
<div class="row">
 <div class="col-md-6" style="border:2px solid #a32d41;background-color:white;border-radius:25px;height:400px;width:300px;">
 <label style="font-size: 15px;font-style: italic ;padding-top:15px;">
 Name
 </label>
 <input type="text" style ="border-radius:25px;width:200px;" id="fname" value="${sname}"><br><br>
 
 <label style="font-size: 15px;font-style: italic;">
Email
 </label>
 <input type="text" style ="border-radius:25px;width:200px;" id="femail" value="${semail}"><br><br>
<center> <button class="btn btn-primary" id="edit" value="EDIT"  onclick="edit();">EDIT</button></center>
 
 </div>
 <div class="col-md-6"> 
<div class="col-sm-1"></div>
<div class="div1 col-sm-10" style="background-color:white; border:2px solid #a32d41">
<div>
<ul style="text-align:right">

<!--  <li class="btn" style="text-align:right"><a href="FileDownloadServlet?action=getList" >Download</a></li>-->

</ul>
</div>
<h1 style="text-align:center">View Notes</h1><br><br>
<div style="width:100%">
<ul>
<li class="active btn button-type"  id="video" style="width:23%"><a href="#tab1" data-toggle="tab" aria-expanded="true"><span style="color:white">Video</span></a></li>
<li class="btn button-type" id="pdf" style="width:23%"><a href="#tab2" data-toggle="tab" aria-expanded="false" ><span style="color:white">PDF</span></a></li>
<li class="btn  button-type"  id="doc" style="width:23%"><a href="#tab3" data-toggle="tab" aria-expanded="false" ><span style="color:white">Word Document</span></a></li>
<li class="btn  button-type"  id="img" style="width:23%"><a href="#tab4" data-toggle="tab" aria-expanded="false" ><span style="color:white">Images</span></a></li>

</ul>
</div>

 <div class="tab-content" id="tabs">
 <br><br><br>
  <div class="tab-pane form-group active" id="tab1">


<center><h3>Videos</h3></center>
<br><br>
<input type="hidden" id="type" value="video">
<table class="table table-bordered">
<thead style="background-color:#4b6b87; color:white">
<tr style="border:1px solid black">
<th style="text-align:center; border:1px solid black">Name</th>
<th style="text-align:center; border: 1px solid black">Download</th>
</tr>
</thead>

<tbody id="field">


</tbody>

</table>


</div>


 <div class="tab-pane form-group active" id="tab2" style="display:none">

<input type="hidden" id="pdftype" value="pdf">
<center><h3>PDF</h3></center>

<table class="table table-bordered">
<thead style="background-color:#4b6b87; color:white">
<tr>
<th style="text-align:center;border:1px solid black">Name</th>
<th style="text-align:center;border:1px solid black">Download</th>
</tr>
</thead>

<tbody id="fieldpdf">


</tbody>

</table>


</div>


 <div class="tab-pane form-group active" id="tab3" style="display:none">

<input type="hidden" id="doctype" value="document">
<center><h3>Docs</h3></center>

<table class="table table-bordered">
<thead style="background-color:#4b6b87; color:white">
<tr>
<th style="text-align:center;border:1px solid black">Name</th>
<th style="text-align:center;border:1px solid black">Download</th>
</tr>
</thead>

<tbody id="fielddoc">


</tbody>

</table>
</div>


<div class="tab-pane form-group active" id="tab4" style="display:none">

<input type="hidden" id="imgtype" value="image">
<center><h3>Images</h3></center>

<table class="table table-bordered">
<thead style="background-color:#4b6b87; color:white">
<tr>
<th style="text-align:center;border:1px solid black">Name</th>
<th style="text-align:center;border:1px solid black">Download</th>
</tr>
</thead>

<tbody id="fieldimg">


</tbody>

</table>
</div>

<input type="hidden" id="id" value="">

</div>

</div>

<div class="col-sm-1"></div>
</div>

</body>
</html>