package com.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import com.dao.Userdao;
import com.entities.Message;
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
public class EditProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      //fetch data to update profile details
		String userName=request.getParameter("user_name");
		String userEmail=request.getParameter("user_email");
		String userPassword=request.getParameter("user_password");
		String userAbout=request.getParameter("user_about");
	//for image
//		Part part=request.getPart("user_image");
//		String imageName=part.getSubmittedFileName();
		//get the userfrom session ''currentuser" 
		HttpSession session=request.getSession();
	   User user=	(User) session.getAttribute("currentuser");
	   user.setEmail(userEmail);
	   user.setName(userName);
	   user.setPassword(userPassword);
	   user.setAbout(userAbout);
	   String oldProfile=user.getProfile();
//	   user.setProfile(imageName);
	   //now update in database
	   Userdao usdao=new Userdao(connectionprovider.getCon())		;
	   boolean ans=  usdao.UpdateUserDetails(user);
	   response.setContentType("text/html");
	  PrintWriter out=response.getWriter();
	   if (ans=true) {
	       //to delete old profile
	    //      String Oldpath=request.getServletContext().getRealPath("/")+"profilepics"+File.separator+oldProfile;
	      //    PhotoUpdate.deleteFile(Oldpath);
//saving new
	     //     String path=request.getServletContext().getRealPath("/")+"profilepics"+File.separator+user.getProfile();
	      //  if (PhotoUpdate.saveFile(part.getInputStream(), path)) {
		        	out.println("prof updated");
		        	Message m=new Message("prof all set updated", "Success","alert-success");
		        	session.setAttribute("msg", m);
		        	 
//		        }else {
//		        	out.println("prof not updated");
//		        	Message m=new Message("mage not  updated", "Error","alert-danger");
//		        	session.setAttribute("msg", m);
//				}
	           
	}
	   else {
		   Message m=new Message("profole not updated", "Error","alert-danger");
			session.setAttribute("msg", m);
	}
	   response.sendRedirect("Profile.jsp");
		
	}

}
