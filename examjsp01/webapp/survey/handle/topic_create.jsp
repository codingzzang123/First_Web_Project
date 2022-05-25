<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.* , vote.*, java.util.* "
    %>
<% request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="tdao" class="vote.TopicDAO"></jsp:useBean>
	<jsp:useBean id="cdao" class="vote.ChoiceDAO"></jsp:useBean>
	
	<%
		String subject = request.getParameter("subject");
		String maker = (String)session.getAttribute("loginID");
		String content_s = request.getParameter("content");
		
		String [] chnames = request.getParameterValues("chname");
		String [] chcons = request.getParameterValues("chcon");
		
		if(tdao.checkTopic(subject)){
			tdao.insertTopic(subject, maker, content_s);
			System.out.println("토픽 테이블 생성 완료");
			for(int i=0; i<chnames.length; i++){
				cdao.insertChoice(subject,chnames[i],chcons[i]);
			}
			response.sendRedirect("/examjsp01/survey/page/vote/vote.jsp");
		}else{
			response.sendRedirect("/examjsp01/survey/page/vote/detail.jsp");
		}
		
	%>
</body>
</html>