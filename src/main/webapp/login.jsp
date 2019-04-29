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
</head>
<body>
	<div class="container-fluid">

		<nav class="navbar navbar-expand navbar-dark bg-dark">
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="#">Home</a></li>
			</ul>
		</div>
		</nav>

		<form>
			<div class="form-row">
				<div class="col-md-2 mb-3">
					<input class="form-control" name="username" type="text"
						placeholder="Username">
				</div>
			</div>
			<div class="form-row">
				<div class="col-md-2 mb-3">
					<input class="form-control" name="password" type="password"
						placeholder="Password">
				</div>
			</div>
			<div class="form-row">
				<div class="col-md-2 mb-3">
					<input class="btn btn-dark btn-sm btn-block" type="submit"
						value="Login">
				</div>
			</div>
		</form>

	</div>

</body>
</html>