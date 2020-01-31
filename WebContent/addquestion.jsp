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
<!-- <style type="text/css">
.div1
{
	border:2px solid gray;
	padding:80px;
	width:800px;
	margin-top:20px;
	background-color:LightGray ;
	
}
</style> -->
<script>
    history.forward();
</script>

<script>

	$.ajax({
		
		url:"FacultyServlet",
		method:"POST",
		datatype:"JSON",
		data:{action:"Fetchlevel"},
		success:function(data)
		{
			$("#level").append('<option value="select">Select</option>');
			$.each(JSON.parse(data), function(key, val)
					{
				$("#level").append('<option value='+val.id+'>'+val.level+'</option>');
					})
			
		}
	});
		
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
  		data:{action:"fetchSubject", br:br},
  		success:function(data)
  		{
  		alert(data);
  		
  		$("#select").append('<option value="select">Select</option>');
  		$.each(JSON.parse(data), function(key, value){
  			
  		
  		$("#select").append('<option value='+value.subject_name+' id="sub'+count+'" class="subject">'+value.subject_name+'</option>');
  		$("#count").val(count);
  		/* 
  		$(document).on('change',".subject", function(){
  		    alert(this.value);
  		}); */
  		
  		count++;
  		});
  		}
  	})
  	
  	
  	
  	
		
		
	})
	
	
	
		});
		
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

<script>
function getSub(id)
{
	alert("hello");
	alert(id);
	
	}
	
	function selectedanswer()
	{
		var correctans = $("#correct_answer option:selected").val();
		
		if(correctans == 1)
			{
			
			$("#op1").css({"backgroundColor" : "green" ,'color':'white'}); 
			$("#op2").css({"backgroundColor" : "white" ,'color':'black'});
			$("#op3").css({"backgroundColor" : "white" ,'color':'black'});
			$("#op4").css({"backgroundColor" : "white" ,'color':'black'});
			}
		else if(correctans == 2)
		{
			$("#op1").css({"backgroundColor" : "white" ,'color':'black'});
			$("#op2").css({"backgroundColor" : "green" ,'color':'white'});
			$("#op3").css({"backgroundColor" : "white" ,'color':'black'});
			$("#op4").css({"backgroundColor" : "white" ,'color':'black'});
		}
		
		else if(correctans == 3)
		{
			$("#op1").css({"backgroundColor" : "white" ,'color':'black'});
			$("#op2").css({"backgroundColor" : "white" ,'color':'black'});
			
			$("#op3").css({"backgroundColor" : "green" ,'color':'white'}); 
			$("#op4").css({"backgroundColor" : "white" ,'color':'black'});
		}
		else if(correctans == 4)
		{
			$("#op1").css({"backgroundColor" : "white" ,'color':'black'});
			$("#op2").css({"backgroundColor" : "white" ,'color':'black'});
			$("#op3").css({"backgroundColor" : "white" ,'color':'black'});
			$("#op4").css({"backgroundColor" : "green" ,'color':'white'});
		}
		
		
	}


</script>

<script>
$(document).ready(function() 
		{ 
$("#select").change(function(){
	
	alert("pooja");
	var name = $("#select").val();
	alert(name);
	$("#subject").val(name);
	
	
	
});


                               
          $('#submit').click(function(event) 
		  {  
	
	
	        alert('1');
		  	var br=$('#branch').val();
		  	alert(br);
		  	if(br=="select")
			{
			alert("Select valid branch!!");
			return false;
			}
		  	
		  	sub = $("#subject").val();
		  	alert(sub);
		  	if(sub=="select")
		  		{
		  		alert("select valid subject");
		  		return false;
		  		}
		  	
		  	level = $("#level").val();
		  	alert(level);
		  	if(level=="select")
		  		{
		  		alert("select valid level");
		  		return false;
		  		}
		  	
		  	
		  	correct_answer = $("#correct_answer").val();
		  	alert(correct_answer);
		  	if(correct_answer=="select")
		  		{
		  		alert("select valid correct answer");
		  		return false;
		  		}
		  	
		  	
            /* var sb=$('#subject').val();
			alert(sb); */
		  	var qe=$('#quetion').val();
		  	alert(qe);
		  	var ca=$('#correct_answer').val();
		  	alert(ca);
		  	
		  	if(br==''  || qe == '' || ca=='')
		  		{
		  		alert("All fields are requied!!!");
		  		return false;
		  		}
		  	
			var option = [];
			var op1= $("#op1").val();
	  		var op2 = $("#op2").val();
	  		var op3= $("#op3").val();
	  		var op4 = $("#op4").val();
	  		
	  		if(op1=='' || op2=='' || op3 ==''|| op4=='')
	  			{
	  			alert("All fields are requied!!!");
		  		return false;
	  			}
	  		
	  		
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
				data:{action:"addFaculty", branch:br,subject:sub,quetion:qe,correct_answer:ca, option:option,level:level},
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
					$("#op1").css({"backgroundColor" : "white" ,'color':'black'}); 
					$("#op2").css({"backgroundColor" : "white" ,'color':'black'});
					$("#op3").css({"backgroundColor" : "white" ,'color':'black'});
					$("#op4").css({"backgroundColor" : "white" ,'color':'black'});
					
					alert(data);
				
				}
			})
			
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
<li class="btn " style="font-size:20px;text-align:right; margin-top:10px; "><a href="addBranch.jsp" ><span style="color:white;">Add Branch</span></a></li>
<li class="btn " style="font-size:20px;text-align:right; margin-top:10px; "><a href="addsubject.jsp" ><span style="color:white;">Add Subject</span></a></li>
<li class="btn " style="font-size:20px;text-align:right; margin-top:10px; "><a href="editmarks.jsp" ><span style="color:white;">Edit Marks</span></a></li>
<li class="btn " style="font-size:20px;text-align:right; margin-top:10px;"><a href="#" ><span style="color:white;">Add Question</span></a></li>
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
<div class="container-fluid">
<div class="row" style="background-color:white;">
 <div class="col-md-6" style="border:2px solid #4b6b87;background-color:#4b6b87;height:800px;width:300px;padding-top:50px;">
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

<div class="col-sm-2"></div>



<div class=" form-horizontal col-sm-8" style="background-color:white;">
<div>
<ul style="text-align:right">

</ul>
</div>
<center><h2>Add Question</h2></center><br><br>
<div class="form-group">
	<label class="col-sm-4 control-label">Branch:</label>
	<div class="col-sm-8">
		<select style="height:30px; width:250px; border:1px solid #729ce0" name="branch" id="branch" >
		<option value="select">Select</option>
		  <!-- <option value="extc">EXTC</option>
		  <option value="electronic">ELECTRONIC</option>
		  <option value="computer">COMPUTER</option>
		  <option value="mechanical">MECHANICAL</option> -->
		</select>
	</div>
</div><br>
<div class="form-group">
	<label class="col-sm-4 control-label">Subject:</label>
	
	<div class="col-sm-8" >
	<select style="height:30px;width:250px; border:1px solid #729ce0" name="branch" id="select" >

	</select>
	<!-- 	<input type="text" name="subject" class="form-control" id="subject" required> -->
	</div>	
</div><br>
<div class="form-group">
	<label class="col-sm-4 control-label">Difficulty Level:</label>
	
	<div class="col-sm-8" >
	<select style="height:30px;width:250px; border:1px solid #729ce0" name="level" id="level" >

	</select>
	<!-- 	<input type="text" name="subject" class="form-control" id="subject" required> -->
	</div>
		
</div><br>
<div class="form-group">
	<label class="col-sm-4 control-label">Question:</label>
	<div class="col-sm-8">
		<input type="text" name="quetion" class="form-control" id="quetion" style="border:1px solid #729ce0;width:250px" required>
	</div>	
</div><br>
<!-- <div class="form-group">
	<label class="col-sm-2 control-label">Options:</label>
	<div class="col-sm-6" >
		1<input type="text" name="options" class="form-control input-sm" id="op1"  style="margin-left:30px" required>
		2<input type="text" name="options" class="form-control input-sm"  id="op2" required>
		3<input type="text" name="options" class="form-control input-sm"  id="op3" required>
		4<input type="text" name="options" class="form-control input-sm"  id="op4" required>
	</div>	
</div> <br>-->
<div class="form-group">
<label class="col-sm-4 control-label">Options:</label>
<div class="col-sm-6" >
         <div>
		<div class="col-sm-1" >1</div>
		<div class="col-sm-11">
			<input type="text" name="options" class="form-control" id="op1" style="margin-left:-20px; border:1px solid #729ce0" required>
		</div>
		</div>
		<br><br><br>
		<div>
		<div class="col-sm-1">2</div>
		<div class="col-sm-11">
		<input type="text" name="options" class="form-control" style="margin-left:-20px; border:1px solid #729ce0"  id="op2" required>
		</div>
		</div>
		<br><br><br>
		<div>
		<div class="col-sm-1">3</div>
		<div class="col-sm-11">
		<input type="text" name="options" class="form-control" style="margin-left:-20px; border:1px solid #729ce0"  id="op3" required>
		</div>
		</div><br><br><br>
		<div>
		<div class="col-sm-1">4</div>
		<div class="col-sm-11">
		<input type="text" name="options" class="form-control" style="margin-left:-20px; border:1px solid #729ce0" id="op4" required>
		</div>
		</div>
		<br><br><br>
</div>
</div>

<br>

    <div class="form-group">
	<label class="col-sm-4 control-label">Correct Answer:</label>
	<div class="col-sm-8">
	<select id="correct_answer" style="padding:5px; border:1px solid #729ce0 ; width:250px"  onchange="selectedanswer();">
	<option value="select" >Select</option>
	<option value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
	<option value="4">4</option>
	</select>
	</div>
	</div>
<br>
<center><Button class="btn btn-primary btn-lg" type="submit" id="submit" value="submit">Submit</Button></center>
</div>
</div>
<input type="hidden" id="count" value="">
<input type="hidden" id="subject" value="">
<div class="col-sm-2"></div>
</div>

</div>
<br/>
</body>
</html>