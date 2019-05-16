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
<body id="homepage" class="background-image">
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
                  <input type="text" id="search" class="form-control" placeholder="Search Title" aria-label="Searh Title" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                      <button class="btn btn-danger" id="clear-btn">Clear</button>
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
	         <div class="row justify-content-end">
	         <% if(request.getAttribute("cannotpostblog") != null){  %> 
	         	<div class="col text-right">
	         		<p class="text-danger">Blog cannot be posted.</p>
	         	</div>
         	<%} %>
	         	<div class="col-md-auto">
	         		<button type="submit" class="btn btn-primary">Post</button>
	         	</div>
	         </div>
	       </form>
	   	</div>
	</div>
    <!--Blog Cards -->
    <div class="container mt-3">
		<div class="text-center" id="no-results">
			<p class="h3 text-danger">No results found.</p>
		</div>
<%
	List<BlogEntry> blogPostEntries = new ArrayList<BlogEntry>();
	blogPostEntries = (ArrayList)session.getAttribute("allBlogPosts");
	int ctr = 0;
	
	if(blogPostEntries!=null){
		Collections.reverse(blogPostEntries);
		for(BlogEntry blogPostEntry : blogPostEntries){
%>
	<div class="data-cards">
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
		   	</div>
	   	</div>
	</div>
 <%	
	 ++ctr;
	 }
	} %>
    </div>
</body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#clear-btn").hide();
		$("#no-results").hide();
		
	    $("#search").on('input',function(){
	        var matcher = new RegExp($(this).val(), 'gi');
	        $('.data-cards').show().not(function(){
	            return matcher.test($(this).find('.h4').text())
	        }).hide();
	    })	   
	    
		$("#search").keyup(function(){
	        if(!this.value){
	        	$("#clear-btn").hide();
	        } else{
	        	$("#clear-btn").show();
	    	}
	        
	        if ( $("div.data-cards:visible").length === 0) {
	            $("#no-results").show( );
			} else {
				$("#no-results").hide();
			}
	    });
	    
	    $("#clear-btn").click(function(){
	    	$("#search").val('');
	    })
	})
</script>
</html>
