<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Augment Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
 <!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
<!-- Graph CSS -->
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- jQuery -->
<link href='//fonts.googleapis.com/css?family=Roboto:700,500,300,100italic,100,400' rel='stylesheet' type='text/css'>
<!-- lined-icons -->
<link rel="stylesheet" href="css/icon-font.min.css" type='text/css' />
<!-- //lined-icons -->
<script src="js/jquery-1.10.2.min.js"></script>
<script src="js/amcharts.js"></script>	
<script src="js/serial.js"></script>	
<script src="js/light.js"></script>	
<script src="js/radar.js"></script>	
<link href="css/barChart.css" rel='stylesheet' type='text/css' />
<link href="css/fabochart.css" rel='stylesheet' type='text/css' />
<!--clock init-->
<script src="js/css3clock.js"></script>
<!--Easy Pie Chart-->
<!--skycons-icons-->
<script src="js/skycons.js"></script>

<script src="js/jquery.easydropdown.js"></script>

<!--//skycons-icons-->
<script>
    history.forward();
</script>
<script type="text/javascript">

$(document).ready(function(){
	//alert("First");
	$.ajax(
	{
		method:"POST",
		url:"StudentServlet",
		data:{action:'GetResult'},
		success:function(data)
		{
		console.log(data);	
		//alert("result "+data);
		$("#result").text(data);
			 
			
		}
	});
	
});

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
</head>
<body>

<div class="nav">
<ul>
<li class="btn " style="text-align:right;font-size:20px; margin-top:10px; "><a href="viewnotes.jsp"><span style="color:white;">View Notes</span></a></li>
<!-- <li class="btn " style="text-align:right; margin-top:10px; background-color:#a32d41"> <a href="StudentServlet?action=checkfirsttest"><span style="color:white;">Test</span></a></li>-->
 <li class="btn " style="text-align:right;font-size:20px; margin-top:10px; "><a href="instruction.jsp"><span style="color:white;">Test</span></a></li>

<li class="btn"><a href="Login.jsp" style="font-size:20px;color:white; padding-right:20px">Logout</a></li>
</ul>
</div>
<div class="div1 form-horizontal col-sm-10" style="background-color:lightgray;margin-left:110px;">
<div>
<ul style="text-align:right">

</ul>
</div>

<div class="page-container">
   <!--/content-inner-->
	<div >
	   <div class="inner-content">
	   
		<!-- header-starts -->
			<div class="header-section">
						<!--menu-right-->
						<div style="color:blue; width:100%">
						   <!--  <div style="background-color: blue">  <a href="LogoutServlet" style="float:right;padding:20px;"><span style="color:black; background-color:blue"><i class="fa fa-user"></i>&nbsp;&nbsp;Logout</span></a>
							
							</div> --><!--/profile_details-->
							<!--  	<div class="profile_details_left">
									<ul class="nofitications-dropdown">
											
									      
										
							
								 <li class="dropdown note" style="margin-left:150px;">
											<a href="" class="dropdown-toggle" data-toggle="dropdown"  aria-expanded="false"><i class="fa fa-user"></i><span class="badge"></span></a>

												
													 <ul class="dropdown-menu two first">
														
														<li><a href="LogoutServlet">
														   
														   <div class="notification_desc">
															<p>logout</p>
															
															</div>
														   <div class="clearfix"></div>	
														 </a></li>
													</ul>
										</li>
							<div class="clearfix"></div>	
								</ul>
							</div>
							<div class="clearfix"></div>	-->
							<!--//profile_details-->
						</div>
						<!--//menu-right-->
					<div></div> 
				</div>
					<!-- //header-ends -->
						<div class="outter-wp">
								
												
													
						</div>
										
									
									 <!--footer section start-->
										<!--<footer>
										   <p>&copy 2016 sleek bill. All Rights Reserved | Design by <a href="" target="_blank">Aerus.</a></p>
										</footer>-->
									<!--footer section end--> 
								</div>
							</div>
				<!--//content-inner-->
			<!--/sidebar-menu-->
				<!-- <div class="sidebar-menu">
					<header class="logo">
					<a href="#" class="sidebar-icon"> <span class="fa fa-bars"></span> </a> <a href=""> <span id="logo">&nbsp;&nbsp;&nbsp;&nbsp;</span> 
					
				  </a> 
				</header>
			<div style="border-top:1px solid rgba(69, 74, 84, 0.7)"></div>
			/down
							
							   //down
                           <div class="menu">
									<ul id="menu" >
										<li><a href="CompanyAddCriteria.jsp"><i class="fa fa-tachometer"></i> <span>Add Interview Criteria</span></a></li>
										 
										 <li id="menu-academico" ><a href="CompanyServlet"><i class="fa fa-file-text-o"></i> <span>Add questions</span> </a>
											 
										 </li>
									<li><a href="StartExam.jsp"><i class="lnr lnr-pencil"></i> <span>Start Test</span></a></li>
									<li id="menu-academico" ><a href="viewstudent.jsp"><i class="lnr lnr-book"></i> <span>View Eligible Students</span> </a>
										  <li id="menu-academico" ><a href="StudentResult.jsp"><i class="lnr lnr-book"></i> <span>View Students Result</span> </a>
									 </li>
									 
							        
									
								  </ul>
								</div>
							  </div> -->
							  <div  ></div>		
							</div>
				
						<div class="col-sm-4"></div>
						<center>
						<div class="col-sm-5">
						<center><span style="font-size:25px;font-weight:bold;color:darkblue;">RESULT</span></center><br><br>
						<div style="padding:100px;border:1px solid darkblue;border-radius: 25px;">
						<span style="font-size:20px;color:Gray;"><span id="result" style="color:red;font-weight:bold;font-size:30px;"></span></span>
						</div>
						</div>	
						</center>	
						
						<div class="col-sm-4"></div></div>	
							<script>
							var toggle = true;
										
							$(".sidebar-icon").click(function() {                
							  if (toggle)
							  {
								$(".page-container").addClass("sidebar-collapsed").removeClass("sidebar-collapsed-back");
								$("#menu span").css({"position":"absolute"});
							  }
							  else
							  {
								$(".page-container").removeClass("sidebar-collapsed").addClass("sidebar-collapsed-back");
								setTimeout(function() {
								  $("#menu span").css({"position":"relative"});
								}, 400);
							  }
											
											toggle = !toggle;
										});
							</script>
<!--js -->

<script type="text/javascript" src="js/vroom.js"></script>
<script type="text/javascript" src="js/TweenLite.min.js"></script>
<script type="text/javascript" src="js/CSSPlugin.min.js"></script>
<script src="js/jquery.nicescroll.js"></script>
<script src="js/scripts.js"></script>

<!-- Bootstrap Core JavaScript -->
   <script src="js/bootstrap.min.js"></script>

</body>
</html>