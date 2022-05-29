
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>  
<!doctype html>
<html lang="en">
  <head>
   
    <title>Hello, world!</title>
  </head>
  <body>
    <jsp:include page="/survey/template/navbar.jsp"></jsp:include>

       <!-- content -->
	<div class="container pt-3">
		<div class = "row">
			<!-- left content -->
			<div class="col-sm-4">
				<h2>About This Page</h2>
				<p>Coding All Together</p>
				<img src="../img/joy.png" class="img-fluid">
				<p>호선,호정,지은,지성</p>
			</div>
			<div class="col-sm-8">
				<h2>Survey Project</h2>
				<p>Coding All Together</p>
				<img src="../img/ohmygirl.jpg" class="img-fluid">
				<p>호선,호정,지은,지성</p>
			</div>
		</div>
	</div>
	
    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
  </body>
</html>