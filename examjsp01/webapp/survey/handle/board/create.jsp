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
	<%@ page import="board.*, java.util.* " %>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<c:if test="${loginID eq null }"><c:redirect url="/error.jsp" context="/examjsp01"/></c:if>
	<c:if test="${loginID ne param.code }"><c:redirect url="/error.jsp" context="/examjsp01"/></c:if>
	
	<%
	 	BoardDAO bdao = BoardDAO.getInstance();
		String subject = request.getParameter("sub");
		String content = request.getParameter("con");
		String user = (String)session.getAttribute("loginID");
		
		bdao.createBoard(subject, content, user);
		System.out.println("주제: "+subject+" 등록 완료!!");
		response.sendRedirect("/examjsp01/survey/page/board/index.jsp");
	%>
	
</body>
</html>