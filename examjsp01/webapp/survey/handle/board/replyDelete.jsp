<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.*, java.util.* "%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("UTF-8");%>

<%
	ReplyDAO dao = ReplyDAO.getInstance();
	BoardDAO daoBoard = BoardDAO.getInstance();
	int order = Integer.parseInt(request.getParameter("code"));
	int num = Integer.parseInt(request.getParameter("num"));
	dao.delete(order);
	daoBoard.replysMinus(num);
	response.sendRedirect("/examjsp01/survey/page/board/detail.jsp?num="+num);
%>