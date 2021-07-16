package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.*;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;



/**
 * Servlet implementation class register_servlet
 */
@MultipartConfig
@WebServlet("/register_servlet")
public class register_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//	response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		if(request.getParameter("check")==null) {
			out.print("please check the terms and conditions");
		}
		
		//check the email 
		////
		///
		///
		///
		else {
			String uname=request.getParameter("uname");
			String email=request.getParameter("email");
			String inst=request.getParameter("inst");
			String pass=request.getParameter("password");
			String about=request.getParameter("about");
			User person=new User(uname,email,inst,about,pass);
			
			userDao u=new userDao(ConnectionProvider.getConnection());
			int a;
			
			if(about.equals(""))
				a=u.addUser(person);
			else{
				a=u.addUserAbt(person);
			}
			
			
			if(a>0) {
				out.print("Successfull");
			}
			else {
				out.print("unsuccesfull");
			}
		}
	}

}
