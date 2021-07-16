package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.userDao;
import com.tech.blog.entities.User;
import com.tech.blog.entities.message;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class login_servlet
 */
@WebServlet("/login_servlet")
public class login_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		String email=request.getParameter("email");
		String pass=request.getParameter("pass");
		
		userDao u=new userDao(ConnectionProvider.getConnection());
		User udtl=u.getUser(email, pass);
		
		if(udtl==null) {
			//error in email or password
			out.println("Invalid username or password");
			message msg=new  message( "Invalid username or password", "error", "alert-danger" );
	//		RequestDispatcher rD=request.getRequestDispatcher("login.jsp");
	//		rD.include(request, response);
			HttpSession s=request.getSession();
			s.setAttribute("msg", msg);
			
			response.sendRedirect("login.jsp");
		}
		else {
			HttpSession s=request.getSession();
			s.setAttribute("currentUser", udtl);
			response.sendRedirect("details.jsp");
		}
	}

}
