<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/style.css">

<script>
    history.forward();
</script>
<!-- <script>

if ( $('#dob')[0].type != 'date' ) 
	$('#dob').datepicker();
</script> -->
<!-- <script>
$(document).ready(function(){
	$.ajax({
	
		url:"StudentServlet",
		type:"POST",
		data:{action:"getStudentname"},
		success:function(data){
			//alert(data);
			
			$("#username").text(data);
			
		}
		
		
	})
})


</script> -->

<script>

$(document).ready(function(){
	$("#email").blur(function(){
		
	var email = 	$("#email").val();
		
		$.ajax({
		
			url:"StudentServlet",
			type:"POST",
			data:{action:"getEmail", email:email},
			success:function(data)
			{
			if(data=="error")	
				{
				alert("Enter the email id from which you have login!!!");
				$("#email").val("");
				return false;
				}
			}
			
			
		})
		
	})
	
	
	
})


</script>

<script>
$(document).ready(function(){
	
	
	
	
	 var next =1;
	 document.getElementById("count").value=next; 
	$(".add-more").click(function(e)
	{	
		//alert("hello");
		 next = next + 1;
		
	var newIn = '<tr id="field' + next + '" name="row"><td style="text-align:center; border:1px solid black"><select id="qual'+next+'" class="dropdown" name="qual" style="border:1px solid #729ce0"><option value="X">X</option><option value="XII">XII</option><option value="B.E">B.E</option><option value="M.E">M.E</option><option value="M.B.A">M.B.A</option></select></td><td style="border:1px solid black; text-align:center"><input type="text" name="year" id="year'+next+'" style="border:1px solid #729ce0;"/></td><td style="border:1px solid black; text-align:center"><input type="text" name="uni" id="uni'+next+'" style="border:1px solid #729ce0"/></td><td style="border:1px solid black; text-align:center"><input type="text" name="per" id="per'+next+'" style="border:1px solid #729ce0"/></td><td style="text-align:center; border:1px solid white;"><i class="glyphicon glyphicon-minus-sign remove" id="'+next+'" style="color:#4b6b87; font-size:25px"><i/></td></tr>';
	
	
	
	$("#mytable").append(newIn);
		
		 var count1 = next;
		 alert(count1);
		 
		 document.getElementById("count").value=count1; 
	})
	
	$(document).on('click', '.remove',function(){
		alert("hello");
		
		var rmvbtn = $(this).attr("id")
		alert(rmvbtn);
		$("#field"+rmvbtn+"").remove();
		
		next--;
		document.getElementById("count").value=next;
		
	});
});
</script>

<script>

$(document).ready(function(){
	
	next = 1;
	
	$("#countproject").val(next);
	//alert("hello");
	$("#addproject").click(function()
			{
		next = next+1;
		
		var row = '<tr id="project' + next + '" name="project"><td style="border:1px solid black; text-align:center"><input type="text" name="pname" id="pname'+next+'" style="border:1px solid #729ce0"/></td><td style="border:1px solid black; text-align:center"><input type="text" name="plang" id="plang'+next+'" style="border:1px solid #729ce0"/></td><td style="border:1px solid black; text-align:center"><input type="text" name="pdesc" id="pdesc'+next+'" style="border:1px solid #729ce0"/></td><td style="border:1px solid white; text-align:center"><i class="glyphicon glyphicon-minus-sign removeme" id="'+next+'" style="color:#4b6b87; font-size:25px"> </i></td></tr>';

		
		
		$("#projectable").append(row);
		
		var count = next;
		
		$("#countproject").val(count);
		
			})
	
	$(document).on('click','.removeme', function()
			
	{
		var rmv = $(this).attr("id");
		$("#project"+rmv+"").remove();
		next--;
		$("#countproject").val(next);
	}
	
	
	)
			
			
	
	
	
	
	
})



</script>

<script>
 $(document).ready(function(){
	$("#save").click(function(){
		
		alert("save");
		
		var name = $("#name").val();
		var email = $("#email").val();
		var phone = $("#phoneno").val();
		var add = $("#address").val();
		var obj = $("#objective").val();
		var gender =$("#radio:checked").val();
		var dob = $("#dob").val();
		var father_name = $("#fathername").val();
		var hobby = $("#hobby").val();
		var lang = $("#lng").val();
		var place = $("#place").val();
		 var patternname = /^[a-zA-Z\s]+$/;
		 var patterlang = /^[a-zA-Z\s,]+$/;
		 
		  if(name=='' || email=='' || phone=='' || add=='' || gender=='' || dob=='' || obj=='' || father_name=='' || hobby=='' || lang=='' || place=='')
		 
			 {
			 alert("All field are required!!");
			 return false;
			 } 
			 
		 if(!name.match(patternname))
		   	{
		   	alert("Only characters are allowed!!");
		   	$("#name").val("");
		   	return false;
		   	}
			 
			
		
		 var phoneno = /^\d{10}$/;
		 if(!phone.match(phoneno))
		   
		    {
		       alert("Not a valid Phone Number");
		       $("#phone").focus();
		       return false;
		    }
		 
		 var regex = /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$/;
			if(!email.match(regex))
				  {
				 alert("Enter correct email id");
				 $("#email").val("");
				
				 $("#email").focus();
				 return false;
				 }  
			
			 if(!father_name.match(patternname))
			   	{
			   	alert("Only characters are allowed!!");
			   	$("#fathername").val("");
			   	return false;
			   	}
			 if(!lang.match(patterlang))
			   	{
			   	alert("Only characters are allowed!!");
			   	$("#lng").val("");
			   	return false;
			   	}
			 if(!place.match(patternname))
			   	{
			   	alert("Only characters are allowed!!");
			   	$("#place").val("");
			   	return false;
			   	}
		 
		  
		
		var count = $("#count").val();
		alert(count);
		var cproj = $("#countproject").val();
		alert(cproj);
		var qual=[];
		var year =[];
		var uni = [];
		var per = [];
		var pname=[];
		var plang=[];
		var pdesc=[];
		var prof=[];
		var pprof=[];
		
		
		for(var i = 1; i<=count; i++)
			{
			
			var unival = $("#uni"+i).val()
			var yearval = $("#year"+i).val();
			var perval = $("#per"+i).val();
			var digit = /^\d{4}$/;
			var ppattern = /^(0*100{1,1}\.?((?<=\.)0*)?%?$)|(^0*\d{0,2}\.?((?<=\.)\d*)?)$/;
		 
			if(!yearval.match(digit))
			{
			alert("Enter year proper format!!!");
			return false;
			} 
			
			 if(!unival.match(patternname))
				{
				
				alert("only characters are allowed in university name!!!");
				return false;
				}
			
			
			
			 if(!perval.match(ppattern))
			{
				alert("Percentage format is required!!");
				return false;
			} 
			 
			//alert("qual"+qual);
		qual.push($("#qual"+i).val());
		year.push($("#year"+i).val());
		uni.push($("#uni"+i).val());
		per.push($("#per"+i).val());
		prof.push(i);
		
			}
		for(var i =1; i<=cproj; i++)
			{
			var proj = $("#pname"+i).val();
			var langug = $("#plang"+i).val();
			var description = $("#pdesc"+i).val();
			
			/* if(!proj.match(patternname))
				{
				alert("only characters are allowed in Project name!!!");
				return false;
				} */
			if(!langug.match(patternname))
				{
				alert("only characters are allowed in Language!!!");
				return false;
				}
			pname.push($("#pname"+i).val());
			plang.push($("#plang"+i).val());
			pdesc.push($("#pdesc"+i).val());
			pprof.push(i);
			
			}
		
		/* alert("outofloop"+pname);
		alert("outofloop"+plang);
		alert("outofloop"+pdesc); */
	
		
		
		$.ajax({
			
			url:"StudentServlet",
			method:"POST",
			data:{action:"saveData", name:name, email:email, phone:phone, add:add, obj:obj, qual:qual, year:year, uni:uni, per:per, prof:prof, pprof:pprof, gender:gender, dob:dob, father_name:father_name, hobby:hobby, lang:lang, place:place, pname:pname, plang:plang, pdesc:pdesc},
			success:function(data)
			{
				alert(data);
				 
				
				
				 $.ajax({
					url:"StudentServlet",
					type:"POST",
					
					data:{action:"getpdf"},
					success:function(data)
					{
						alert(data);
						$("#myModal").modal("toggle");
						
						//$("#getCode").html(data);
				 
					
						/* $("#name").val("");
						$("#email").val("");
						$("#phoneno").val("");
						$("#address").val("");
						$("#objective").val("");
						$("#radio:checked").val("");
						$("#dob").val("");
						$("#fathername").val("");
						$("#hobby").val("");
						$("#lng").val("");
						$("#place").val("");
						$("#projectable").val("");
						$("#field").val("");  */
						window.location.href="ResumeDetails.jsp";
					
					}
				})
				
			//
				
				
				
				
			}
			
			
			
		});
		
	})
	 
	 
	 
	 
	 
	 
	 
 })
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
<body >
<div class="nav" style="background-color:#4b6b87"	>
<div style="float:right">
<ul>
<li class="btn" style="text-align:right; margin-top:10px; font-size:20px;"><a href="UploadDocuments.jsp" ><span style="color:white;">Upload</span></a></li>
<li class="btn " style="text-align:right; margin-top:10px;font-size:20px; "><a href="viewnotes.jsp"><span style="color:white;">View Notes</span></a></li>
<li class="btn " style="text-align:right; margin-top:10px; font-size:20px;"><a href="StudentServlet?action=checkfirsttest"><span style="color:white;">Test</span></a></li>
<li class="btn"><a href="Registration.jsp" style="font-size:20px; color:white;padding-right:20px">Logout</a></li>
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
<div class="div1 col-sm-11"  style="background-color:white; border:2px solid #a32d41">
<div>
<ul style="text-align:right">


</ul>
</div>

<h1 style="text-align:center">Details for Resume</h1>
<br><br><br>
  <form class="form-horizontal">
  <div class="form-group">
      <label class="control-label col-sm-2" for="name" >Name:</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" id="name" style="border:1px solid #729ce0"  name="name">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="email">Email Id:</label>
      <div class="col-sm-8">
        <input type="email" class="form-control" id="email" style="border:1px solid #729ce0" name="email">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="phoneno">Phone No:</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" id="phoneno" style="border:1px solid #729ce0" name="phoneno">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="address">Address:</label>
      <div class="col-sm-8">          
        <input type="text" class="form-control" id="address" style="border:1px solid #729ce0" name="address">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="objective">Objective:</label>
      <div class="col-sm-8">          
        <input type="text" class="form-control" id="objective" name="objective" style="border:1px solid #729ce0">
      </div>
    </div>
    <hr style="border:1px solid #a32d41">
    <br>
    <h3>Educational Details</h3>
    <br>
    <div style="overflow-x:auto;">
    <table class="table table-bordered" id="mytable" style="border:2px solid black">
    <thead style="background-color:#4b6b87; color:white">
      <tr style="border:1px solid black">
        <th style="text-align:center; border:1px solid black">Qualification</th>
        <th style="text-align:center;border:1px solid black ">Year of Passing</th>
        <th style="text-align:center; border:1px solid black">University</th>
        <th style="text-align:center; border:1px solid black">%</th>
        <!-- <th style="background-color:lightgray;"></th> -->
      </tr>
    </thead>
    <tbody style="border:1px solid black;">
      <tr id="field" name="row" style="border:1px solid black;">
        <td style="text-align:center; border:1px solid black" >
        <select id="qual1" class="dropdown" name="qual1" style="border:1px solid #729ce0">
        <option value="X" >X</option>
        <option value="XII">XII</option>
        <option value="B.E">B.E</option>
        <option value="M.E">M.E</option>
        <option value="M.B.A">M.B.A</option>
        </select>
        </td>
       
        <td style="text-align:center; border:1px solid black"><input type="text" name="year" id="year1" style="border:1px solid #729ce0"></td>
        <td style="text-align:center; border:1px solid black"><input type = "text" name="uni" id="uni1" style="border:1px solid #729ce0"></td>
        
        <td style="text-align:center; border:1px solid black"><input type="text" name="per" id="per1" style="border:1px solid #729ce0"></td>
        <td style="text-align:center; border:1px solid white">
        <i class="glyphicon glyphicon-plus-sign add-more" style="color:#4b6b87; font-size:25px"></i></td>
        
       <!--  <input type="button" class="add-more" value="Add More"></td> -->
      </tr>
    </tbody>
  </table>
  </div>
  <hr style="border:1px solid #a32d41">
  <br>
  <h3>Project Details</h3>
  <br>
  <div style="overflow-x:auto;">
    <table class="table table-bordered table-responsive" id="projectable">
    <thead style="background-color:#4b6b87; color:white">
      <tr>
        <th style="text-align:center; border:1px solid black">Project Name</th>
        <th style="text-align:center; border:1px solid black">Language</th>
        <th style="text-align:center; border:1px solid black">Description</th>
        <!-- <th style="background-color:lightgray;"></th> -->
      </tr>
    </thead>
    <tbody>
      <tr id="project" name="project">
        <td style="text-align:center; border:1px solid black"><input type="text" name="pname" id="pname1" style="border:1px solid #729ce0"></td>
        <td style="text-align:center; border:1px solid black"><input type="text" name="plang" id="plang1" style="border:1px solid #729ce0"></td>
        <td style="text-align:center; border:1px solid black"><input type="text" name="pdesc" id="pdesc1" style="border:1px solid #729ce0"></td>
        <td style="text-align:center; border:1px solid white"><i class="glyphicon glyphicon-plus-sign" style="color:#4b6b87; font-size:25px" id="addproject"></i></td>
<!--         <input type="button" id="addproject" value="Add More"></td>
 -->      </tr>
    </tbody>
  </table>
  </div>
  <hr style="border:1px solid #a32d41">
    <br>
  <h3>Personal Details</h3>
  <br>
  <div class="form-group">
      <label class="control-label col-sm-2" for="gender">Gender:</label>
      <div class="col-sm-10">
       <!--  <input type="text" class="form-control" id="gender"  name="gender"> -->
      <input type="radio" name="radio" id="radio" value="male" >Male
      <input type="radio" name="radio" id="radio" value="female">Female
      
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="dob">DOB:</label>
      <div class="col-sm-8">
        <input type="date" class="form-control" id="dob"  name="dob" style="border:1px solid #729ce0">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="fathername">Father Name:</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" id="fathername"  name="fathername" style="border:1px solid #729ce0">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="hobby">Hobby:</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" id="hobby"  name="hobby" style="border:1px solid #729ce0">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="lng">Language Known:</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" id="lng"  name="lng" style="border:1px solid #729ce0">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="place">Place:</label>
      <div class="col-sm-8">
        <input type="text" class="form-control" id="place"  name="place" style="border:1px solid #729ce0">
      </div>
    </div>
    <input type="hidden" id="count" value="">
      <input type="hidden" id="countproject" value="">
      <br><br><br>
    <div class="form-group">        
      <div>
        <center><button type="button" class="btn btn-primary btn-lg" id="save">Submit</button></center>
      </div>
    </div>
  </form>
</div>


<div class="modal fade" id="myModal" role="dialog">
 <div class="modal-dialog">
 <div class="modal-content">
 <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body" id= "getCode"  style="overflow-x: scroll;">
          <p>Some text in the modal.</p>
                  <object type="application/pdf" data="path/to/pdf" width="100%" height="500" style="height: 85vh;">No Support</object>
          
        </div>
        <div class="modal-footer" >
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
</div>
</div>

</div>

</body>
</html>