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
<script>
    history.forward();
</script>

<style>
.bodycontainer
{
float:left;
width:100%;
border:1px solid black;
height:100%;
padding:10px;
}

</style>



<!--  <script>
$(document).ready(function(){
	
$("#upload").click(function(){
	alert("hiiiiii");
	
	
		alert("hello");
		var id = $("#stdid").val();
		alert("id=="+id);
		$.ajax({
			method:"POST",
			url:"FileUploadServlet",
			 
            
             enctype: 'multipart/form-data',
			data:{action:"uploadFile", id:id},
			success:function(data)
			{
				
			}
			
			
			
			
		})
		
	
	
	
});

});
	





</script> -->
</head>

<body>


<!-- <div class = "container">
<div class = "bodycontainer" >
<div style="padding:20px">

<form  action="FileUploadServlet"  method="post" enctype="multipart/form-data"> 
<div>
<h3>Upload your Documents</h3>

</div>
  
<div>

<input type="file" id="fileFlrPlan" alt="1" name="file" required/>
</div><br>
<div> -->

<%-- <%
int id = session.getAttribute(arg0)

%> --%>
<!-- <input type="hidden" value="1" id="stdid"/>
<input type="submit"     value="Upload"/>

</div>
 </form>
</div>
</div>
</div> -->






<div>

	            <h3> Choose File to Upload in Server </h3>

	 <form action="UploadServlet" method="post" enctype="multipart/form-data" > 
                    <input type="text" name="id"  id="stdid"/>
                     <input type="text" name="name"  id="name"/>
	                <input type="file" name="file" />

	              <input type="submit"  id="upload"   value="Upload"/>
	         </form>  

	        </div>










</body>
</html>