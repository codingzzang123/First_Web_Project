<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.*"%>
<% request.setCharacterEncoding("UTF-8");%>

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<c:if test="${loginID eq null }"><c:redirect url="/error.jsp" context="/examjsp01"/></c:if>
	<c:if test="${loginID ne param.code }"><c:redirect url="/error.jsp" context="/examjsp01"/></c:if>
	

<%
	String subject = request.getParameter("sub");
	String content = request.getParameter("con");
	int num = Integer.parseInt(request.getParameter("num"));
	
	BoardDAO dao = BoardDAO.getInstance();
	dao.update(subject, content, num);
	response.sendRedirect("/examjsp01/survey/page/board/detail.jsp?num="+num);
%>



