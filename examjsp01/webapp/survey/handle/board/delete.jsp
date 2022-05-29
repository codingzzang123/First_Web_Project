<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ page import="board.*, java.util.* " %>

	<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<c:if test="${loginID eq null }"><c:redirect url="/error.jsp" context="/examjsp01"/></c:if>
	<c:if test="${loginID ne param.code }"><c:redirect url="/error.jsp" context="/examjsp01"/></c:if>
	
	<%
		int num = Integer.parseInt(request.getParameter("num"));
		
		BoardDAO dao = BoardDAO.getInstance();
		dao.delete(num);
		response.sendRedirect("/examjsp01/survey/page/board/index.jsp");
	%>
	
	
</body>
</html>