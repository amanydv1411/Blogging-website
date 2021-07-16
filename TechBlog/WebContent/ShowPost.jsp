<%@page import="com.tech.blog.entities.*"%>
<%@page import="java.util.*"%>
<%@page import="com.tech.blog.helper.*"%>
<%@page import="com.tech.blog.dao.*" %>

<%
	User u = (User) session.getAttribute("currentUser");
		if (u == null) {
		response.sendRedirect("login.jsp");
		}
	%>
    
<html>
<head>
<link rel="stylesheet" href="css/mystyle.css">
<style>

.btn-primary,
.btn-primary:active,
.btn-primary:focus {
	background-color:#80cbc4!important;
    border-color:  #00695c!important;
}
.btn-primary:hover {
  background-color: #00695c!important;
}

.card-text {
   overflow: hidden;
   text-overflow: ellipsis;
   display: -webkit-box;
   -webkit-line-clamp: 6; /* number of lines to show */
   -webkit-box-orient: vertical;
}

.card{
	border-color:#00695c!important;
	border-width:medium!important;
}
body{
	background-image:url('images/rdec.png');
	
	background-attachment:fixed;
	background-size: 100% 100%;
}
</style>
</head>
<body>
	<div class="row">
	<%
		postDao d=new postDao(ConnectionProvider.getConnection());
		int cid=Integer.parseInt(request.getParameter("cid"));
		ArrayList<posts> pst=null;
		if(cid==0)
			pst=d.getposts();
		else{
			pst=d.getpostsCid(cid);
		}
		if(pst.size()==0){
			%>
			<h3 style= "background-color:#80cbc4"; color:#00695c;"> No posts to show....</h3>
			<%
		}
		for(posts p:pst){
	%>
		<div class="col-md-6 mt-2 ">
			<div class="card ">
				<div class="view-overlay">
					<%if(!p.getPic().equals("")) {%>
						<img class="card-img-top" src="posts_pic/<%=p.getPic()%>" alt="Card image cap" width="300" height="150">
					<%} %>
					</div>
					
				<div class="card-body " style="height: 14rem;">
					<h5 class="card-tittle"><%=p.getTittle() %></h5>
					<p class="card-text"><%=p.getContent() %></p>
				</div>
				<%
				likeDao ld=new likeDao(ConnectionProvider.getConnection());
				%>
				<div class="card-footer ">
					<!--<a href="#!" onclick="doLike(<%=p.getPid()%>,<%=u.getId()%>)" class="btn btn-primary btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-cnt"><%=ld.countLike(p.getPid()) %></span></a> -->
					<i class="fa fa-thumbs-o-up"></i><span class="like-cnt"><%=ld.countLike(p.getPid()) %></span>
					
					<a href="show_each_post.jsp?post_id=<%=p.getPid()%>" class="btn btn-primary btn-sm"> Read more..</a>
					<!--  	<a href="#!" class="btn btn-primary btn-sm"><i class="fa fa-commenting-o"></i><span>20</span></a> -->
				</div>
			</div>
			
		
		</div>
		
	<%
		}
	%>
</div>
<script src="javaScript/like.js"></script>
</body>
</html>