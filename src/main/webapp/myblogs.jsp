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
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
</head>
<body class="background-image">
<% if(session.getAttribute("username") == null){
	 String site = new String("./login.jsp");
     response.setStatus(response.SC_MOVED_TEMPORARILY);
     response.setHeader("Location", site); 
	}
%> 
<%@include file="navigation_bars/user-nav.html" %>
<% 
	if(session.getAttribute("username") != null){
		List<BlogEntry> blogPostEntries = new ArrayList<BlogEntry>();
		blogPostEntries = (ArrayList)session.getAttribute("userPosts");
		String currentblogowner = session.getAttribute("currentblogowner").toString();

	int ctr = 0;
	
	if(blogPostEntries!=null){
		Collections.reverse(blogPostEntries);
		for(BlogEntry blogPostEntry : blogPostEntries){
%>
    <div class="container mt-3 mb-3">
	    <div class="row mb-3">
		    <div class="col">
		    	<div class="card" id="<%= ctr%>">
			        <div class="card-header">
			          <p class="h4"><%= blogPostEntry.getTitle() %> </p>
			        </div>
			        <div class="card-body mh-100">
			          <blockquote class="blockquote mb-0">
			          	<p class="ellipsis"><%= blogPostEntry.getContent() %> </p>
			          </blockquote>
			          <a href="/myblog/<%=blogPostEntry.getAuthor()%>/<%=blogPostEntry.getBlogpathvar()%>" class="stretched-link"></a>
			        </div>
		      </div>
			    <div class="text-right">
			    	<button id="editbutton" type="button" onclick="window.location.href='/myblog/<%=currentblogowner%>/<%=blogPostEntry.getBlogpathvar()%>/edit'" class="btn btn-success">Edit</button>
			    	<button id="deletebutton" type="button" onclick="window.location.href='/myblog/<%=currentblogowner%>/<%=blogPostEntry.getBlogpathvar()%>/delete'" class="btn btn-danger" >Delete</button>
			    	
			    </div>
		    </div>
	    </div>
    </div>
 <%	++ctr;}
	} 
}%>
</body>
</html>