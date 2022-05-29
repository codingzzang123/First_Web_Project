<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.*, java.util.* "%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("UTF-8");%>

<%
	String content = request.getParameter("con");
	int num = Integer.parseInt(request.getParameter("number"));
	ReplyDAO daoReply = ReplyDAO.getInstance();
	BoardDAO daoBoard = BoardDAO.getInstance();
	daoReply.insertReply(num, (String)session.getAttribute("loginID"), content);
	daoBoard.replys(num);
	System.out.println("댓글 추가 완료");
	response.sendRedirect("/examjsp01/survey/page/board/detail.jsp?num="+num);
%>

