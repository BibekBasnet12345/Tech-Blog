<%@page import="com.entities.Message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<%@include file="CDN/linkof_css_js.jsp" %>
</head>
<body>
<!-- Navbar -->
<%@include file="navbar.jsp" %>
<main class="d-flex align-items-center p-15" style="height:80vh">
			<div class="container">
							<div class="col-md-4 offset-md-4"  style="padding-top:25px;">
									<div class="card  primary-background " >
											<div class="card-header text-center bg-info text-white "><span  class="fa fa-user-circle fa-spin fa-3x"></span><br><h2> Login here</h2></div>
											<br>
											 <%
											Message m=(Message) session.getAttribute("msg");
											 if(m!=null){
												 %>
												 <div class="alert <%=m.getCssClass() %>" role="alert">
                                                <%=m.getContent() %>
                                                 </div>
                                                 <%
											 }
											 session.removeAttribute("msg");
											 %>
											<form action="LoginServlet" method="post">
											<div class="card-body">
										
												  <div class="form-group">
												    <label for="exampleInputEmail1">Email address</label>
												    <input  name="user_email"  autocomplete="off" required="required" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
												    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
												  </div>
												  <div class="form-group">
												    <label for="exampleInputPassword1">Password</label>
												    <input  required  name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
												  </div>
											</div>
											<div class="card-footer text-center ">
											 <button type="submit" class="btn btn-info text-center"  >Submit</button>
											</div>
												</form>
									</div>
							</div>
					</div>
</main>
</body>
</html>