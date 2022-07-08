package com.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import org.hibernate.Session;
import org.hibernate.query.NativeQuery;

import com.dao.Userdao;
import com.entities.User;
import com.helper.connectionprovider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

/**
 * Servlet implementation class RegisterServlet
 */
@MultipartConfig
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
              public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException,ServletException{
    	           response.setContentType("text/html;charset=UTF-8");
    	           PrintWriter out=response.getWriter();
    	           try {
					
					//fetch all data from Register.jsp
					String check=request.getParameter("check");
					if (check==null) {
						out.println("Box not checked");
					}else {
						String name=request.getParameter("user_name");
						String email=request.getParameter("user_email");
						String password=request.getParameter("user_password");
						String gender=request.getParameter("gender");
						String about=request.getParameter("user_about");
						//for image 
//					    Part part=request.getPart("user_image");
//					       String path=request.getServletContext().getRealPath("/")+"profilepics"+File.separator+part.getSubmittedFileName();
//					       System.out.println(path);

						//create user object and set all these details
				
						
						User user=new User(name, email, password, gender, about);
						//create userdao object to insert
			    		Userdao dao=new Userdao(connectionprovider.getCon());
					
						if (	dao.saveuser(user)) {
							//save..the details
							out.println("saved");
						}else {
							out.println("error");
						}			
						}
				response.sendRedirect("Login.jsp");
					
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
             }

}
