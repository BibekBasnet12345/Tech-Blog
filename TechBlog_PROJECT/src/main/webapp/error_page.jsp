<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sorry Something went wrong</title>
<%@include file="CDN/linkof_css_js.jsp" %>
</head>
<body>
		<div class="container text-center" >
		<img  class="img-fluid" alt="error" src="image/computer.png">
		<h3 class="display-3">Sorry ! Something Went Wrong...</h3><br>
		<h4 class="display-3"><%=exception %><br></h4>
		<a  href="Home.jsp" class="btn btn-lg bg-info text-white">Home</a>
		
		</div>
</body>
</html>