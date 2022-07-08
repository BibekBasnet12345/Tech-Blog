

<%@page import="com.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page errorPage="error_page.jsp" %>
    <%
   User user=(User) session.getAttribute("currentuser");
    if(user==null){
    	response.sendRedirect("Login.jsp");
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile page</title>

<%@include file="CDN/linkof_css_js.jsp" %>
</head>
<body>
<!-- navabar -->

<nav id="nav" class=" navbar navbar-expand-lg navbar-light primary-background ">
  <a class="navbar-brand" href="Home.jsp"><span class="fa fa-home"></span>Tech Blog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#"><span class="	fa fa-heart-o"></span>Bi_dha <span class="sr-only">(current)</span></a>
      </li>
     
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        <span class="fa fa-level-down"></span>Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Programming Language</a>
          <a class="dropdown-item" href="#">Project Implementation</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Data Structure</a>
        </div>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#"><span class="fa fa-address-card-o"></span>  Contact</a>
      </li>
      
    
    </ul>
	    <ul class="navbar-nav mr-right">
	    <li class="nav-item">
        <a class="btn btn-outline-info  " data-toggle="modal" data-target="#Profile-Modal" ><span class="fa fa-user-circle "></span> &nbsp;<%=user.getName() %></a>
      </li>
	    <li class="nav-item">
        <a class="nav-link" href="LogoutServlet"><span class="fa fa-sign-out "></span>&nbsp;Log Out</a>
      </li>
	    
	    </ul>
  </div>
</nav>
<!--end of  navabar -->
<!--profile modal -->
<!-- Button trigger modal -->
<!-- Modal -->

    <div class="container">
   <div class="col-md-6 offset-md-3"  >
    <div class="card">
      <div class="card-header bg-info text-white  text-center " >
        <h5 class=" display-4" >&nbsp;&nbsp;&nbsp;&nbsp;TECH BLOG</h5>
      </div>
      <div class="card-body primary-background">
        <div class="container text-center ">
       <img alt="" src="image/<%=user.getProfile() %> " width="150" height="150" class="img-fluid"  style="border-radius:45%">
        <h5 class="text-info display-4"><%=user.getName() %></h5>
        <!-- //profile details-->
        <div id="profile-details">
        <table class="table">
 
			  <tbody>
			    <tr>
			      <th scope="row">ID:</th>
			      <td><%=user.getId() %></td>
			    </tr>
			    <tr>
			      <th scope="row">Email:</th>
			      <td><%=user.getEmail() %></td>
			    </tr>
			    <tr>
			      <th scope="row">Gender:</th>
			      <td><%=user.getGender().toUpperCase() %></td>
			    </tr>
			     <tr>
			      <th scope="row">Registered On:</th>
			      <td><%=user.getDateTime().toString()%></td>
			    </tr>
			      <tr>
			      <th scope="row">About:</th>
			      <td><%=user.getAbout()%></td>
			    </tr>
			  </tbody>
</table>
    </div>
    <!-- profile edit -->
    		<div id="profile-edit" style="display:none;">
    		<h3 class="text-warning mt-2">Please edit carefully!!</h3>
    		<form action="EditProfileServlet" method="post"  enctype="multipart/form-data">
    				<table  class="table">
    				    <tr>
				    		  <th scope="row">ID:</th>
				  		 	   <td><%=user.getId() %></td>
			   			 </tr>
			   			  <tr>
				    		  <th scope="row">Name:</th>
				  		 	   <td><input type="text"  class="form-control" name="user_name" value=<%=user.getName() %>></td>
			   			 </tr>
			   			 <tr>
				    		  <th scope="row">Email:</th>
				  		 	   <td><input type="email"  class="form-control" name="user_email" value=<%=user.getEmail() %>></td>
			   			 </tr>
			   			  <tr>
				    		  <th scope="row">Password:</th>
				  		 	   <td><input type="password"  class="form-control" name="user_password" value=<%=user.getPassword() %>></td>
			   			 </tr>
			   			   <tr>
				    		  <th scope="row">Gender:</th>
				  		 	   <td><%=user.getGender().toUpperCase() %></td>
			   			 </tr>
			   			   <tr>
				    		  <th scope="row">New Profile:</th>
				  		 	   <td><input type="file" name="user_image"class="form-control"></td>
			   			 </tr>
			   			  <tr>
				    		  <th scope="row">About:</th>
				  		 	   <td><textarea rows="2" cols="7" class="form-control"> <%=user.getAbout() %></textarea>
				  		 	   </td>
			   			 </tr>
    				</table>
    				<div class="container">
    					 <button type="submit" class="btn btn-outline-success" >Update</button>
			   			</div>
    		</form>
    		</div>
        </div>
      </div>
      <div class="card-footer text-center bg-secondary">
        <button  id="edit-profile-btn"  type="button" class="btn btn-info">Edit</button>
</div>
     </div>
      </div>
    </div>

<!--end of  modal -->
				

</body>
						<script >
						$(document).ready(function(){
							let editstatus=false;
								$("#edit-profile-btn").click(function(){
									if(editstatus==false){
									$("#profile-details").hide()
									$("#profile-edit").show();
									editstatus=true;
									$(this).text("Back")
									}
									else{
										$("#profile-details").show()
										$("#profile-edit").hide();
										editstatus=false;
										$(this).text("Edit")
									}
								})
						});
						</script>
</html>