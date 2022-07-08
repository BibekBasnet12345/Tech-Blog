
<%@page import="com.entities.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.helper.connectionprovider"%>
<%@page import="com.dao.Postdao"%>
			<div class="row">	
         <% 
            Thread.sleep(100);
			Postdao postdao=new Postdao(connectionprovider.getCon());
         //fetching catergory id sent by ajax
             int cid=Integer.parseInt(request.getParameter("cid"));
             List<Post> list_post=null;
             if(cid==0){
            	  list_post=postdao.getAllPost();
             }else{
         	list_post=postdao.getPostByCatID(cid); 
             }
             if(list_post.size()==0){
            	 out.println("<h3 class='display-3 text-center text-white '><b>No post avaiable in this categories</b></h3>");
            	 return;
             }
			for(Post p:list_post){
				%>
				<div class="col-md-6 mt-4">
				  <div class="card">
				  <img class="card-img-top"  src="image/images.jpg" alt="image ">
				     <div class="card-body">
				        <h4><b><%=p.getpTitle() %></b></h4>
				        <p><%=p.getpContent() %></p>    
				     </div>
				     <div class="card-footer primary-background  text-center 	">
			
				        <a href="#!" class="btn btn-outline-info btn-sm"><i class="fa fa-thumbs-o-up"></i><span>10</span></a>
				        	       <a href="morepost.jsp?post_id=<%=p.getpId() %>" class="btn btn-outline-info  btn-sm "   >Read More..</a>
				         <a href="#!" class="btn btn-outline-info btn-sm"><i class="fa fa-commenting-o"></i><span>20</span></a>
				     </div>
				  </div>
				</div>
				<%
			}
			%>
			</div>
			<!-- modal -->
		

			
		