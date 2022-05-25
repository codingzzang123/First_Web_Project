<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import = "java.net.URLEncoder" %>
    
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
		request.setCharacterEncoding("UTF-8");
		String user = (String)session.getAttribute("loginID");
		String sub = request.getParameter("sub");
		cdao.updateCountMinus(user,sub);
		vdao.deleteVoter(user,sub);
		sub = URLEncoder.encode(request.getParameter("sub"), "utf-8");
		response.sendRedirect("/examjsp01/survey/page/vote/detail.jsp?sub="+sub);
	%>
</body>
</html>