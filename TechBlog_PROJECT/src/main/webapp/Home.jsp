<%@page import="com.helper.connectionprovider"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>

<%@include file="CDN/linkof_css_js.jsp" %>

</head>
<body>
<%@include file="navbar.jsp" %>
<!-- banner -->
<div class="container-fluid m-0 p-0 banner-background">
    <div class="	jumbotron p-3 mb-2 bg-info text-white">
          <div class="container">
         <h3 class="display-3">Welcome to TechBlog</h3>
         
         <p>A programming language is any set of rules that converts strings, or graphical program elements in the case of visual programming languages, to various kinds of machine code output. Programming languages are one kind of computer language, and are used in computer programming to implement algorithms.</p>
         <p>Most programming languages consist of instructions for computers. There are programmable machines that use a set of specific instructions, rather than general programming languages.</p>
       <a  href="Register.jsp" class="btn btn-outline-light btn-lg"> <span class="fa fa-user-plus"></span> Start ! It's Free</a>
         <a  href="Login.jsp" class="btn btn-outline-light btn-lg"> <span class="fa fa-user-circle fa-spin"></span> Login</a>
           <br><br>
         </div>
    </div>
</div>
<br>
<!--//cards  -->
<div class="container">
 		  <div class="row mb-3">
				      <div class="col-md-4">
				                         <div class="card" >
				                                     <div class="card-body">
				                             	              <h5 class="card-title">Java Programming Language</h5>
				                	                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				     								          <a href="#" class="btn bg-info text-white">Read More</a>
				     								 </div>
				    				     </div>
    					  </div>
    					  
    					  <div class="col-md-4">
				                         <div class="card" >
				                                     <div class="card-body">
				                             	              <h5 class="card-title">Java Programming Language</h5>
				                	                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				     								          <a href="#" class="btn bg-info text-white">Read More</a>
				     								 </div>
				    				     </div>
    					  </div>
    					  
    					  <div class="col-md-4">
				                         <div class="card" >
				                                     <div class="card-body">
				                             	              <h5 class="card-title">Java Programming Language</h5>
				                	                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				     								          <a href="#" class="btn bg-info text-white">Read More</a>
				     								 </div>
				    				     </div>
    					  </div>
  			 </div>
  			 
  			   <div class="row">
				      <div class="col-md-4">
				                         <div class="card" >
				                                     <div class="card-body">
				                             	              <h5 class="card-title">Java Programming Language</h5>
				                	                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				     								          <a href="#" class="btn bg-info text-white">Read More</a>
				     								 </div>
				    				     </div>
    					  </div>
    					  
    					  <div class="col-md-4">
				                         <div class="card" >
				                                     <div class="card-body">
				                             	              <h5 class="card-title">Java Programming Language</h5>
				                	                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				     								          <a href="#" class="btn bg-info text-white">Read More</a>
				     								 </div>
				    				     </div>
    					  </div>
    					  
    					  <div class="col-md-4">
				                         <div class="card" >
				                                     <div class="card-body">
				                             	              <h5 class="card-title">Java Programming Language</h5>
				                	                          <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
				     								          <a href="#" class="btn bg-info text-white">Read More</a>
				     								 </div>
				    				     </div>
    					  </div>
  			 </div>
	</div>
<script
  src="https://code.jquery.com/jquery-3.5.1.min.js"   integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="   crossorigin="anonymous"></script>
  

  <!-- checking jquery working or not
  <script >
  $(document).ready(function(){
	  alert("document loaded")
  }) -->
  
  </script>
</body>
</html>