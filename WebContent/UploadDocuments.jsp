<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

 <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="jquery.ajaxfileupload.js"></script>
<link  rel="stylesheet" href="css/style.css">
<script>
    history.forward();
</script>
<style>


.bodycontainer
{
float:left;
width:100%;
height:100%;
padding:10px;
}



</style>


<script>


	
	$(document).ready(function(){
		
		$("#name").blur(function(){
		
		
		var name = $("#name").val();
		alert(name);
		
		$.ajax({
		
			url:"StudentServlet",
			type:"POST",
			data:{action:"getname", name:name},
			success:function(data)
			{
				if(data=="true")
					{
					alert("document name already there!!");
					$("#name").val("");
					return false;
					}
			}
			
			
			
		})
		
		
		
	})
	
	
})

</script>

 <script>


 
 $(document).ready(function () {

	    $("#btnSubmit").click(function (event) {
	    	
	    	
	    	var name= $("#name").val();
	    	var file = $("#fileFlrPlan").val();
	    	if(name=='' || file=='')
	    		{
	    		alert("All fields are required!!")
	    		return false;
	    		}

	        event.preventDefault();
	        var form = $('#fileUploadForm')[0];
	        var data = new FormData(form);
	       
	        $("#btnSubmit").prop("disabled", false);

	        $.ajax({
	            type: "POST",
	            enctype: 'multipart/form-data',
	            url: "FileUploadServlet",
	            data: data,
	            processData: false,
	            contentType: false,
	            cache: false,
	            timeout: 600000,
	            success: function (data) {
	            	$("#fileFlrPlan").val("");
	            	$("#name").val("");

	              alert("File uploaded successfully!!!");

	            }
	           
	        });

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

<div class="nav" style="background-color:#4b6b87"	>
<div style="float:right">
<ul>
<li class="logout"><a href="Login.jsp" style="font-size:20px; padding-right:20px">Logout</a></li>
</ul>
</div>
<div >
<ul>
<li style="color:white">Welcome: ${sname}</li>
</ul>
</div>


</div>

 <div class = "container-fluid">

<div class="col-sm-1"></div>

<div class="div1 col-sm-10" style="background-color:white; border:2px solid #a32d41">
<div>
<ul style="text-align:right">
<li class="btn " style="text-align:right; background-color:#a32d41"><a href="ResumeDetails.jsp"><span style="color:white;">Resume</span></a></li>
<li class="btn " style="text-align:right; background-color:#a32d41"><a href="#" ><span style="color:white;">Upload</span></a></li>
<!--  <li class="btn" style="text-align:right"><a href="FileDownloadServlet?action=getList" >Download</a></li>-->
<li class="btn " style="text-align:right; background-color:#a32d41"><a href="viewnotes.jsp"><span style="color:white;">View Notes</span></a></li>
<li class="btn " style="text-align:right; background-color:#a32d41"><a href="StudentServlet?action=checkfirsttest"><span style="color:white;">Test</span></a></li>

</ul>
</div>

<form id="fileUploadForm" > 
<div class ="header">
<center><h1>Upload Documents</h1></center>
</div>
  <br><br><br>
  <div>
<div class="col-sm-3"></div>
<div class="col-sm-6">
<div>
<label>Name for Document: &nbsp;(Start from least education e.g ssc then hsc)</label>
</div>
<br>
<div>
 <input type="text" id="name" name="name" class="form-control " style="border:1px solid #729ce0">
 </div>
 <br><br>
 <center>
<input type="file" id="fileFlrPlan" alt="1" name="file" required/>
</center>
<br><br>
<div>
<input type="hidden" value="1" id="stdid"/>
<center><input type="submit"  class="btn btn-primary btn-lg" id="btnSubmit"  value="Upload"/></center>
</div>
</div>

<div class="col-sm-3"></div>


</div>

<div> 


 
</div>
 </form>
</div>
</div>
<div class="col-sm-1"></div>



</body>
</html>