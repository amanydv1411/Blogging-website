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

import com.tech.blog.dao.postDao;
import com.tech.blog.entities.User;
import com.tech.blog.entities.posts;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

/**
 * Servlet implementation class postServlet
 */
@WebServlet("/postServlet")
@MultipartConfig
public class postServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out=response.getWriter();
		
		int post_cat_id=Integer.valueOf(request.getParameter("cid"));
		String post_tittle=request.getParameter("pTittle");
		String post_content=request.getParameter("pContent");
		
		Part part=request.getPart("pic");
		String pic=part.getSubmittedFileName();
		
		HttpSession s=request.getSession(false);
		User u=(User)s.getAttribute("currentUser");
		int postUserId=u.getId();
		
		posts p=new posts(post_tittle , post_content, pic , post_cat_id , postUserId);
		
		postDao p_Dao=new postDao(ConnectionProvider.getConnection());
		boolean a=p_Dao.addPost(p);
		if(a) {
			
			out.print("done");
			String loc=request.getRealPath("/") + "posts_pic" + File.separator + part.getSubmittedFileName();
			
			Helper.saveFile(part.getInputStream(), loc);
		}
		else {
			out.print("Something went wrong");
		}
	}

}
