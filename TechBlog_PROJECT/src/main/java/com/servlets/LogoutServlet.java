package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.persistence.metamodel.SetAttribute;

import org.hibernate.Session;

import com.entities.Message;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
						response.setContentType("text/html");
						PrintWriter out=response.getWriter();
						HttpSession s=request.getSession();
						s.removeAttribute("currentuser");
						Message m=new Message("Logout Successfully!!!","success","bg-success text-white");
						s.setAttribute("msg", m);
						response.sendRedirect("Login.jsp");
	}

}
