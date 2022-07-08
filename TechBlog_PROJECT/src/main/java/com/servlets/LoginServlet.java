package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import com.dao.Userdao;
import com.entities.Message;
import com.entities.User;
import com.helper.connectionprovider;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("user_email");
		String password=request.getParameter("user_password");
		Userdao userdao=new Userdao(connectionprovider.getCon());
	    User u=	userdao.getUserByEmailAndPassword(email, password);
	    response.setContentType("text/html");
    	 PrintWriter out=response.getWriter();
		 if (u==null) {	
			//login error
			Message msg=new Message("Invalid Details! Try with another","error","alert-danger");
			HttpSession session=request.getSession();
			session.setAttribute("msg", msg);
			response.sendRedirect("Login.jsp");		
		}
		else {
			//login success
			HttpSession session=request.getSession();
			session.setAttribute("currentuser",u);
			response.sendRedirect("Profile.jsp");
		}
	}

}
