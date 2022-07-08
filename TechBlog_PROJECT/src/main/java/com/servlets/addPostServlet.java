package com.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

import com.dao.Postdao;
import com.entities.Post;
import com.entities.User;
import com.helper.PhotoUpdate;
import com.helper.connectionprovider;
import com.mysql.jdbc.SocketMetadata.Helper;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
			 
        @MultipartConfig
			public class addPostServlet extends HttpServlet {
				private static final long serialVersionUID = 1L;
				protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
					response.setContentType("text/html");
					PrintWriter out=response.getWriter();
					int cid=Integer.parseInt(request.getParameter("cID"));
			        String ptitle=request.getParameter("postTitle");
			       
			        String pcontent=request.getParameter("postContent");
			        String pcode=request.getParameter("postProgram");
			        Part part=request.getPart("postPic");
			        String pic=part.getSubmittedFileName();
                      //user reference
			        HttpSession session=request.getSession();
			        User  user= (User) session.getAttribute("currentuser");
			        Post p=new Post(ptitle, pcontent, pcode, pic,null, cid, user.getId());
			       Postdao pd=new Postdao(connectionprovider.getCon());
			      if ( pd.Savepost(p)) {
			
					String pathholder=request.getRealPath("/")+"blog_pics"+File.separator+part.getSubmittedFileName();
			     PhotoUpdate.saveFile(part.getInputStream(), pathholder);
			 	out.println("done");
				   	}
			  else {
				  out.println("error");
			}
			       
			        
				}
			
			}
