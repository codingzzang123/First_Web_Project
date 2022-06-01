<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.*"%>
<% request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/examjsp01/survey/page/acc/script.js"></script>

</head>
<body>
	
	<%
		userDAO udao = userDAO.getInstance();
		String id = request.getParameter("id");
		if(udao.idCheck(id)){
			out.println(id+" 는 이미 존재하는 ID입니다.<br><br>");
		}else{ 
			out.println(id+" 는 사용가능합니다.<br><br> ");
		}
	%>
	<a href="#" onclick="javascript:self.close()">닫기</a>
</body>
</html>