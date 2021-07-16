package com.tech.blog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.userDao;
import com.tech.blog.entities.User;
import com.tech.blog.entities.message;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

/**
 * Servlet implementation class Edit_servlet
 */
@WebServlet("/Edit_servlet")
@MultipartConfig
public class Edit_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter out=response.getWriter();
		
		String name=request.getParameter("update_name");
		String about=request.getParameter("update_about");
		String inst=request.getParameter("update_inst");
		String pass=request.getParameter("update_pass");
		Part part=request.getPart("update_dp");
		String dp=part.getSubmittedFileName();
		
		//getting session
		HttpSession h=request.getSession();
		User user=(User)h.getAttribute("currentUser");
		user.setUsername(name);
		user.setAbout(about);
		user.setInstitute(inst);
		user.setProfile(dp);
		user.setPassword(pass);
		
		//calling dao class method to update user in db
		
		userDao dao=new userDao(ConnectionProvider.getConnection());
		boolean ans=dao.updateUser(user);
		if(ans){
			out.println("updated");
			String path=request.getRealPath("/")+"pics"+File.separator+user.getProfile();
			
			//Helper.deleteFile(path);
			if(Helper.saveFile(part.getInputStream(), path)) {
				message msg=new  message( "Profile Updated", "success", "alert-success" );
				h.setAttribute("msg", msg);
				out.print("profile updated");
			}
		}
		else{
			message msg=new  message( "something went wrong....", "error", "alert-danger" );
			HttpSession s=request.getSession();
			s.setAttribute("msg", msg);
			out.print("not updated");
		}
		response.sendRedirect("details.jsp");
	}

}
