<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.* , user.*, java.util.* , template.* " 
    %>
<% request.setCharacterEncoding("UTF-8");%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:useBean id="udao" class="user.userDAO" />
	<jsp:useBean id="uvo" class="user.userVO" />
	<jsp:setProperty property="*" name="uvo" />
	
	<%	
		String id = uvo.getId();
		if(udao.idCheck(id)){
			
			response.sendRedirect("../page/acc/fail.jsp");
			System.out.print("중복 있음!!");
			
			
		}else{ 
			udao.insertUser(uvo.getId(), uvo.getPw(), uvo.getAge(), uvo.getComment());
			response.sendRedirect("../page/acc/login.jsp");
			System.out.print("중복 없음!!");
		}
		
	%>
</body>
</html>