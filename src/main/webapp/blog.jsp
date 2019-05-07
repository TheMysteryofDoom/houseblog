<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
	<!-- navigation bar included here -->
	<!-- check session to show if user is logged in or not -->
	
	<% if(session.getAttribute("username") == null){ %>
		<%@include file="navigation_bars/guest-nav.html" %>
	<% } else { %>
		<%@include file="navigation_bars/user-nav.html" %>
	<% } %>
	
	<div class="container p-3">
		<div class="row mt-2">
			<div class="col-12">
				<p class="h1">Blog title</p>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<p>By: author</p>
			</div>
		</div>
		<div class="row p-3" style="border: 1px solid #000;">
			<div class="col-12">
				<p class="text-justify">
					Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Placerat orci nulla pellentesque dignissim enim. In est ante in nibh. Arcu vitae elementum curabitur vitae nunc sed velit dignissim. Enim eu turpis egestas pretium aenean pharetra magna. Ultrices in iaculis nunc sed augue lacus viverra vitae congue. Volutpat lacus laoreet non curabitur gravida arcu ac. At lectus urna duis convallis. Tortor vitae purus faucibus ornare suspendisse sed nisi lacus. Risus quis varius quam quisque id. Porttitor eget dolor morbi non arcu risus quis. Erat nam at lectus urna duis convallis convallis tellus id. Leo duis ut diam quam nulla porttitor. Massa enim nec dui nunc. Arcu bibendum at varius vel pharetra vel turpis nunc eget.

Congue quisque egestas diam in arcu cursus euismod quis viverra. Ac turpis egestas sed tempus urna et pharetra pharetra. Odio ut enim blandit volutpat maecenas. Lobortis feugiat vivamus at augue eget arcu dictum varius. Odio tempor orci dapibus ultrices in iaculis nunc sed. Ullamcorper sit amet risus nullam eget. Lectus arcu bibendum at varius vel pharetra. Et magnis dis parturient montes nascetur. Gravida rutrum quisque non tellus orci. Maecenas pharetra convallis posuere morbi leo. Ipsum a arcu cursus vitae. Imperdiet sed euismod nisi porta. Nisi vitae suscipit tellus mauris a diam maecenas sed enim. Sagittis nisl rhoncus mattis rhoncus urna. Semper feugiat nibh sed pulvinar proin gravida hendrerit lectus a.

Eu feugiat pretium nibh ipsum consequat nisl vel pretium lectus. Augue neque gravida in fermentum et sollicitudin ac orci. Diam volutpat commodo sed egestas egestas fringilla. Quam pellentesque nec nam aliquam sem et tortor consequat id. Ultricies tristique nulla aliquet enim tortor at auctor urna nunc. Non tellus orci ac auctor augue mauris augue. Amet nulla facilisi morbi tempus iaculis urna id volutpat lacus. Est ullamcorper eget nulla facilisi etiam. Tristique magna sit amet purus gravida quis blandit turpis cursus. Sit amet justo donec enim diam. Pretium aenean pharetra magna ac. Sit amet consectetur adipiscing elit pellentesque habitant. Sed risus pretium quam vulputate dignissim suspendisse in est. Senectus et netus et malesuada fames ac turpis. Faucibus a pellentesque sit amet porttitor. Odio aenean sed adipiscing diam donec adipiscing tristique risus. Sollicitudin nibh sit amet commodo nulla facilisi nullam vehicula ipsum.

Quisque id diam vel quam elementum pulvinar. Sollicitudin tempor id eu nisl nunc mi ipsum. Ridiculus mus mauris vitae ultricies leo integer. Duis tristique sollicitudin nibh sit amet commodo nulla facilisi nullam. Feugiat vivamus at augue eget arcu dictum. Fusce id velit ut tortor pretium viverra suspendisse potenti. Eu sem integer vitae justo eget. Magna etiam tempor orci eu lobortis. Nisl vel pretium lectus quam id leo in. Commodo elit at imperdiet dui accumsan sit amet nulla facilisi. Consectetur adipiscing elit ut aliquam purus sit amet luctus. Lorem dolor sed viverra ipsum. Faucibus turpis in eu mi bibendum neque. Facilisis leo vel fringilla est ullamcorper eget nulla facilisi etiam. Amet nisl purus in mollis.

Tincidunt ornare massa eget egestas purus viverra accumsan. Morbi tincidunt augue interdum velit euismod in pellentesque massa. Et malesuada fames ac turpis egestas. Dolor sit amet consectetur adipiscing elit duis tristique. Rhoncus aenean vel elit scelerisque mauris pellentesque. Lobortis scelerisque fermentum dui faucibus. Duis tristique sollicitudin nibh sit amet commodo nulla facilisi nullam. Odio eu feugiat pretium nibh ipsum consequat. Faucibus scelerisque eleifend donec pretium. Platea dictumst quisque sagittis purus sit amet. Magna ac placerat vestibulum lectus. Risus viverra adipiscing at in tellus integer feugiat scelerisque. Elit ullamcorper dignissim cras tincidunt lobortis feugiat vivamus at augue. Aliquam vestibulum morbi blandit cursus risus at ultrices mi tempus. Nisi vitae suscipit tellus mauris a diam maecenas.</p>
			</div>
		</div>
	</div>

</body>
</html>