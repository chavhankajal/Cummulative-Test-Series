<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.training.pojo.FacultyPojo"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/style.css">
<title>Insert title here</title>
<script>
    history.forward();
</script>
<script>
/* $(document).ready(function(){
	//run js code here
	alert(1);
	var sub = $("#subject").val();
	$.ajax({
		url:"StudentServlet",
		type:"POST",
		data:{action:'getMarks',subject:sub},
		success:function(data)
		{
			$("#time").val(data);
			alert("hhhhhhhhhhhhhhhhh"+data);
		}
	});
			
		}); */

</script>
<script>

function displayGrid()
{
	alert("grid");
	$.ajax({
		
		url:"StudentServlet",
		type:"POST",
		datatype:"JSON",
		data:{action:"getFlag"},
		success:function(data)
		{
			$("#flag").empty();
			var i=1;
		$.each(JSON.parse(data), function(key, val){
			
			
			console.log(val);
			$("#flag").append('<button id='+i+' value='+val+'  style="margin:3px;background-color:#3774b2;color:white;height:25px;width:25px;" onclick="getQ('+val+')">'+i+'</button><br>');
			i++;
		});	
		alert(i);
		$("#totalquestion").val(i);
		}
	
		
		
		
	});
	
	
	
}



function getQ(id)
{
	alert(id);
	$.ajax({
		
		url:"StudentServlet",
		type:"POST",
		data:{action:"FetchFlagQuestion", id:id},
		success:function(data)
		{
			$("#questioncount").val(parseInt(id)+parseInt(1));
			$("#question").val(data.quetion);
			$("#qid").val(data.question_id);
			
			var qid = $("#qid").val();
			var correct = $("#correct").val(data.correct_answer);
			//alert(correct.val());
		//alert(qid);
		var count=1;
		$("#option").empty();
$.ajax({
			
			url:"StudentServlet",
			type:"POST",
			datatype:"JSON",
			data:{action:"getanswer", qid:qid},
			
		    success:function(data){
		    	//alert(data);
		    	console.log(data);
		    	$.each(JSON.parse(data), function(key, value){
		    		console.log(value);
		    		
		    		$("#option").append('<div><input type="radio" name="rad" value="'+value.options+'" id="radiobt'+count+'" onclick="myop('+value.id+')" required>'+value.options+'</div>');
		    		$("#count").val(count);
		    		count++;
		    		
		    	})
		    	
		    }
		    
			
			
		})
			
		}
		
		
		
	})
	
	
	
	
	}

</script>
<script>
$(document).ready(function(){
	
	
				
	var sub = $("#subject").val();
	alert("sub"+sub);
	
	$.ajax({
	url:"StudentServlet",
	type:"POST",
	datatype:"JSON",
	data:{action:"starttest", sub:sub},
	success:function(data)
	{
		//alert(JSON.stringify(data));
		
		
		 
			console.log(data);
			$("#question").val(data.quetion);
			
			$("#qid").val(data.question_id);
		
			var qid = $("#qid").val();
			var correct = $("#correct").val(data.correct_answer);
			//alert(correct.val());
		//alert(qid);
		var count=1;
		
		$.ajax({
			
			url:"StudentServlet",
			type:"POST",
			datatype:"JSON",
			data:{action:"getanswer", qid:qid},
		    success:function(data){
		    	//alert(data);
		    	console.log(data);
		    	$.each(JSON.parse(data), function(key, value){
		    		console.log(value);
		    		
		    		$("#option").append('<div><input type="radio" name="rad" value="'+value.options+'" id="radiobt'+count+'" onclick="myop('+value.id+')" required>'+value.options+'</div>');
		    		$("#count").val(count);
		    		count++;
		    		
		    	})
		    	
		    }
		    
			
			
		})
		
		
	}
	
		
	
	
			
		
	
	
	
	
});
	displayGrid();
	
});



	

</script>

<script>

function myop(id)
{
	alert(id);
	
	$("#opid").val(id);
	
	}

</script>

<script>
function nextQue()
{
	var questioncount =$("#questioncount").val();
	var val =parseInt(questioncount)-parseInt(1);
	alert("bbbbbbbb "+$("#"+val).css('background-color'));
	if($("#"+val).css('background-color')=="rgb(62, 196, 78)")
		{
		alert("111111111111111111111111");
		$("#questioncount").val(parseInt(questioncount)+parseInt(1));
		nextQue();
		}
	
	var opid = $("#opid").val();
    	$("#opid").val("");
	var correct = $("#correct").val();
	var qid = $("#qid").val();
	var status = "attempted";
	
	alert("opid "+opid);
	if(opid==null || opid=="" )
		{

		alert("Next question");
		$("#option").empty();
		var questioncount =$("#questioncount").val();
		alert("questioncount "+questioncount);
		$.ajax({
			url:"StudentServlet",
			type:"POST",
			datatype:"JSON",
			data:{action:"nextquestion",questioncount:questioncount},
			success:function(data)
			{
				
				 
				var cur =parseInt($("#questioncount").val())+parseInt(1);
				$("#questioncount").val(cur);
					alert("pooja"+data);
					console.log(data);
					$("#question").val(data.quetion);
					
					$("#qid").val(data.question_id);
				
					var qid = $("#qid").val();
					var correct = $("#correct").val(data.correct_answer);
					//alert(correct.val());
				//alert(qid);
				var count=1;
				
				$.ajax({
					
					url:"StudentServlet",
					type:"POST",
					datatype:"JSON",
					data:{action:"getanswer", qid:qid},
				    success:function(data){
				    	//alert(data);
				    	console.log(data);
				    	$.each(JSON.parse(data), function(key, value){
				    		console.log(value);
				    		
				    		$("#option").append('<div><input type="radio" name="rad" value="'+value.options+'" id="radiobt'+count+'" onclick="myop('+value.id+')" required>'+value.options+'</div>');
				    		$("#count").val(count);
				    		count++;
				    		
				    	})
				    	
				    }
				    
					
					
				})
				
					
			}
		});
		
		
			
	}
		
	else
		{
		var question =parseInt($("#questioncount").val())-parseInt(1);
		$("#"+question).attr('style',  'background-color:#3ec44e;margin:3px');
		
		
		$("#attemptcount").val(parseInt($("#attemptcount").val())+parseInt(1));
		
		
		
	$.ajax({
	
		url:"StudentServlet",
		type:"POST",
		data:{action:"checkanswer", qid:qid, opid:opid, correct:correct, status:status},
		success:function(data)
		{
			alert(data);
			if(data=="result")
			{
				
				
			       window.location.href="result.jsp";
			}
			else
				{
			alert("Next question");
			var attemptcount =$("#attemptcount").val();
			var count =$("#totalquestion").val();
			var questioncount =$("#questioncount").val();
			
			alert("attemptcount "+attemptcount);
			alert("totalquestion "+count);
			alert("questioncount "+questioncount);
			$.ajax({
				url:"StudentServlet",
				type:"POST",
				datatype:"JSON",
				data:{action:"nextquestion",questioncount:questioncount},
				success:function(data)
				{
					
						var attemptcount =$("#attemptcount").val();
						var count =parseInt($("#totalquestion").val()) -parseInt(1);
						if(parseInt(count)   == (parseInt(questioncount)-parseInt(1)))
						{
							alert("equal");
							alert("1 "+parseInt(count));
							alert("2 "+(parseInt(questioncount)-parseInt(1)));
							alert("3 "+parseInt(attemptcount));
						if(parseInt(attemptcount)   < parseInt(count))
							{
							alert("Attempt all questions")
							return false;
							}
						
						else if(parseInt(attemptcount)   == parseInt(count))
							{
							alert("count equal ")
							window.location.href="result.jsp";
							}
						}
						
					else if(parseInt(attemptcount)   == parseInt(count))
						{
						alert("count equal ")
						window.location.href="result.jsp";
						}
						
					
					else
						{
						$("#option").empty();
					 
					var cur =parseInt($("#questioncount").val())+parseInt(1);
					$("#questioncount").val(cur);
						alert("pooja"+data);
						console.log(data);
						$("#question").val(data.quetion);
						
						$("#qid").val(data.question_id);
					
						var qid = $("#qid").val();
						var correct = $("#correct").val(data.correct_answer);
						//alert(correct.val());
					//alert(qid);
					var count=1;
					
					$.ajax({
						
						url:"StudentServlet",
						type:"POST",
						datatype:"JSON",
						data:{action:"getanswer", qid:qid},
					    success:function(data){
					    	//alert(data);
					    	console.log(data);
					    	$.each(JSON.parse(data), function(key, value){
					    		console.log(value);
					    		
					    		$("#option").append('<div><input type="radio" name="rad" value="'+value.options+'" id="radiobt'+count+'" onclick="myop('+value.id+')" required>'+value.options+'</div>');
					    		$("#count").val(count);
					    		count++;
					    		
					    	})
					    	
					    }
					    
						
						
					})
					
				}
				}
			});
			
			
				
		}
		
		}	
	});
} 
	
	
	
	
	
	}
</script>

<script>
var s=59;
var m=1;
var q;


var sub = $("#subject").val();
$.ajax({
	url:"StudentServlet",
	type:"POST",
	data:{action:'getMarks',subject:sub},
	success:function(data)
	{
		m=data-1;
		alert("hhhhhhhhhhhhhhhhh"+data);
	}
});
/* 
m=parseInt($("#time").val())-parseInt(1); */
	setInterval(function DisplaySessionTimeout(){
		
		
		
	$("#timer").text(m+":"+s+" remaining");
	s = s-1;
	
	if (s<1)
	{
		m=m-1; s=59;
		q=setTimeout(DisplaySessionTimeout(), 1000)
		}
	if (m<0)
	{
		clearTimeout(q);
		alert("Your time has been finished!!!");
		window.location.href="result.jsp";
	}
	},1000);
         

               
        
</script>


</head>
<body onLoad="DisplaySessionTimeout();">
<div class="nav" style="background-color: #4b6b87">
<ul>
<li class="logout"><a href="Registration.jsp">Logout</a>
</ul>
</div>
<div class="container-fluid">
<div class="row">

<!-- <div class="col-sm-3">

<div class="div1" id="flag">



</div>

</div> -->
<div class="col-md-4" style="background-color:#4b6b87;height:570px;width:300px;padding-top:50px;">
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

<div class="form-horizontal col-sm-6" style="background-white;margin-left:110px;">
<!-- <div>
<ul style="text-align:right">
<li class="btn btn-primary" style="text-align:right; margin-top:10px;"><a href="ResumeDetails.jsp"><span style="color:white;">Resume</span></a></li>
<li class="btn btn-primary" style="text-align:right; margin-top:10px;"><a href="UploadDocuments.jsp" ><span style="color:white;">Upload</span></a></li>
<li class="btn btn-primary" style="text-align:right; margin-top:10px;"><a href="viewnotes.jsp"><span style="color:white;">View Notes</span></a>
<li class="btn btn-primary" style="text-align:right; margin-top:10px;"><a href="StudentServlet?action=checkfirsttest"><span style="color:white;">Test</span></a></li>

</ul>
</div> -->
<div id="main">
<div><span style="color:green">Timer:</span>
<span id="timer" style="color:red" ></span>
</div>
<center><h2>Start Test</h2></center><br><br>
<!-- <div class="form-group">
	<label class="col-sm-2 control-label">Branch:</label>
	<div class="col-sm-8">
		<select style="height:30px;" name="branch" id="selectbranch">
		  <option value="select">Select Branch</option>	
		  <option value="extc">EXTC</option>
		  <option value="electronic">ELECTRONIC</option>
		  <option value="computer">COMPUTER</option>
		  <option value="mechanical">MECHANICAL</option>
		</select>
	</div>
</div><br> -->

												
<div class="form-group">
	<label class="col-sm-2 control-label">Question:</label>
	<div class="col-sm-6" >
		<input type="text" name="quetion" class="form-control" id="question" value="" readonly> 
	</div>	
</div><br>

<div class="form-group">
	<label class="col-sm-2 control-label">Options:</label>
	<div class="col-sm-6" id="option">
		 <!-- <div class="col-sm-1">1.</div> 
		<div class="col-sm-1"><input type="radio" id="" name=""></div>
		<div class="col-sm-11">
			<input type="text" name="options" class="form-control" id="op1" style="height:22px;margin-left:-20px;" required>
		</div>
		
		<div class="col-sm-1">2.</div>
		<div class="col-sm-1"><input type="radio" id="" name=""></div>
		<div class="col-sm-11">
		<input type="text" name="options" class="form-control" style="height:22px;margin-left:-20px;"  id="op2" required>
		</div>
		<div class="col-sm-1">3.</div>
		<div class="col-sm-1"><input type="radio" id="" name=""></div>
		<div class="col-sm-11">
		<input type="text" name="options" class="form-control" style="height:22px;margin-left:-20px;"  id="op3" required>
		</div>
		<div class="col-sm-1">4.</div>
		<div class="col-sm-1"><input type="radio" id="" name=""></div>
		<div class="col-sm-11">
		<input type="text" name="options" class="form-control" style="height:22px;margin-left:-20px;" id="op4" required>
		</div> -->
	</div>	
</div>

<br>
<div class="form-group">
<input type="hidden" id="qid" value="">
<input type="hidden" id="correct" value="">	
<input type="hidden" id="opid" value="">
<input type="hidden" id="count" value="">	
<input type="hidden" id="time" value="">
<input type="hidden" id="questioncount" value="2">
<input type="hidden" id="attemptcount" value="0">
<input type="hidden" id="totalquestion" value="0">
<%-- <% 
String sub=; 
out.write(sub);
%> --%>
<input type="hidden" id="subject" value="<%=request.getParameter("sub")%>">
	<br><br><br><br><br>
<center><Button class="btn btn-primary" type="submit" id="next" value="next" onclick="nextQue()">Next</Button></center>

</div>

</div>


<br/>
</div>
<div class="col-sm-2">

<div class="div1" id="flag">



</div>

</div>
</div>
<div class="hidediv">

<label id="msg">


</label>

</div>
</div>

</body>
</html>