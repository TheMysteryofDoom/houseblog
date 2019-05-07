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

    <div class="container mt-3 mb-3">
	    <div class="row mb-3">
		    <div class="col">
		    	<div class="card">
			        <div class="card-header">
			          Title
			        </div>
			        <div class="card-body mh-100">
			          <blockquote class="blockquote mb-0">
			            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ullamcorper eget nulla facilisi etiam dignissim. Quam lacus suspendisse faucibus interdum posuere lorem ipsum. Et ultrices neque ornare aenean euismod elementum. Suspendisse in est ante in. Vitae tempus quam pellentesque nec nam aliquam. Egestas maecenas pharetra convallis posuere morbi leo urna molestie at. In est ante in nibh mauris. Massa massa ultricies mi quis hendrerit dolor magna eget est. Faucibus pulvinar elementum integer enim. Odio tempor orci dapibus ultrices in iaculis. Ut consequat semper viverra nam libero. Malesuada fames ac turpis egestas integer eget aliquet nibh. Suspendisse ultrices gravida dictum fusce. Ante in nibh mauris cursus mattis molestie a iaculis.</p>
			          </blockquote>
			        </div>
		      </div>
			    <div class="text-right">
			    	<button type="button" onclick="window.location.href='myblog.jsp'" class="btn btn-success">Edit</button> <button type="button" class="btn btn-danger">Delete</button>
			    </div>
		    </div>
	    </div>
    </div>

</body>
</html>