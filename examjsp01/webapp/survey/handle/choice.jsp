<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.net.URLEncoder"%>
<% request.setCharacterEncoding("UTF-8"); %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="vdao" class="vote.VoterDAO"></jsp:useBean>
	<jsp:useBean id="cdao" class="vote.ChoiceDAO"></jsp:useBean>
	
	<%
		String user = (String)session.getAttribute("loginID");
		String subject = request.getParameter("sub");
		String chname = request.getParameter("ch");
		
		
		vdao.insertInfo(user, subject, chname);
		cdao.updateCount(chname, subject);
		String sub = URLEncoder.encode(request.getParameter("sub"), "utf-8");
		String ch = URLEncoder.encode(request.getParameter("ch"), "utf-8");
		response.sendRedirect("/examjsp01/survey/page/vote/detail.jsp?sub="+sub+"&selected="+ch);
	%>
	
	
</body>
</html>