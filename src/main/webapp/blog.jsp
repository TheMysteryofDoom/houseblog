<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import ="com.grimreapers.blog.model.BlogEntry"%>
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
<body class="background-image">
	<!-- navigation bar included here -->
	<!-- check session to show if user is logged in or not -->
	
	<% if(session.getAttribute("username") == null){ %>
		<%@include file="navigation_bars/guest-nav.html" %>
	<% } else { %>
		<%@include file="navigation_bars/user-nav.html" %>
	<% } %>
	
	<%
	if(session.getAttribute("viewSingleEntry") !=null){
		BlogEntry blogEntry = (BlogEntry)session.getAttribute("viewSingleEntry");
		String currentblogowner = session.getAttribute("currentblogowner").toString();
	%>
	<div class="container p-3">
		<div class="row mt-2">
			<div class="col-12">
				<p class="h1"><%= blogEntry.getTitle() %></p>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<p>By: <%= blogEntry.getAuthor() %></p>
			</div>
		</div>
		<div class="row p-3" style="border: 1px solid #000; background-color: white;">
			<div class="col-12">
				<p class="text-justify"><%= blogEntry.getContent() %></div>
		</div>
	</div>
<% } %>
</body>
</html>