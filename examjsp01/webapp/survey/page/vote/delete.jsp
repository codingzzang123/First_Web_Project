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
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<c:if test="${loginID eq null }"><c:redirect url="/error.jsp" context="/examjsp01"/></c:if>
	
	<%-- url 접근 체크 추가해야함 --%>
	<%
		String subject = request.getParameter("sub"); 
		System.out.println("["+subject+"] 삭제");
		
		tdao.delete(subject);
		response.sendRedirect("/examjsp01/survey/page/vote/vote.jsp");
		%>
	
</body>
</html>