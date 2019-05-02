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
  <!--Naigation Bar-->
  <nav class="navbar navbar-expand navbar-dark bg-dark">
    <div class="container">
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
  			<ul class="navbar-nav mr-auto">
  				<li class="nav-item"><a class="nav-link" href="#">Home</a></li>
        <!--Navbar Right Align Buttons -->
  			</ul>
        <ul class="nav navbar-nav navbar-right">
          <li class="nav-item"><a class="nav-link" href="login.jsp">LOG IN</a></li>
          <li class="nav-item"><a class="nav-link" href="signup.jsp">SIGN UP</a></li>
        </ul>
  		</div>
    </div>
	</nav>

  <!--Homepage-->
  <!--Search bar-->
    <div class="container" style="height: 90%;">
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
</body>
</html>
