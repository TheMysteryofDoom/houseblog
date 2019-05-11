<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register</title>
	<link rel="stylesheet"
		href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
		integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
		crossorigin="anonymous">

	<link rel="stylesheet" type="text/css" href="style.css">

</head>
<body class="background-image">
	<% if(session.getAttribute("username") != null){
		 String site = new String("./homepage.jsp");
	     response.setStatus(response.SC_MOVED_TEMPORARILY);
	     response.setHeader("Location", site);
		}
	%>
	
	<!-- navigation bar included here -->
	<%@include file="navigation_bars/login-signup-nav.html" %>

	<div class="container" style="height: 90%;">
	<% if(session.getAttribute("error")!=null){ %> <!-- Checks if error (passwords do not match) exists -->
			<div class="row h-100 justify-content-center align-items-center">
			<form class="col-4" method="post" action="/signup">
				<div class="form-row">
					<p class="h4"><b>&nbsp;Register to Blogsite</b></p>
				</div>
				<div class="form-row">
				<!-- Checking if empty username field -->
					<% if (session.getAttribute("username") == null) { %>
						<div class="col-12 mb-3">
							<input class="form-control" name="username" type="text"
								placeholder="Username" style="border-color:red">
							<p class="font-size-sm " style="color:red"> &nbsp;Please enter username. </p>
						</div>
					<% } else { %> 
						<div class="col-12 mb-3">
							<input class="form-control" name="username" type="text"
							placeholder="Username">
						</div>
					<% } %>
				</div>
				<div class="form-row">
				<!-- Checking if empty password field -->
					<% if (session.getAttribute("password") == null) { %>
						<div class="col-12 mb-3">
							<input class="form-control" name="password" type="password"
								placeholder="Password" style="border-color:red">
							<p class="font-size-sm " style="color:red"> &nbsp;Please enter password. </p>
						</div>
					<% } else { %> 
						<div class="col-12 mb-3">
							<input class="form-control" name="password" type="text"
							placeholder="Password">
						</div>
					<% } %>
				</div>
				<div class="form-row">
				<!-- Checking if Repeat Password matches Password field -->
					<% if (session.getAttribute("password") == null) { %>
						<div class="col-12 mb-3">
							<input class="form-control" name="repeatpassword" type="password"
								placeholder="Repeat Password" style="border-color:red">
							<p class="font-size-sm " style="color:red"> &nbsp;Passwords do not match. </p>
						</div>
					<% } else { %> 
						<div class="col-12 mb-3">
							<input class="form-control" name="repeatpassword" type="password"
							placeholder="Repeat Password">
						</div>
					<% } %>
				</div>
				<div class="form-row">
					<div class="col-12 mb-3">
						<input class="btn btn-dark btn-sm btn-block" type="submit"
							value="Register">
					</div>
				</div>
			</form>
		</div>
	<% } else { %>
	<div class="row h-100 justify-content-center align-items-center">
			<form class="col-4" method="post" action="/signup">
				<div class="form-row">
					<p class="h4"><b>&nbsp;Register to Blogsite</b></p>
				</div>
				<div class="form-row">
					<div class="col-12 mb-3">
						<input class="form-control" name="username" type="text"
							placeholder="Username">
					</div>
				</div>
				<div class="form-row">
					<div class="col-12 mb-3">
						<input class="form-control" name="password" type="password"
							placeholder="Password">
					</div>
				</div>
				<div class="form-row">
					<div class="col-12 mb-3">
						<input class="form-control" name="repeatpassword" type="password"
							placeholder="Repeat Password">
					</div>
				</div>
				<div class="form-row">
					<div class="col-12 mb-3">
						<input class="btn btn-dark btn-sm btn-block" type="submit"
							value="Register">
					</div>
				</div>
			</form>
		</div>
	<% }%>
		
	</div>

</body>
</html>
