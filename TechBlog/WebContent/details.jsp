<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@page import="java.util.*"%>	
<%@page import="com.tech.blog.entities.*"%>
<%@page import="com.tech.blog.helper.*" %>
<%@page import="com.tech.blog.dao.*" %>

<%@page errorPage="error_page.jsp"%>

<%
User u = (User) session.getAttribute("currentUser");
if (u == null) {
	response.sendRedirect("login.jsp");
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>user details</title>


<link rel="stylesheet" href="css/mystyle.css">
<style>
.banner-background {
	clip-path: polygon(50% 0%, 100% 0, 100% 94%, 63% 99%, 23% 93%, 0 99%, 0 0);
}

</style>

<!-- awsm icon -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- css -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">


</head>
<body>


	<% postDao pst=new postDao(ConnectionProvider.getConnection());
	  ArrayList<Category> lst=pst.getCategory(); %>
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
				
				<li class="nav-item dropdown ">
				
					<a	class="nav-link dropdown-toggle text-light" href="#" id="navbarDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> Categories 
					</a>
				
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<% 
						  for(Category ctg: lst){
						 %>
					  	 <a href="#" onclick="getPosts(<%=ctg.getCid()%>,this)"class="c-link list-group-item list-group-item-action"><%=ctg.getName() %></a>
  						 <%} %>	
  						 
					<!-- 	<a class="dropdown-item" href="#">Languages</a> 
						<a class="dropdown-item" href="#">DSA</a>
						<a class="dropdown-item" href="#">Development</a> 
						<a class="dropdown-item" href="#">Subjects</a> -->
						
					</div>
				</li>
					
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

						<%
							message msg=(message)session.getAttribute("msg");
							if(msg!=null){
						%>
						
						<div class="alert <%= msg.getCssClass()%>" role="alert">
							<%=msg.getContent() %>
                          </div>
						<% 
							}
							session.removeAttribute("msg");
                          
						%>
						
	<!-- main body -->
		<main>
			<div class="container">
				<div class="row mt-4">
					<div class="col-md-4">
					
					  <div class="list-group">
					  	 <a href="#" onclick="getPosts(0,this)" class="c-link list-group-item list-group-item-action active ">All posts</a>
					  	 
					  	 <% 
						  for(Category ctg: lst){
						 %>
					  	 <a href="#" onclick="getPosts(<%=ctg.getCid()%>,this)"class="c-link list-group-item list-group-item-action"><%=ctg.getName() %></a>
  						 <%} %>	
					  </div>
					 								
					</div>
					
					<div class="col-md-8">
						<!-- loader -->
						<div class="container text-center" id="loader">
							<i class="fa fa-refresh fa-spin fa-3x "></i>
							<h4 class="mt-2">Loading...</h4>
						</div>
						<!-- posts -->
						<div class="container-fluid" id="showpost">
							
						</div>
					</div>
				</div>
			</div>
		</main>
	
	<!-- end of main body -->

<!-- 
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  Launch demo modal
</button>
 -->

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
	
	<script>
	function getPosts(catid,temp){
		$("#loader").show(),
		$(".c-link").removeClass("active"),
		$.ajax({
			url:"ShowPost.jsp",
			data:{cid:catid},
			success:function(data,textStatus,jqXHR){
				$(temp).addClass('active'),
				$("#loader").hide();
				$("#showpost").html(data)
			}
		})
	}
	$(document).ready(function(e){
		let allPostRef=$(".c-link")[0]
		getPosts(0,allPostRef);
	})
	
	
	</script>

</body>
</html>