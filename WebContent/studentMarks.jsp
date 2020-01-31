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
		function getMarkList()
		{
			
			
			var branch = $("#branch option:selected").val();
			var subject =$("#subject option:selected").val();
			$("#marks").empty();
			$.ajax({
				
				url:"FacultyServlet",
				type:"POST",
				datatype:'JSON',
				data:{action:'getMarkList',branch:branch,subject:subject},
			    success:function(data)
			    {
			    	$.each(JSON.parse(data),function(key,value){
			    		
			    		$("#marks").append('<tr style="border:1px solid black;text-align:center"><td style="border:1px solid black;text-align:center">'+value.stud_name+'</td><td style="border:1px solid black">'+value.stud_marks+'</td><tr>');
			    		
			    		
			    		
			    	});
			    }
			});
		}
		
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
  	$("#subject").empty();
  	$.ajax({
  	
  		
  		url:"FacultyServlet",
  		type:"POST",
  		datatype:"JSON",
  		data:{action:"fetchSubject", br:br},
  		success:function(data)
  		{
  		alert(data);
  		
  		$("#subject").append('<option value="select">Select</option>');
  		$.each(JSON.parse(data), function(key, value){
  			
  		
  		$("#subject").append('<option value='+value.subject_name+' id="sub'+count+'" class="subject">'+value.subject_name+'</option>');
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


</script>

<script>
function getSub(id)
{
	alert("hello");
	alert(id);
	
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
				data:{action:"addFaculty", branch:br,subject:sub,quetion:qe,correct_answer:ca, option:option},
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
				
				}
			})
			
          });
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
<li class="btn " style="text-align:right;font-size:20px; margin-top:10px; "><a href="addBranch.jsp" ><span style="color:white;">Add Branch</span></a></li>
<li class="btn " style="text-align:right;font-size:20px; margin-top:10px; "><a href="addsubject.jsp" ><span style="color:white;">Add Subject</span></a></li>
<li class="btn " style="text-align:right;font-size:20px; margin-top:10px; "><a href="editmarks.jsp" ><span style="color:white;">Edit Marks</span></a></li>
<li class="btn " style="text-align:right;font-size:20px; margin-top:10px; "><a href="#" ><span style="color:white;">Add Question</span></a></li>
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
<div class="container-fluid" style="background-color:white">
<div class="row">
 <div class="col-md-6" style="background-color:#4b6b87;height:580px;width:300px;padding-top:50px;">
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
 
 
 
 
 
 





<div class="col-sm-8" style="background-color:white; ">
<div>
<ul style="text-align:right">


</ul>
</div>
<center><h2>Add Question</h2></center><br><br>
<div class="form-group">
	<label class="col-sm-2 control-label">Branch:</label>
	<div class="col-sm-8">
		<select style="height:30px; border:1px solid #729ce0" name="branch" id="branch" >
		<option value="select">Select</option>
		  <!-- <option value="extc">EXTC</option>
		  <option value="electronic">ELECTRONIC</option>
		  <option value="computer">COMPUTER</option>
		  <option value="mechanical">MECHANICAL</option> -->
		</select>
	</div>
</div><br>

<div class="form-group">
	<label class="col-sm-2 control-label">Subject:</label>
	
	<div class="col-sm-8" >
	<select style="height:30px; border:1px solid #729ce0" name="subject" id="subject" >

	</select>
	<!-- 	<input type="text" name="subject" class="form-control" id="subject" required> -->
	</div>	
</div><br>


<div id="marksList">
<table class="table table-boredered">
<tr>
<th style="border:1px solid black; text-align:center">Student Name</th>
<th style="border:1px solid black; text-align:center">Student Marks</th>
</tr>
<tbody id="marks" style="border:1px solid black">

</tbody>


</table>


</div>


<center><Button class="btn btn-primary btn-lg" type="submit"  onclick="getMarkList();" value="submit" >Submit</Button></center>
</div>
<input type="hidden" id="count" value="">
<input type="hidden" id="subject" value="">

</div>

</div>
<br/>
</body>
</html>