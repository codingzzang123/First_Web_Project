<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <%@ page import="board.* " %>
	 <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
	 <jsp:include page="/survey/template/navbar.jsp"></jsp:include>
	 
	 <% BoardDAO dao = BoardDAO.getInstance(); 
	 	int num = Integer.parseInt(request.getParameter("num"));
	 	BoardVO vo = null;
	 	vo = dao.select(num);
	 	pageContext.setAttribute("detail",vo);
	    pageContext.setAttribute("num",num);
	 %>
	 
	 <%-- 작성자만 수정할수 있게 조건을 걸어줌 --%>
	 <c:if test="${ detail eq null}"><c:redirect url="/error.jsp" context="/examjsp01"/></c:if>
	 <c:if test="${ detail.maker ne loginID}"><c:redirect url="/error.jsp" context="/examjsp01"/></c:if>
	 <c:if test="${loginID eq null }"><c:redirect url="/error.jsp" context="/examjsp01"/></c:if>
	 
	 <form method="post" action="/examjsp01/survey/handle/board/update.jsp">
        <div class="container mt-5 mb-5" style="font-size: 20px; font-weight: bold; width: 80%;">
            <h1><b>게시글수정</b></h1>
            <div class="mb-3 mt-5">
                <label class="form-label">SUBJECT</label>
                <input type="text" class="form-control" value="${detail.subject }" name="sub">
            </div>
            <div class="mb-3">
                <label class="form-label">WRITER</label>
                <input type="text" class="form-control" disabled value="${loginID }">
            </div>
            <div class="mb-3">
                <label class="form-label">CONTENT</label>
                <textarea class="form-control" style="height: 100px;" name="con">${detail.content }</textarea>
            </div>
            <div class="text-end mt-3">
                <button class="btn btn-dark">수정하기</button>
            </div> 
            <input type="hidden" name="num" value="${num }">
            <input type="hidden" name="code" value="${detail.maker }">
        </div>
    </form>
</body>
</html>