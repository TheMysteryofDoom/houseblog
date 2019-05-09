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
<title>Blog Site</title>
<link rel="stylesheet"
  href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
  integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
  crossorigin="anonymous">

<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body id="homepage">
  <!--Navigation Bar-->
	<% if(session.getAttribute("username") == null){
		 String site = new String("./login.jsp");
	     response.setStatus(response.SC_MOVED_TEMPORARILY);
	     response.setHeader("Location", site);
		}
	%>
  <%@include file="navigation_bars/user-nav.html" %>

  <!--Homepage-->
  <!--Search bar-->
  <div class="container mt-5 mb-5">
    <div class="row align-items-center">
      <div class="col align-self-center">
         <form class="col">
           <div class="form-inline">
                <div class="input-group mb-3 w-100">
                  <input type="text" class="form-control" placeholder="Search Title" aria-label="Searh Title" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                      <button class="btn btn-outline-secondary" id="search" type="submit">Search</button>
                    </div>
                </div>
			</div>
        </form>
      </div>
    </div>
  </div>

    <!-- Add Blog -->
    <div class="container">
      <div class="container">
        <form action="/postblogentry" method="post">
          <div class="form-group">
            <input class="form-control" cols="30" type="text" name="title" value="" placeholder="Blog Title">
          </div>
          <div class="form-group">
            <textarea class="form-control" name="content" rows="8" cols="80" placeholder="Write Something..."></textarea>
          </div>
          <div class="text-right">
          	<button type="submit" class="btn btn-primary">Post</button>
          </div>
        </form>
    </div>

    <!--Blog Cards -->
    <div class="container mt-3">

<%
	List<BlogEntry> blogPostEntries = new ArrayList<BlogEntry>();
	blogPostEntries = (ArrayList)session.getAttribute("allBlogPosts");
	int ctr = 0;
	
	if(blogPostEntries!=null){
		Collections.reverse(blogPostEntries);
		for(BlogEntry blogPostEntry : blogPostEntries){
%>
	   	<div class="row mb-3">
		   	<div class="col">
		   		<div class="card" id="<%= ctr%>">
			        <div class="card-header">
			          <p class="h4"><%= blogPostEntry.getTitle() %> </p>
			        </div>
			        <div class="card-body mh-100">
			          <blockquote class="blockquote mb-0">
			          	<p><%= blogPostEntry.getContent() %> </p>
			          </blockquote>
               		  <a href="blog/<%=blogPostEntry.getBlogpathvar() %>" class="stretched-link"></a>
			        </div>
			    </div>
		   	</div>
	   	</div>
 <%	
	 ++ctr;
	 }
	} %>
    </div>
</body>
</html>
