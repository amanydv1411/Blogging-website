<%@page import="com.tech.blog.entities.message"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>LOGIN PAGE</title>

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
	<!-- navbar -->
	<%@include file="navbar.jsp"%>

	<main class="d-flex align-items-center back-color banner-background " style="height:80vh;">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-header text-center primary-background text-white">
							<h5><b> <span class="fa fa-user-circle fa-2x"></span> Login here</b> </h5>
						</div>
						<%
							message msg=(message)session.getAttribute("msg");
							if(msg!=null){
						%>	
						<div class="alert <%= msg.getCssClass()%>" role="alert">
							<%=msg.getContent() %>
                          <!--   Invalid username or password ,try again...-->
                          </div>
						<% 
							}
							session.removeAttribute("msg");
						%>
					  
						<div class="card-body">
							<form action="./login_servlet" method="post">
								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input
										type="email" name="email" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" placeholder="Enter email" required>
								
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										type="password" name="pass" class="form-control"
										id="exampleInputPassword1" placeholder="Password" required>
								</div>
								
								<button type="submit" class="btn btn-primary primary-background">Login</button>
							</form>
						</div>
							
					</div>
				
				</div>
			</div>
		</div>
	</main>

<!-- js -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


</body>
</html>