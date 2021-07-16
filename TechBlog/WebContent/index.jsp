<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="com.tech.blog.helper.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link rel="stylesheet" href="css/mystyle.css">
<style>
	.banner-background{
		clip-path: polygon(50% 0%, 100% 0, 100% 94%, 63% 99%, 23% 93%, 0 99%, 0 0);
	}
	
</style>

<!-- awsm icon -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- css -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

</head>


<body>

<!-- navbar -->
<%@include file="navbar.jsp" %>


<!-- banner -->

<div class="container-fluid p-0 m-0  banner-background">
	<div class="jumbotron back-color text-dark">
		<div class="container">		
			<h4 class="dispaley-3">Welcome to techblog</h4>
			<p> Programming is the process of creating a set of instructions that tell a computer how to perform a task. Programming can be done using a variety of computer programming languages, such as JavaScript, Python, and C++.</p>
			<a href="register_page.jsp" class="btn-outline-dark  btn-lg"><span class="fa fa-user-circle fa-spin"></span> Create a Account </a>
			<a href="login.jsp" class="btn-outline-dark btn-lg"><span class="fa fa-user-plus "></span> Login </a>
		</div>
	</div>
</div>

<!-- card -->
<div class="container">
	<div class="row mb-2">
	
		<div class="col-md-4">
			<div class="card" ">
			  
			  <div class="card-body">
			    <h5 class="card-title">Java Programming</h5>
			    <p class="card-text">  java is a programming langauage</p>
			    <a href="#" class="btn btn-primary primary-background">Read More</a>
			  </div>
			</div>
		</div>
		
		<div class="col-md-4">
			<div class="card" ">
			  
			  <div class="card-body">
			    <h5 class="card-title">Java Programming</h5>
			    <p class="card-text">  java is a programming langauage</p>
			    <a href="#" class="btn btn-primary primary-background">Read More</a>
			  </div>
			</div>
		</div>
	
		<div class="col-md-4">
			<div class="card" ">
			  
			  <div class="card-body">
			    <h5 class="card-title">Java Programming</h5>
			    <p class="card-text">  java is a programming langauage</p>
			    <a href="#" class="btn btn-primary primary-background">Read More</a>
			  </div>
			</div>
		</div>
	
	
	
	</div>

	<div class="row mb-2">
	
		<div class="col-md-4">
			<div class="card" ">
			  
			  <div class="card-body">
			    <h5 class="card-title">Java Programming</h5>
			    <p class="card-text">  java is a programming langauage</p>
			    <a href="#" class="btn btn-primary primary-background">Read More</a>
			  </div>
			</div>
		</div>
		
		<div class="col-md-4">
			<div class="card" ">
			  
			  <div class="card-body">
			    <h5 class="card-title">Java Programming</h5>
			    <p class="card-text">  java is a programming langauage</p>
			    <a href="#" class="btn btn-primary primary-background">Read More</a>
			  </div>
			</div>
		</div>
	
		<div class="col-md-4">
			<div class="card" ">
			  
			  <div class="card-body">
			    <h5 class="card-title">Java Programming</h5>
			    <p class="card-text">  java is a programming langauagejava is a programming langauage</p>
			    <a href="#" class="btn btn-primary primary-background">Read More</a>
			  </div>
			</div>
		</div>
	
	
	
	</div>



</div>

<!-- js -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>



</body>
</html>