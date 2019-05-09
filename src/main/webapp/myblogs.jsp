<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import ="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
<%@ page import ="java.util.Collections"%>
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
<body>
<% if(session.getAttribute("username") == null){
	 String site = new String("./login.jsp");
     response.setStatus(response.SC_MOVED_TEMPORARILY);
     response.setHeader("Location", site); 
	}
%> 
<%@include file="navigation_bars/user-nav.html" %>
<% 
	List<BlogEntry> blogPostEntries = new ArrayList<BlogEntry>();
	blogPostEntries = (ArrayList)session.getAttribute("userPosts");
	
	if(blogPostEntries!=null){
		Collections.reverse(blogPostEntries);
		for(BlogEntry blogPostEntry : blogPostEntries){
%>
    <div class="container mt-3 mb-3">
	    <div class="row mb-3">
		    <div class="col">
		    	<div class="card">
			        <div class="card-header">
			          <p class="h4"><%= blogPostEntry.getTitle() %> </p>
			        </div>
			        <div class="card-body mh-100">
			          <blockquote class="blockquote mb-0">
			          	<p><%= blogPostEntry.getContent() %> </p>
			          </blockquote>
			        </div>
		      </div>
			    <div class="text-right">
			    	<button type="button" onclick="window.location.href='myblog.jsp'" class="btn btn-success">Edit</button> <button type="button" class="btn btn-danger">Delete</button>
			    </div>
		    </div>
	    </div>
    </div>
<%}} %>
</body>
</html>