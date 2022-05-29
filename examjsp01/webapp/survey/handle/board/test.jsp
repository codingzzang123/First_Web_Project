<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="board.*, java.util.* "%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("UTF-8");%>

<%
	String content = request.getParameter("con2"); //content
	
	int num = Integer.parseInt(request.getParameter("num"));
	int order = Integer.parseInt(request.getParameter("order"));
	String maker = (String)session.getAttribute("loginID");
	ReplyDAO dao = ReplyDAO.getInstance();
	BoardDAO daoBoard = BoardDAO.getInstance();
	dao.insertReReply(num, maker, content, order, order);
	daoBoard.replys(num);
	System.out.println("답글 추가 완료");
	response.sendRedirect("/examjsp01/survey/page/board/detail.jsp?num="+num);
%>

