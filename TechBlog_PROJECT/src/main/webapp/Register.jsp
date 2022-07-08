
<%@page import="com.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Here</title>
<%@include file="CDN/linkof_css_js.jsp" %>
</head>
<body>
<!-- navbar -->
<%@include file="navbar.jsp" %>
		<main class="p=5">
					<div class="container">
							<div class="col-md-6 offset-md-3" style="padding-top:15px;">
										<div class="card  primary-background ">
											<div class="card-header text-center bg-info text-white ">	<span  class="fa fa-user-plus fa-3x "></span><br> <h2>Register</h2></div>
											
									<form  id="reg-form" action="RegisterServlet"  method="post" >
											<div class="card-body">
											  <div class="form-group">
												    <label  for="user_name">User Name</label>
												    <input  required="required" autocomplete="off"  name="user_name" type="text" class="form-control" id="user_name" placeholder="Enter Your Name">
												  </div>
												  
												  <div class="form-group">
												    <label for="exampleInputEmail1">Email address</label>
												    <input required="required"  autocomplete="off"   name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
												    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
												  </div>
												
												  <div class="form-group">
												    <label for="exampleInputPassword1">Password</label>
												    <input  required="required"  name="user_password"  type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
												  </div>
												  
												  <div class="form-group">
												  <label for="gender"> <h6>Select Gender &nbsp;&nbsp; &nbsp; </h6></label>
												  <input required="required"  type="radio" id="gender" name="gender"  value="male"> Male <span class="	  fa fa-mars"></span>  &nbsp; &nbsp; &nbsp;
												   <input  required="required" type="radio" id="gender" name="gender"  value="female"> Female <span class="	fa fa-venus"></span>&nbsp; &nbsp; &nbsp;
												    <input   required="required" type="radio" id="gender" name="gender"  value="other"> Other <span class="		fa fa-transgender"></span>
												  </div>
												   <div class="form-group">
												  <textarea  name="user_about "  class="form-group" placeholder="Enter about yourself......" rows="2" cols="30"></textarea>
												  </div>
												  <div class="form-check">
												    <input  required="required" name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
												    <label class="form-check-label" for="exampleCheck1">Agree terms & Conditions</label>
												  </div>
												  <div id="spin" style="display:none;" class="container text-center"> <span class="fa fa-refresh fa-4x	 fa-spin"></span><h4><i>Please Wait....</i></h4></div>
												  
												<div class="card-footer text-center">
											 <button id="submit-btn" type="submit" class="btn btn-info text-center"  >Sign Up</button>
											 	</div>
											 </div>
										</form>
										</div>
							
							</div>
							
					</div>
		
		</main>
	<!--  //ajax based implemention if register is done-->
	 <script >
				
				$(document).ready(function(){
				
					$("form").submit(function(event){
						event.preventDefault();
						let data=new FormData(this);
					
						$("#submit-btn").hide();
						$("#spin").show();
						//send to register servlet
						 $.ajax({
							   url:"RegisterServlet",
							   type:'POST',
						       data:  data	,
						       success: function (data, textStatus,jqHXR) {
						    	   console.log(data);
						    	   $("#submit-btn").show();
									$("#spin").hide();
									
									swal({
										  title: "Greatjob!",
										  text: "Now you can post your Blog by Loging in.. ",
										  icon: "success",
										  successMode: true,
										})
										.then((value) => {
										window.location="Login.jsp";
										});
									
						       },
						       error: function (jqHXR,textStatus, errorThrown) {
						    	   console.log(jqHXR);
						    	   $("#submit-btn").show();
									$("#spin").hide();
						    	   swal("SomeThing went wrong....... try again.");
						    	     
						       },
						    	   processData:false ,
						    	   contentType:false
						   });
				})
				})
				</script>
				

</body>
</html>