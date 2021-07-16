package com.tech.blog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.likeDao;
import com.tech.blog.helper.ConnectionProvider;

/**
 * Servlet implementation class liked_servlet
 */
@WebServlet("/liked_servlet")
public class liked_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public liked_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		String operation=request.getParameter("operation");
		int uid=Integer.parseInt(request.getParameter("uid"));
		int pid=Integer.parseInt(request.getParameter("pid"));
	//	out.println("data from server");
	//	out.println(operation);
	//	out.println(uid);
	//	out.println(pid);
		likeDao ld=new likeDao(ConnectionProvider.getConnection());
		boolean res=false;
		if(operation.equals("like")) {
			boolean del_if_already_liked=ld.deleteLike(pid,uid);
			
			if(!del_if_already_liked) {
				res=ld.addLike(pid, uid);
			}
			
			if(del_if_already_liked) {
				out.println("removed");
			}
			else {
				out.println(res);
			}
		}
		else if(operation.equals("deleteLike")) {
			res=ld.deleteLike(pid, uid);
		}
		else if(operation.equals("count")) {
			int cnt=ld.countLike(pid);
		}
		
	}

}
