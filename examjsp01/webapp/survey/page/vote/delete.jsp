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
	<jsp:useBean id="tdao" class="vote.TopicDAO"></jsp:useBean>
	<%
		String subject = request.getParameter("sub"); 
		System.out.println("["+subject+"] 삭제");
		
		tdao.delete(subject);
		response.sendRedirect("/examjsp01/survey/page/vote/vote.jsp");
		%>
</body>
</html>