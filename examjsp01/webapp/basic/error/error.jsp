<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <h1>error</h1>
 ERROR
 	에러 타입 : <%= exception.getClass().getName() %><br><br>
	에러 메세지 : <b><%= exception.getMessage() %></b>
</body>
</html>