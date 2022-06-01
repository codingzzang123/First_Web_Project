<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="user.*"%>

<%
	String id = (String)session.getAttribute("loginID");
	String pw = request.getParameter("ckpw");
	
	userDAO dao = userDAO.getInstance();
	boolean flag = dao.isMember(id, pw);
	
%>
	<%if(flag){ 
		//dao.signOut(id);
		session.invalidate();
		response.sendRedirect("/examjsp01/survey/page/main.jsp");
	}else{%>
		<script>
			alert("비밀번호를 잘못 입력하셨습니다.")
			history.go(-1);
		</script>	
	<%}%>


