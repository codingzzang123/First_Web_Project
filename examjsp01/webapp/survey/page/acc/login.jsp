<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="script.js"></script>
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      	body {
		  height: 100%;
		}

		body {
		  display: flex;
		  align-items: center;
		  padding-top: 40px;
		  padding-bottom: 40px;
		  background-color: #f5f5f5;
		}
		
		.form-signin {
		  width: 100%;
		  max-width: 330px;
		  padding: 15px;
		  margin: auto;
		}
		
		.form-signin .checkbox {
		  font-weight: 400;
		}
		
		.form-signin .form-floating:focus-within {
		  z-index: 2;
		}
		
		.form-signin input[type="email"] {
		  margin-bottom: -1px;
		  border-bottom-right-radius: 0;
		  border-bottom-left-radius: 0;
		}
		
		.form-signin input[type="password"] {
		  margin-bottom: 10px;
		  border-top-left-radius: 0;
		  border-top-right-radius: 0;
		}
    </style>

    
	  </head>
	  
	  	
	  
  <body class="text-center"> 
	<main class="form-signin">
		
	  <form action="../../handle/handle_login.jsp" method="post" name="loginForm">
	    <img class="mb-4" src="/examjsp01/survey/img/pngegg.png" width="200" height="200" alt="">
	    <h1 class="h3 mb-3 fw-normal">Please sign in</h1>
	
	    <div class="form-floating">
	      <input type="text" name="id" class="form-control" id="floatingInput" placeholder="Id">
	      <label for="floatingInput">Email address</label>
	    </div>
	    <div class="form-floating">
	      <input type="password" name="pw" class="form-control" id="floatingPassword" placeholder="Password">
	      <label for="floatingPassword">Password</label>
	    </div>
	
	    <div class="checkbox mb-3">
	      <label>
	        <input type="checkbox" value="remember-me"> Remember me(No function)
	      </label>
	    </div>
	    <input type="button" value="Login" onclick="inputCheck()" class="w-100 btn btn-lg btn-primary">
	    <a href="/examjsp01/survey/page/acc/signUp.jsp">
	    	<button class="w-100 btn btn-lg btn-primary" type="button" style="margin-top:10px;">Sign up</button>
	    </a>
	    <p class="mt-5 mb-3 text-muted">&copy; made by hosun</p>
	  </form>
	</main>


    
  </body>
</html>