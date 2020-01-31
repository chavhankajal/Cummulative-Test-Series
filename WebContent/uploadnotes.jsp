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
<link rel="stylesheet" href="css/style.css">
<!-- <style>
.bodycontainer
{
float:left;
width:100%;
border:1px solid black;
height:100%;
padding:10px;
}

</style> -->

<script>
    history.forward();
</script>

 <script>


 
 $(document).ready(function () {

	    $("#btnSubmit").click(function (event) {

	        event.preventDefault();
	        var form = $('#fileUploadForm')[0];
	        var data = new FormData(form);
	       
	        

	        $.ajax({
	            type: "POST",
	            enctype: 'multipart/form-data',
	            url: "UploadNotes",
	            data: data,
	            processData: false,
	            contentType: false,
	            cache: false,
	            timeout: 600000,
	            success: function (data) {

	              if(data=="true")
	            	  {
	            	  alert("Notes are uploaded");
	            	  $("#fileFlrPlan").val("");
	            	  
	            	  }

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
<div class="nav" style="background-color:#4b6b87">
<div style="float:right">
<ul>
<li class="btn " style="text-align:right;font-size:20px; background-color:#a32d41"><a href="uploadnotes.jsp" ><span style="color:white">Add Notes</span></a></li>
<li class="btn"><a href="Login.jsp" style="font-size:20px; color:white;padding-right:20px">Logout</a></li>
</ul>
</div>
<div >
<ul>
<li style="color:white">Welcome: ${aname}</li>
</ul>
</div>
</div>

 <div class = "container-fluid">
<div class="col-sm-1"></div>
<div class="div1 col-sm-10" style="background-color:white; border:2px solid #a32d41">
<div>
<ul style="text-align:right">


</ul>
</div>

<center>
<div>
<form id="fileUploadForm" > 

<h2>Upload Notes</h2><br>


  
<div>

<input type="file" id="fileFlrPlan" alt="1" name="file" required/>
</div><br><br><br>
<div> 
<input type="submit"   id="btnSubmit"  value="Upload" class="btn btn-lg btn-primary"/>
</div>
 </form>
 </div>
 </center>
</div>
<div class="col-sm-1"></div>
</div>




</body>
</html>