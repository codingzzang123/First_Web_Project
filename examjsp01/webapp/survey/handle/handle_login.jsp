<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="udao" class="user.userDAO"></jsp:useBean>
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		
		
		
		if(udao.isMember(id, pw))
		{ 
			System.out.println("로그인성공");
			session.setAttribute("loginID", id);
			response.sendRedirect("../page/main.jsp");
					
		}
		else
		{
			response.sendRedirect("../page/acc/login.jsp");	
		}
	%>
</body>
</html>