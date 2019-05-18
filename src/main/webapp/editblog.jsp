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
<% if(session.getAttribute("username") == null){
	 String site = new String("./login.jsp");
     response.setStatus(response.SC_MOVED_TEMPORARILY);
     response.setHeader("Location", site); 
	}
%> 
	
<%
	if(session.getAttribute("viewSingleEntry") !=null){
		BlogEntry blogEntry = (BlogEntry)session.getAttribute("viewSingleEntry");
		String currentblogowner = session.getAttribute("currentblogowner").toString();
	
%>
<%@include file="navigation_bars/user-nav.html" %>
     <div class="container p-4">
        <form action="/myblog/<%=currentblogowner%>/<%=blogEntry.getBlogpathvar()%>/edit" method="post">
          <div class="form-group">
            <input class="form-control" cols="30" type="text" name="title" value="<%= blogEntry.getTitle() %>" placeholder="Blog Title">
          </div>
          <div class="form-group">
            <textarea class="form-control" name="content" rows="8" cols="80" placeholder="Write Something..." ><%= blogEntry.getContent()%></textarea>
          </div>
          <div class="text-right">
          	<button type="submit" class="btn btn-success">Save</button>
          </div>
        </form>
    </div>
    
 <% } %>
</body>
