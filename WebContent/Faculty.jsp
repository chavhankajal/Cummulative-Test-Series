<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
.div1
{
	border:2px solid gray;
	padding:80px;
	width:800px;
	margin-top:20px;
	background-color:LightGray ;
	
}
</style>
<script>
    history.forward();
</script>
<script>
        $(document).ready(function() 
		{                        
          $('#submit').click(function(event) 
		  {  
	        alert('1');
		  	var br=$('#branch').val();
		  	alert(br);
            var sb=$('#subject').val();
			alert(sb);
		  	var qe=$('#quetion').val();
		  	alert(qe);
		  	var ca=$('#correct_answer').val();
		  	alert(ca);
		  	
			var option = [];
			var op1= $("#op1").val();
	  		var op2 = $("#op2").val();
	  		var op3= $("#op3").val();
	  		var op4 = $("#op4").val();
		  	console.log("hellllllllloooooo");
		  	for(var i=1; i<=4; i++)
		  		{
			  		console.log($("#op"+i).val());
			  		option.push($("#op"+i).val());
		  		}
		  	
		  	console.log("outside"+option.length);
		  	
		  	
		  	
			$.ajax({
				
				url:"FacultyServlet",
				method:"POST",
				data:{action:"addFaculty", branch:br,subject:sb,quetion:qe,correct_answer:ca, option:option},
				success:function(data)
				{
					$("#branch").val("");
					$("#subject").val("");
					$("#quetion").val("");
					$("#correct_answer").val("");
					$("#op1").val("");
					$("#op2").val("");
					$("#op3").val("");
					$("#op4").val("");
					
					alert(data);
					window.location.href="Login.jsp";
				}
			})
			
          });
      });
</script>

</head>
<body>
<div class="nav" style="background-color:black; padding:10px">
<ul>
<li style="text-align:right;"><a href="LogoutServlet" style="color:white">Logout</a>
</ul>
</div>
<div class="container">

<div class="col-sm-2"></div>

<div class="col-sm-5">

<div class="div1 form-horizontal">
<center><h2>Add Question</h2></center><br><br>
<div class="form-group">
	<label class="col-sm-2 control-label">Branch:</label>
	<div class="col-sm-8">
		<select style="height:30px;" name="branch" id="branch">
		  <option value="extc">EXTC</option>
		  <option value="electronic">ELECTRONIC</option>
		  <option value="computer">COMPUTER</option>
		  <option value="mechanical">MECHANICAL</option>
		</select>
	</div>
</div><br>
<div class="form-group">
	<label class="col-sm-2 control-label">Subject:</label>
	<div class="col-sm-8">
		<input type="text" name="subject" class="form-control" id="subject" required>
	</div>	
</div><br>
<div class="form-group">
	<label class="col-sm-2 control-label">Quetion:</label>
	<div class="col-sm-8">
		<input type="text" name="quetion" class="form-control" id="quetion" required>
	</div>	
</div><br>
<div class="form-group">
	<label class="col-sm-2 control-label">Options:</label>
	<div class="col-sm-8" >
		<input type="text" name="options" class="form-control input-sm" id="op1"  required>
		<input type="text" name="options" class="form-control input-sm"  id="op2" required>
		<input type="text" name="options" class="form-control input-sm"  id="op3" required>
		<input type="text" name="options" class="form-control input-sm"  id="op4" required>
	</div>	
</div><br>
<div class="form-group">
	<label class="col-sm-2 control-label">Correct Answer:</label>
	<div class="col-sm-8">
		<input type="text" name="correct_answer" class="form-control" id="correct_answer" required>
	</div>	
</div><br>
<center><Button class="btn btn-primary" type="submit" id="submit" value="submit">Submit</Button></center>
</div>

</div>

</div>
<br/>
</body>
</html>