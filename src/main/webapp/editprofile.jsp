<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Blog</title>
	<link rel="stylesheet"
		href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
		integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
		crossorigin="anonymous">
	
	<link rel="stylesheet" type="text/css" href="style.css">

</head>
<body>
<% if(session.getAttribute("username") == null){
	 String site = new String("./login.jsp");
     response.setStatus(response.SC_MOVED_TEMPORARILY);
     response.setHeader("Location", site); 
	}
%> 

<%@include file="navigation_bars/user-nav.html" %>

	<div class="container" style="height: 90%;">
		<div class="row h-100 justify-content-center align-items-center">
			<form class="col-4" method="post" action="/editprofile">
				<div class="form-row">
					<p class="h4"><b>&nbsp;Edit Profile</b></p>
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
							value="Save Profile">
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>
