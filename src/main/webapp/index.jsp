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
<body class="background-image">
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
                    <input id="search" type="text" class="form-control" placeholder="Search Title" aria-label="Searh Title" aria-describedby="basic-addon2">
                      <div class="input-group-append">
                        <button class="btn btn-danger" id="clear-btn">Clear</button>
                      </div>
                  </div>
             </div>
           </form>
        </div>
      </div>
    </div>
    

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
	    <div class="row mb-3" id="<%= blogPostEntry.getTitle() %>">
			   	<div class="col">
			   		<div class="card" id="<%= ctr%>">
				        <div class="card-header">
				          <p class="h4"><%= blogPostEntry.getTitle() %> </p>
				        </div>
				        <div class="card-body mh-100">
				          <blockquote class="blockquote mb-0" >
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
