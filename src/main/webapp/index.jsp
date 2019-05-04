<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
  <!--Navigation Bar-->
  <nav class="navbar navbar-expand navbar-dark bg-dark">'
    <div class="container">
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
  			<ul class="navbar-nav mr-auto">
  				<li class="nav-item"><a class="nav-link" href="#">Home</a></li>
        <!--Navbar Right Align Buttons -->
  			</ul>
        <ul class="nav navbar-nav navbar-right">
          <li class="nav-item"><a class="nav-link" href="login">LOG IN</a></li>
          <li class="nav-item"><a class="nav-link" href="signup">SIGN UP</a></li>
        </ul>
  		</div>
    </div>
	</nav>

  <!--Homepage-->
  <!--Search bar-->
    <div class="container" style="height: 20%;">
      <div class="row align-items-center">
        <div class="col align-self-center">
        <!--   <form class="col-8 method="post"> -->
        <!--      <div class="form-inline">-->
                  <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="Search Title" aria-label="Searh Title" aria-describedby="basic-addon2">
                      <div class="input-group-append">
                        <button class="btn btn-outline-secondary" id="search" type="submit">Search</button>
                      </div>
                  </div>
        <!--      </div>-->
        <!--   </form>-->
        </div>
      </div>
    </div>
    <div class="container">
      <div class="card">
        <div class="card-header">
          Title
        </div>
        <div class="card-body">
          <blockquote class="blockquote mb-0">
            <p>Display Blog text here...</p>
          </blockquote>
        </div>
      </div>
    </div>
    <!--Blog Cards -->
    <!--Blog Card 1 -->
    <div class="container" style="height: 60%;">
      <div class="card" style="height: 300px">
        <div class="card-header">
          Title
        </div>
        <div class="card-body mh-100">
          <blockquote class="blockquote mb-0">
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ullamcorper eget nulla facilisi etiam dignissim. Quam lacus suspendisse faucibus interdum posuere lorem ipsum. Et ultrices neque ornare aenean euismod elementum. Suspendisse in est ante in. Vitae tempus quam pellentesque nec nam aliquam. Egestas maecenas pharetra convallis posuere morbi leo urna molestie at. In est ante in nibh mauris. Massa massa ultricies mi quis hendrerit dolor magna eget est. Faucibus pulvinar elementum integer enim. Odio tempor orci dapibus ultrices in iaculis. Ut consequat semper viverra nam libero. Malesuada fames ac turpis egestas integer eget aliquet nibh. Suspendisse ultrices gravida dictum fusce. Ante in nibh mauris cursus mattis molestie a iaculis.</p>
          </blockquote>
        </div>
      </div>
    </div>
    <!--Blog Card 2 -->
    <div class="container" style="height: 60%;">
      <div class="card" style="height: 300px">
        <div class="card-header">
          Title
        </div>
        <div class="card-body mh-100">
          <blockquote class="blockquote mb-0">
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ullamcorper eget nulla facilisi etiam dignissim. Quam lacus suspendisse faucibus interdum posuere lorem ipsum. Et ultrices neque ornare aenean euismod elementum. Suspendisse in est ante in. Vitae tempus quam pellentesque nec nam aliquam. Egestas maecenas pharetra convallis posuere morbi leo urna molestie at. In est ante in nibh mauris. Massa massa ultricies mi quis hendrerit dolor magna eget est. Faucibus pulvinar elementum integer enim. Odio tempor orci dapibus ultrices in iaculis. Ut consequat semper viverra nam libero. Malesuada fames ac turpis egestas integer eget aliquet nibh. Suspendisse ultrices gravida dictum fusce. Ante in nibh mauris cursus mattis molestie a iaculis.</p>
          </blockquote>
        </div>
      </div>
    </div>
    <!--Blog Card 3-->
    <div class="container" style="height: 60%;">
      <div class="card" style="height: 300px">
        <div class="card-header">
          Title
        </div>
        <div class="card-body mh-100">
          <blockquote class="blockquote mb-0">
            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ullamcorper eget nulla facilisi etiam dignissim. Quam lacus suspendisse faucibus interdum posuere lorem ipsum. Et ultrices neque ornare aenean euismod elementum. Suspendisse in est ante in. Vitae tempus quam pellentesque nec nam aliquam. Egestas maecenas pharetra convallis posuere morbi leo urna molestie at. In est ante in nibh mauris. Massa massa ultricies mi quis hendrerit dolor magna eget est. Faucibus pulvinar elementum integer enim. Odio tempor orci dapibus ultrices in iaculis. Ut consequat semper viverra nam libero. Malesuada fames ac turpis egestas integer eget aliquet nibh. Suspendisse ultrices gravida dictum fusce. Ante in nibh mauris cursus mattis molestie a iaculis.</p>
          </blockquote>
        </div>
      </div>
    </div>
</body>
</html>
