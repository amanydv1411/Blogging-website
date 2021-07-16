<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register page</title>
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
	
	
	<main class="d-flex align-items-center back-color banner-background " style="height:92vh;">
		<div class="container">
			
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-header text-center primary-background text-white">
							<p><b> <span class="fa fa-user-plus fa-2x"></span> Register here</b> </p>
						</div>

						<div class="card-body">
							<form id="reg-form" action="./register_servlet" method="post"> 
								<div class="form-group">
									<label for="user_name">Username</label> <input
										type="text" name="uname" class="form-control" id="uname"
										aria-describedby="emailHelp" placeholder="Enter username" required>	
								</div>
								
								<div class="form-group">
									<label for="exampleInputEmail1">Institute</label> <input
										type="text" name="inst" class="form-control" id="institute"
										aria-describedby="emailHelp" placeholder="Enter Institute">	
								</div>
								
								<div class="form-group">
									<label for="exampleInputEmail1">Email address</label> <input
										type="email" name="email" class="form-control" id="exampleInputEmail1"
										aria-describedby="emailHelp" placeholder="Enter email" required>
								
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1">Password</label> <input
										type="password" name="password" class="form-control"
										id="exampleInputPassword1" placeholder="Password" required>
								</div>
								<div class="form-check">
									<input type="checkbox" name="check" class="form-check-input"
										id="exampleCheck1" required> <label class="form-check-label"
										for="exampleCheck1">agree terms and conditions</label>
								</div>
								<div>
									<textarea name="about" class="form-control" cols="30" row="1" placeholder="enter about yourself"></textarea>
								</div>
								<div id="spinner" class="container text-center" style="display:none;">
									<span class="fa fa-circle-o-notch fa-2x fa-spin"></span>
									<h3>please wait....</h3>
								</div>
								<button	id="sbtn" type="submit" class="btn btn-primary primary-background ">Submit</button>
							</form>
						</div>
							
					</div>
				
				</div>
			</div>
	</main>
	


<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
 <!-- sweet alert -->
 <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> 
 
<script type="text/javascript">
$(document).ready(function(){
	console.log("loaded.....")
	
	$('#reg-form').on('submit',function(event){
		event.preventDefault();
		
		 var form=$('#reg-form');
		 $('#sbtn').hide();
		 $('#spinner').show();
		 
		 //send to registerservlet
		 $.ajax({
			url:"register_servlet",
			type: 'POST',
			data: form.serialize(),
			
			success :function(data,textStatus,jqXHR){
				
				 $('#sbtn').show();
				 $('#spinner').hide();
				 console.log(data)
				 
				 if(data.trim()==='Successfull'){
				 swal("registered sucessfully,redirecting to login page....")
				 	.then((value) => {
				   		window.location="login.jsp"
				 	});
				 }
				 else{
					 swal(data);
				 }
				 
			},
			error:function(jqXHR,textStatus,errorThrown){
				$('#sbtn').show();
				 $('#spinner').hide();
				console.log(jqXHR)
				
				swal("something went wrong....try again");
				
			},
			 
			processData:false,
			processData:false
		 });
		
	});
});
</script>
  
</body>
</html>