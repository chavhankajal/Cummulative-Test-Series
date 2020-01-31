<%@page import="com.training.pojo.DocumentsPojo"%>
<%@page import="java.util.*"%>
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
<script src="jquery.ajaxfileupload.js"></script>

<script>
    history.forward();
</script>
<script>

function download(id, filename)
{
	$(document).ready(function(){
	
		alert(id);
		alert(filename);
		 location.href="FileDownloadServlet?id="+id+"&filename="+filename;
		
	/* 	$.ajax({
		
			url:"FileDownloadServlet",
			type:"POST",
			data:{action:"getdownload", id:id, filename:filename},
			success:function(data)
			{
				
			}
		
		}) */
		
		
		
		
	})
	
	
	
	
	}



</script>


<!--  <script

	
	
	$.ajax({
		
		url:"FileDownloadServlet",
		method:"POST",
		 datatype:"json",
		data:{action:"getList"},
		success:function(data)
		{
			var val = JSON.parse(data);
			$.each(val, function(key, value)
					{
				row='<tr><td><label id="name">'+value.document_name+'</label></td><td><input type="hidden" value="'+value.id+'" id="id"></td><td><input type="button" value="download" class="download"></td></tr>'
					
					$("#field").append(row);
					
				
					
				});
			$(".download").click(function(){
				
				
				alert("download");
				
				var id = $("#id").val();
				alert("idddddddddd"+id)
				
				
					}
			
			
			)
		}
		
		
		
		
	}) 
	
	
	

</script>-->


</head>
<body>
<div class="nav" style="background-color:black; padding:10px" >

<ul>
<!-- <li style="text-align:right"><a href="FileDownloadServlet?action=getList">Download</a>
 -->
 <li style="text-align:right;"><a href="FileDownloadServlet?action=getList" style="color:white">Logout</a>
 </ul>

</div>


<div class="container">
<table class="table table-bordered">
<thead>
<tr>

<td>File Name</td>
<td>Download</td>


</tr>
</thead>
<tbody id="field">


<%
				List uploadedList=(List)session.getAttribute("list");
				if(uploadedList!=null && uploadedList.size()>0)
				{
					for(int i=0;i<uploadedList.size();i++)
					{
						DocumentsPojo sp=(DocumentsPojo)uploadedList.get(i);
						%>
						
<tr>
<td><label id="name"><%=sp.getDocument_name()%></label></td>
<td><button onclick="download('<%=sp.getId()%>','<%=sp.getDocument_name()%>')"><i class="fa fa-download"></i></button></td>
<%
    }
	} %>

</tr>
</tbody>

</table>

</div>

</body>
</html>