<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="test.*, java.util.* " %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	 String name = request.getParameter("name");
	 testDAO t = testDAO.getInstance();
	 testVO ltt = t.select(name);
	 pageContext.setAttribute("ltt",ltt);
	%>
	
	 <c:if test="${ltt.img ne null }">
	 	<img src="http://localhost:8080/examjsp01/fileUpload/upload/${ltt.imgcode }">
	 </c:if>
	 <h1>${ltt.imgcode }</h1>
</body>
</html>