<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="java.util.*"%>
  <%@page errorPage="error_page.jsp" %> 
  <%@page import="com.tech.blog.entities.*"%> 
  <%@page import="com.tech.blog.dao.*" %>
  <%@page import="com.tech.blog.helper.*"%>
 
    <%
	User u = (User) session.getAttribute("currentUser");
		if (u == null) {
		response.sendRedirect("login.jsp");
		}
	%>
    <%
    int postid=Integer.parseInt(request.getParameter("post_id"));
    postDao dao=new postDao(ConnectionProvider.getConnection());
    posts curr_post=dao.getPostPid(postid);
    %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%=curr_post.getTittle()%>||CS Blogs</title>

<style>

.btn-primary,
.btn-primary:active,
.btn-primary:focus {
	background-color:#00695c!important;
    border-color:  #00695c!important;
}
.btn-primary:hover {
  background-color:#80cbc4!important;
}

.card{
	border-color:#00695c!important;
	border-width:medium!important;
}

.post-tittle{
	font-weight:100;
	font-size:30px;
}
.post-content{
	font-weight:100;
	font-size:25px;
}
#post-writter{
	font-style:italic;
	font-weight:500;
	font-size:16px;
}
body{
	background-image:url('images/rdec.png');
	background-size:cover;
	background-attachment:fixed;
	background-size: 100% 100%;
}
</style>
<link rel="stylesheet" href="css/mystyle.css">
<!-- awsm icon -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- css -->
<link rel="stylesheet";
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">


</head>
<body>
<!-- navbar -->
	
<nav class="navbar navbar-expand-lg navbar-dark primary-background">
		<a class="navbar-brand" href="index.jsp">CsBlogs</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#">Home
						<span class="sr-only">(current)</span>
				</a></li>
				
				<!-- <li class="nav-item"><a class="nav-link text-light" href="#">Link</a></li> -->
				
			
					
				<li class="nav-item" data-toggle="modal" data-target="#add_post" >
					<a class="nav-link disabled text-light" href="#" >Add Post</a>
				</li>
			</ul>
			
			<ul class="navbar-nav mr-right ">
				<li class="nav-item"><a class="nav-link disabled text-light"
					href="#!" data-toggle="modal" data-target="#profileModal"> <span
						class="fa fa-user-circle"></span><B><%=u.getUsername()%></B></a></li>
				<li class="nav-item"><a class="nav-link disabled text-light"
					href="./logout"> <span class="fa fa-user-plus"></span><B>Logout</B></a>
				</li>
			</ul>
		</div>
	</nav>
	
<!-- end of navbar -->


<!-- main content of body -->
	<div class="container">
		<div class="row my-4">
			<div class="col-md-8 offset-md-2">
				<div class="card">
					<div class="card-header back-color text-dark">
						<h4 class="post-tittle"><%=curr_post.getTittle() %></h4>
					</div>
					
					<div class="card-body">
						<div class="view-overlay">
						  <%if(!curr_post.getPic().equals("")) {%>
							<img class="card-img-top" src="posts_pic/<%=curr_post.getPic()%>" alt="Card image cap" width="300" height="250">
						  <%} %>
						</div >
						<p class="post-content"><%=curr_post.getContent() %></p>
						<div class="row" id="post-writter">
							<div class="col-md-8">
								<%
									userDao das=new userDao(ConnectionProvider.getConnection());
									User curr_post_user=das.getUserByUserId(curr_post.getUserId());
								%>
								<p>Posted by: <a href="#!"> <%=curr_post_user.getUsername()%></a></p>
							</div>
							<div class="col-md-4">
								<p><%=curr_post.getPdate().toLocaleString()%>
							</div>
						</div>
					</div>
					<%
					likeDao ld=new likeDao(ConnectionProvider.getConnection());
					%>
					<div class="card-footer back-color text-dark">
						<a href="#!" onclick="doLike( <%=curr_post.getPid()%>, <%=u.getId()%>)" class="btn btn-primary btn-sm"><i class="fa fa-thumbs-o-up"></i> <span class="like-cnt"><%=ld.countLike(postid) %></span></a>
						<a href="#!" class="btn btn-primary btn-sm"><i class="fa fa-commenting-o"></i><span class="fb-comments-count" data-href="https://graph.facebook.com/v2.4/?fields=share{comment_count}&amp;id=http://localhost:8080/TechBlog/show_each_post.jsp?post_id=<%=curr_post.getPid() %>"></span></a>
						
						
						<div class="fb-share-button" data-href="http://localhost:8080/TechBlog/show_each_post.jsp?post_id=12" data-layout="button_count" data-size="large"><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=http%3A%2F%2Flocalhost%3A8080%2FTechBlog%2Fshow_each_post.jsp%3Fpost_id%3D12&amp;src=sdkpreparse" class="fa fa-share">Share</a></div>
						<div class="fb-comments" data-href="http://localhost:8080/TechBlog/show_each_post.jsp?post_id=<%=curr_post.getPid() %>" data-width="" data-numposts="5"></div>
					</div>
				</div>
				
			</div>
		</div>
	</div>


<!-- maine content end -->

<!--profile Modal -->
<div class="modal fade" id="profileModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header back-color text-center">
					<h4 class="modal-title" id="exampleModalLabel">Profile</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container text-center">
						<img src="pics/<%=u.getProfile()%>" class="img-fluid"
							style="border-radius: 50%; max-width: 150px;"> <b></b>
						<h5 class="modal-title mt-3 text-danger" id="exampleModalLabel">
							<%=u.getUsername()%></h5>
						

						<!-- details -->
						<div id="profile-details">
						<table class="table">

							<tbody>
								<tr>
									<th scope="row">Id</th>
									<td><%=u.getId()%></td>
								</tr>

								<tr>
									<th scope="row">Email-id</th>
									<td><%=u.getEmail()%></td>
								</tr>

								<tr>
									<th scope="row">Institute</th>
									<td><%=u.getInstitute()%></td>
								</tr>

								<tr>
									<th scope="row">Bio</th>
									<td><%=u.getAbout()%></td>
								</tr>

							</tbody>
						</table>
						</div>


					<!-- profile edit form-->
						<div id="profile-edit" style="display:none;">
							<h5><u>Update profile deatils</u></h5>
							<form action="./Edit_servlet" method="post" enctype="multipart/form-data">
									<table class="table">
										<tr >
											<td><b>ID:</b></td>
											<td><%=u.getId() %></td>
										</tr>
										<tr>
											<td><b>Email-Id:</b></td>
											<td><%=u.getEmail()%></td>
										</tr>
										<tr>
											<td>
												<b>Name:</b>
											</td>
											<td><input type="text" class="form-control" name="update_name" value="<%=u.getUsername()%>"></td>
										</tr>
										<tr>
											<td>
												<b>Institute:</b>
											</td>
											<td>
												<input type="text" class="form-control" name="update_inst" value="<%=u.getInstitute()%>">
											</td>
										</tr>
										
										<tr>
											<td>
												<b>Bio:</b>
											</td>
											<td> 
												<textarea rows="1" class="form-control" name="update_about"> <%=u.getAbout()%> </textarea>
											</td>
										</tr>
										
										<tr>
											<td>
												<b>Update dp:</b>
											</td>
											<td> 
												<input type="file" name="update_dp" class="form-control">
											</td>
										</tr>
										<tr>
											<td>
												<b>Password:</b>
											</td>
											<td><input type="password" class="form-control" name="update_pass" value="<%=u.getPassword()%>"></td>
										</tr>
									</table>
									<div class="container" id="save-btn" >
											<button type="submit"  class="btn-outline-success">SAVE</button>
									</div>	
							</form>
						</div>	
					</div>
				</div>
				
					
					<!-- <button type="button" id="edit-close-btn" class="btn btn-secondary"
						data-dismiss="modal">Close</button> -->
				
					<button class="btn-outline-info" type="button" id="edit-pf-btn" class="btn btn-primary">Edit profile</button>
			
			</div>
		</div>
</div>

<!-- add post modal -->
<!-- Modal -->
<div class="modal fade" id="add_post" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
    
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">ADD POST</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      
      <div class="modal-body">
        <form action="./postServlet" method="post" id="postId">
        	<div class="form-group">
        	  <%
        	   postDao post=new postDao(ConnectionProvider.getConnection());
        	   ArrayList<Category> cat=post.getCategory();
        	  %>
        	  <select class="form-control" name="cid">
        		<option selected-disabled>---Select category---</option>
        		<%
        			for(Category c : cat){ 
        		%>
        		<option value="<%=c.getCid()%>"><%=c.getName() %></option>
        		<%}%>
        	  </select>
        	</div>
        	
        	<div class="form-group">
        		<input type="text" name="pTittle" placeholder="Enter post Tittle" class="form-control" required/>
        	</div>
        	
        	<div class="form-group">
        		<textarea rows="2" name="pContent" class="form-control" placeholder="Enter your content" required></textarea>
        	</div>
        	
        	<div class="form-group">
        		<input type="file" name="pic">
        	</div>
        	
        	<div class="container">
        		<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
        		<button type="submit" class="btn btn-primary">POST</button>
      		</div>
       </form>
     </div>  
    </div>
  </div>
</div>


<!-- post modal end  -->
	<!-- js -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<!-- sweet alert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="javaScript/like.js"></script>
	
	<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v11.0" nonce="aQ6hQWK2"></script>
	
	
	<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js#xfbml=1&version=v11.0" nonce="NI07PqSS"></script>
	<!--script for edit  -->
	<script>
				let toggle_btn=false;
				$(document).ready(function(){
					$('#edit-pf-btn').click(function(){
						if(toggle_btn==false){
							$("#profile-details").hide()
							$('#profile-edit').show()
							toggle_btn=true;
							$(this).text("back")	
						}
						else{
							$('#profile-edit').hide()
							$("#profile-details").show()
							$(this).text("Edit profile")
							toggle_btn=false;
						}
					})
				});
	</script>
	
	
	<!-- script for new post form -->
	
	<script type="text/javascript">
		$(document).ready(function(e){
			
			$("#postId").on("submit",function(event){
				event.preventDefault();
				let form=new FormData(this);
			
				$.ajax({
					url:"postServlet",
					type:"post",
					data:form,
					success:function(data,textStatus,jqXHR){
						console.log(data)
						if(data.trim()=='done'){
							swal("Good job!", "posted succefully", "success");
						}
						else{
							swal("Something went wrong", "please... try again", "success");
						}
					},
					error: function(jqXHR,textStatus,errorThrown){
						swal("Something went wrong", "please... try again", "success");
					},
					processData:false,
					contentType:false,
				})
			})		
		})
	</script>

</body>

</html>