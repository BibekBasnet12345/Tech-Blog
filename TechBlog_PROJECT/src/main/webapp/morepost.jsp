<%@page import="com.dao.Userdao"%>
<%@page import="com.helper.connectionprovider"%>
<%@page import="com.dao.Postdao"%>
<%@page import="com.entities.Post"%>
<%@page import="com.entities.User"%>
 <%@page errorPage="error_page.jsp" %>
      <%@page import="com.entities.Categories"%>
<%@page import="java.util.ArrayList"%>
<%
        User us=(User)session.getAttribute("currentuser");
          if(us==null){
    	   response.sendRedirect("Login.jsp");
       }
        %>
             <%
             int postId=Integer.parseInt(request.getParameter("post_id"));
             Postdao pd=new Postdao(connectionprovider.getCon());
             Post post=pd.getPostbyIdPost(postId);
             
             %>				
				<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
				    pageEncoding="ISO-8859-1"%>
				<!DOCTYPE html>
				<html>
				<head>
				<meta charset="ISO-8859-1">
				<title><%=post.getpTitle()%></title>
				  <%@include file="CDN/linkof_css_js.jsp" %>
				  <style>
				  body{
				  background:url(image/back.jpg);
				  background-size:cover;
				  background-attachment:fixed;	
				 
				  
				  }
				  .post_title{
				  font-weight:100;
				  font-size:30px;
				  color:white;
				  }
				    .post_content{
				  font-weight:100;
				  font-size:25px;
				
				  }
				  .card-body-background{
				  background:#f2f2f2;
				  }
				  .row-user{
				  border:1px solid #e2e2e2;
				  padding-top:15px;
				  }
				  
				  </style>
				</head>
				<body>
				<!-- navabar -->

<nav id="nav" class=" navbar navbar-expand-lg navbar-light primary-background ">
<span class="fa fa-home fa-2x"></span><h5>TechBlog</h5> &nbsp;&nbsp;
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="Profile.jsp"><span class="fa fa-heart-o"></span>Bi_dha </a>
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
       <li class="nav-item">
        <a  data-toggle="modal"  data-target="#Post-modal"  class="nav-link" href="#"><span class="fa fa-plus-circle"></span> DoPost</a>
      </li>
      
    
    </ul>
	    <ul class="navbar-nav mr-right">
	    <li class="nav-item">
        <a class="btn btn-outline-info  " data-toggle="modal" data-target="#Profile-Modal" ><span class="fa fa-user-circle "></span> &nbsp;<%=us.getName() %></a>
      </li>
	    <li class="nav-item">
        <a class="nav-link" href="LogoutServlet"><span class="fa fa-sign-out "></span>&nbsp;Log Out</a>
      </li>
	    
	    </ul>
  </div>
</nav>
<!--end of  navabar -->

          <!-- main content -->
        <div class="container">
           <div class="row my-4 ">
               <div class="col-md-8 offset-md-2  " >	
               			<div class="card-header bg-info text-center">
               			    <h4 class="post_title"><%=post.getpTitle() %></h4>
               			</div>
               			<div class="card-body card-body-background">
               			<img  class="card-img-top my-2"alt="" src="image/images.jpg">
               			<br>
               			<div class="row my-3 row-user">
               			      <div class="col-md-8">
               			      <%
               			      Userdao usdao=new Userdao(connectionprovider.getCon());
               			      User user=usdao.getUserbyUserID(post.getUserID());
               			   
               			      %>
               			      <p style="font-size:20px; font-weight:150;"><a href="#"><%=user.getName() %></a>  has Posted:</p>
               			      </div>
               			      <div class="col-md-4">
               			      <p><b><i><%=post.getpDate().toLocaleString() %></i></b></p>
               			      </div>
               			</div>
               			<p class="post_content"><%=post.getpContent() %></p>
               			<br><br>
               		   			<div class="post_code">
               							  <pre><%=post.getpCode() %></pre>
               					</div>
               			</div>
               			 <div class="card-footer bg-info text-center 	">
			
				        <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span>10</span></a>
				   
				         <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span>20</span></a>
				     </div>
               </div>
           </div>
        </div>  
             <!--  end of main content -->
<!--profile modal -->
<div class="modal fade" id="Profile-Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header bg-info text-white  text-center">
        <h5 class="modal-title display-4" id="exampleModalLabel">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;TECH BLOG</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body primary-background">
        <div class="container text-center ">
       <img alt="" src="profilepics/<%=us.getProfile() %>" width="150" height="150" class="img-fluid"  style="border-radius:45%">
        <h5 class="text-info display-4"><%=us.getName() %></h5>
        <!-- //profile details-->
        <div id="profile-details">
        <table class="table">
 
			  <tbody>
			    <tr>
			      <th scope="row">ID:</th>
			      <td><%=us.getId() %></td>
			    </tr>
			    <tr>
			      <th scope="row">Email:</th>
			      <td><%=us.getEmail() %></td>
			    </tr>
			    <tr>
			      <th scope="row">Gender:</th>
			      <td><%=us.getGender().toUpperCase() %></td>
			    </tr>
			     <tr>
			      <th scope="row">Registered On:</th>
			      <td><%=us.getDateTime().toString()%></td>
			    </tr>
			      <tr>
			      <th scope="row">About:</th>
			      <td><%=us.getAbout()%></td>
			    </tr>
			  </tbody>
</table>
    </div>
    <!-- profile edit -->
    		<div id="profile-edit" style="display:none;">
    		<h3 class="text-warning mt-2">Please edit carefully!!</h3>
    		<form action="EditProfileServlet"  method="post"  enctype="multipart/form-data">
    				 <table  class="table">
    				     <tr>
				    		  <th scope="row">ID:</th>
				  		 	   <td><%=us.getId() %></td>
			   			 </tr>
			   			  <tr>
				    		  <th scope="row">Name:</th>
				  		 	   <td><input autocomplete="off" type="text"  class="form-control" name="user_name" value=<%=us.getName() %>></td>
			   			 </tr>
			   			 <tr>
				    		  <th scope="row">Email:</th>
				  		 	   <td><input autocomplete="off" type="email"  class="form-control" name="user_email" value=<%=us.getEmail() %>></td>
			   			 </tr>
			   			  <tr>
				    		  <th scope="row">Password:</th>
				  		 	   <td><input autocomplete="off" type="password"  class="form-control" name="user_password" value=<%=us.getPassword() %>></td>
			   			 </tr>
			   			   <tr>
				    		  <th scope="row">Gender:</th>
				  		 	   <td><%=us.getGender().toUpperCase() %></td>
			   			 </tr>
			   			<!--  for image
			   			   <tr>
				    		  <th scope="row">New Profile:</th>
				  		 	   <td><input type="file" name="user_image"class="form-control"></td>
			   			 </tr>
			   			  -->
			   			  <tr>
				    		  <th scope="row">About:</th>
				  		 	   <td><textarea  name="user_about" rows="2" cols="7" class="form-control"> <%=us.getAbout() %></textarea>
				  		 	   </td>
			   			 </tr>
    				</table>
    			    	<div class="container">
    					 <button  type="submit"  class="btn btn-outline-success" >Update</button>
			   			</div>
    		</form>
    		</div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        <button  id="edit-profile-btn"  type="button" class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
</div>
<!--end of profile  modal -->

<!--start of post  modal -->

<!-- Modal -->
<div class="modal fade" id="Post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5  class="modal-title  display-5" id="exampleModalLabel">Provide the Post details...</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       			<form  id="formpost"  action="addPostServlet" method="post" enctype="multipart/form-data" >
       			<div class="form-group">
       			 	<select class="form-control" name="cID">
			       			<option selected disabled>---------Select Categories-------</option>
			       			<%
			       			Postdao pdao=new Postdao(connectionprovider.getCon() );
			       			ArrayList<Categories> list=pdao.getALLCategories();
			       			for(Categories c:list){
			       			%>
			       			<option value="<%=c.getCid()%>"><%=c.getcName()%></option> 
			       			<%} %>
       			</select>
       			</div>
       			
       			<div class="form-group">
       			<input  name="postTitle" type="text" placeholder="Enter post Title" class="form-control"/>
       			</div>
       			<div class="form-group">
       			<textarea    name="postContent" placeholder="Enter your Content"  style="height:150px " class="form-control"></textarea>
       			</div>  
       			<div class="form-group">
       			<textarea    name="postProgram" placeholder="Enter your Program(if any)"  style="height:150px "  class="form-control"></textarea>
       			</div>
       			<div class="form-group">
       			Select your Pic:<br>
       			<input  name="postPic" type="file"  class="form-control"/>
       			</div>
       			<div class="container text-center " >
       			<button type="submit"  name="submit" class="btn btn-outline-info ">Post</button>
       			</div>
       			</form>
      </div>
      
    </div>
  </div>
</div>
<!--end  of post  modal -->
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
						<!-- now for post blog js -->
						<script >
						   $(document).ready(function(e){
							   <!-- after this document got ready -->
							   $("#formpost") . on("submit",  function(event){
								   <!-- after this form with post id ready after submitting-->
								   event.preventDefault();
								 
								   let form=new FormData(this);
								  <!-- //now requestiong to server by ajax-->
								  $.ajax({
									   url:    "addPostServlet" ,
									   type:'POST',
								       data: form	,
								       success: function (	data,textStatus,jqHXR) {
								  //success
								     console.log(data);
								  
									  swal({
										  title: "Greatjob!",
										  text: "Your BLOG saved successfully ",
										  icon: "success",
										  successMode: true,
										})
										.then((value) => {
										window.location="Profile.jsp"; 
										});
								       }, 
								       error: function (jqHXR,textStatus,errorThrown) {
								        //error
								    	   swal({
												  title: "Error!!",
												  text: "Something went wrong.Try again.........",
												  icon: "error",
												  button: "try again",
												});
								       },
								    	   processData:false ,
								    	   contentType:false
								   });
							   })
						   })
						</script>
						<!-- end for post blog js -->
						
						<!--  start of loading post using ajax-->
						<script >
						<!--  function getpost-->
						function getposts(catId,temp){
							$('#loader_post').show();
							$('#post_division').hide();
							$(".c-link").removeClass('bg-secondary text-light')
							 $.ajax({
					    			url:"showpost.jsp",
					    			data:{cid:catId},
					    		  success:function(data,textStatus,jqXHR)
					    		  {
					    			console.log(data);  
					    			$('#loader_post').hide();
					    			$('#post_division').show();
					    			$('#post_division').html(data)
					    			$(temp).addClass('bg-secondary text-light')
					    		  }
					    })
							$(temp).addClass('bg-secondary text-info')
						}
						  $(document).ready(function(e){
								let allpost=$('.c-link')[0]
							    getposts(0,allpost);
						  })
						</script>
							<!-- end of loading postusing ajax-->
</html>
				</html>