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
<title>Welcome!</title>
<link rel="stylesheet"
  href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
  integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
  crossorigin="anonymous">

<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<% if(session.getAttribute("username") != null){
		 String site = new String("./homepage.jsp");
	     response.setStatus(response.SC_MOVED_TEMPORARILY);
	     response.setHeader("Location", site);
		}
	%>
  <!-- navigation bar included here -->
	<%@include file="navigation_bars/guest-nav.html" %>

  <!--Homepage-->
  <!--Search bar-->
    <div class="container mt-5 mb-5">
      <div class="row align-items-center">
        <div class="col align-self-center">
           <form class="col" method="post">
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
    

   <div class="container mt-3">
<% 
	List<BlogEntry> blogPostEntries = new ArrayList<BlogEntry>();
	blogPostEntries = (ArrayList)session.getAttribute("allBlogPosts");
	
	if(blogPostEntries!=null){
		Collections.reverse(blogPostEntries);
		for(BlogEntry blogPostEntry : blogPostEntries){
%>
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
			          <a href="blog/<%=blogPostEntry.getBlogpathvar() %>" class="stretched-link"></a>
			        </div>
			    </div>
		   	</div>
	   	</div>
<%}} %>
    </div>
</body>
</html>
