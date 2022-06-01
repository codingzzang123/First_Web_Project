<!doctype html>
<html lang="en">
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

    <title>Hello, world!</title>
  </head>
  <body>
  
  <header>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
          <a class="navbar-brand" href="#">CAT</a>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="<%= request.getContextPath() %>/survey/page/main.jsp">Home</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="<%= request.getContextPath() %>/survey/page/vote/vote.jsp">Vote</a>
              </li>
               <li class="nav-item">
                <a class="nav-link" href="<%= request.getContextPath() %>/survey/page/board/index.jsp">Board</a>
              </li>
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  <c:choose><c:when test="${ loginID eq null}">Menu</c:when><c:when test="${loginID ne null }">${loginID }</c:when></c:choose>
                  
                </a>
                
                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
     					
					<%     
							String loginID = (String)session.getAttribute("loginID"); 
                			if(loginID != null){ %>
                				<li><a class="dropdown-item" href="<%= request.getContextPath() %>/survey/page/acc/info.jsp?user=${loginID}">Profile</a></li>
                				<li><a class="dropdown-item" href="<%= request.getContextPath() %>/survey/page/acc/logout.jsp">LogOut</a></li>
                		<%	}else{ %>
                				<li><a class="dropdown-item" href="<%= request.getContextPath() %>/survey/page/acc/login.jsp">Login</a></li>
                                <li><a class="dropdown-item" href="<%= request.getContextPath() %>/survey/page/acc/signUp.jsp">Sign Up</a></li>
                		<%	}
                	%>
                  
                  <li><hr class="dropdown-divider"></li>
                  <%-- <li><a class="dropdown-item" href="#">Something else here</a></li>--%>
                </ul>
              </li>
             
            </ul>
            <form class="d-flex">
              <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
              <button class="btn btn-outline-success" type="button">Search</button>
            </form>
          </div>
        </div>
      </nav>
     </header>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
    -->
  </body>
</html>
