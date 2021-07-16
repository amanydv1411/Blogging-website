<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page isErrorPage="true"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sorry ! something went wrong</title>

<link rel="stylesheet" href="css/mystyle.css">

<!-- css -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<style>
.banner-background {
	clip-path: polygon(50% 0%, 100% 0, 100% 94%, 63% 99%, 23% 93%, 0 99%, 0 0);
	}
</style>

</head>

<body>
<div class="container text-center">
	<img src="images/blue-screen.svg" class="img-fluid">
	<h2 class="display-5">Sorry! Something went wrong....</h2>
	<%=exception %>
	<a href="index.jsp" class="btn back-color btn-lg text-dark mt-2">Home</a>
</div>


</body>
</html>