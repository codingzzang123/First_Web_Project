<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="test.*, java.util.* " %>    
<html>
<head>
<title>파일 전송 폼</title>
</head>
<body>
    <form action="test2.jsp" method="post"
        enctype="multipart/form-data">
        글쓴이 : <input type="text" name="name">
        <p>
            제 &nbsp; 목 : <input type="text" name="title">
        <p>
            파일 선택 : <input type="file" name="uploadFile">
        <p>
            <input type="submit" value="전송">
    </form>
    
    
    
    <% 
    	testDAO t = testDAO.getInstance();
    	List<testVO> ltt = t.selectAll();
    	pageContext.setAttribute("ltt",ltt);
    %>
    	
    
    
    <center>
    	<c:choose>
	    	<c:when test="${ltt ne null }">
	    		<c:forEach var="m" items="${ltt }">
		    		<div>
		    		<a href="view.jsp?name=${m.name }">이름: ${m.name }</a>
		    		이미지 이름 :${m.img }
		    		저장된 이미지 실제 이름 : ${m.imgcode }
		    		</div>
		    		<hr>
    			</c:forEach>
	    	</c:when>
	    	<c:when test="${ltt eq null }">
	    		<h1>검색 결과 없음.</h1>
	    	</c:when>
    	</c:choose>
    </center>
</body>
</html>
