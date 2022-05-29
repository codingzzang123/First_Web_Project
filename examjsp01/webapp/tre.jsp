<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/survey/template/navbar.jsp"></jsp:include>
	<%
		String []names = request.getParameterValues("chname");
		for(String s : names){
			out.println(s);
		}
	%>
</body>
</html>