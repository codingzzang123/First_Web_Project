<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%> 
<!doctype html>
<html>
<head>
<title>My Board</title>

<script src="script.js"></script>
</head>
 

 
<body>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<c:if test="${loginID eq null }"><c:redirect url="/error.jsp" context="/examjsp01"/></c:if>
	
	<jsp:include page="/survey/template/navbar.jsp"></jsp:include>
	<div class="container mt-5 mb-5" style="font-size: 20px; font-weight: bold; width: 80%;">
	<h1><b>게시글 작성</b></h1>
	<form method="post" action="/examjsp01/survey/handle/board/create.jsp">
	    <div class="mb-3 mt-5">
	        <label class="form-label">SUBJECT</label>
	        <input type="text" class="form-control" name="sub">
	    </div>
	    <div class="mb-3">
	        <label class="form-label">WRITER</label>
	        <input type="text" class="form-control" value="${loginID }" disabled>
	    	<input type="hidden" name="code" value="${loginID }" >
	    </div>
	    <div class="mb-3">
	        <label class="form-label">CONTENT</label>
	        <textarea class="form-control" style="height: 100px;" name="con"></textarea>
	        </div>
	        <div class="text-end mt-3">
	            <button class="btn btn-dark">생성</button>
	        </div>
	    </form>
	</div>
</body>
</html>
