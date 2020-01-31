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
</head>
<body style="background-color:#ffcc99">
<div style="background-color: #4b6b87; height:80px">

<a href="login1.jsp" class="btn btn-lg" style="background-color: #5b1416; margin-top:1.5%; color:white"><span >Back To Login!!!!</span></a>
</div>
<div class="container-fluid">
<div class="col-sm-4"></div>

<div class="col-sm-4" style="margin-top:10%">
<form method="post" action="RegistrationServlet">
<div class="form-group">
<label>Enter Your Registered Email Id</label>
<input type="text" id="email" name="email" class="form-control"  required>
</div>
<br>

<center>
<div>
<input type="submit" name="action" value="Submit" class="btn btn-lg"  style="background-color: #5b1416; color:white"> 
</div>
</center>
</form>
</div>



<div class="col-sm-4"></div>
</div>


</body>
</html>