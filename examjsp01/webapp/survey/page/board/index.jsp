<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="board.*, java.util.* " %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/survey/template/navbar.jsp"></jsp:include>
	 <%
    	int pageSize = 10; //한 페이지에 보여지는 글 수
    	int n = 1;
    %>
    <%
    //수정<2>
	    String pageNum = request.getParameter("pageNum");
	    if(pageNum == null){
	     pageNum = "1";
	    }
	    int currentPage = Integer.parseInt(pageNum);
	    int startRow = (currentPage - 1) * pageSize + 1;
	    int endRow = currentPage * pageSize;
	    
	    int count = 0;
	    int number = 1;
	    List<BoardVO> articleList = null;
	    BoardDAO dbPro = BoardDAO.getInstance();
	    count = dbPro.getArticleCount(); //전체 글 수
	    
	    if(count > 0){
	        articleList = dbPro.getArticles(startRow, endRow); //수정<3>
	    }
	    number = count - (currentPage-1) * pageSize;
	    
	    pageContext.setAttribute("articleList",articleList);
	    pageContext.setAttribute("number",number);
	    pageContext.setAttribute("currentPage",currentPage);
	    
	    String user = (String)session.getAttribute("loginID");
	    pageContext.setAttribute("user",user);
	%>
	
	
	<div class="container mt-5" style="width:100%">
        <h1><b>Board💬</b></h1>
        <table class="table table-striped table-hover mt-4">
            <thead>
                <tr>
                    <th scope="col">No</th>
                    <th scope="col">Subject</th>
                    <th scope="col">Pubdate</th>
                    <th scope="col">Writer</th>
                    <th scope="col">Clicks</th>
                </tr>
            </thead>
            
            
            <tbody>
                <c:if test="${articleList ne null }">
	            	<c:forEach var="article" items="${articleList }">
	            		<tr>
	                        <th scope="row">${number }</th>
	                        <c:choose>
	                        	<c:when test="${article.replys gt 0 }">
	                        		<td><a class="sub" href="detail.jsp?num=${article.num }&pageNum=${currentPage }" >${article.subject } </a>[${article.replys }]</td>
	                        	</c:when>
	                        	<c:when test="${article.replys eq 0 }">
	                        		<td><a class="sub" href="detail.jsp?num=${article.num }&pageNum=${currentPage }" >${article.subject } </a></td>
	                        	</c:when>
	                        </c:choose>
	                        <td>${article.pubdate }</td>
	                        <td>${article.maker }</td>
	                        <td>${article.clicks }</td>
	                    </tr>
	                    <c:set var="number" value="${number -1 }"/>
	            	</c:forEach>
            	</c:if>
            </tbody>
            
        </table>
        <div class="row mt-5">
            <div class="col-lg-10 text-center">
                <form>
                    <select name="cate">
                        <option value="sub" selected>제목</option>
                        <option value="wri" selected>글쓴이</option>
                        <option value="con" selected>내용</option>
                        <input name="kw" type="text" size="50" value=""><button>검색</button>
                    </select> 
                </form>
            </div>
            <div class="col-lg-2 text-end">
            	<c:choose>
            		<c:when test="${user ne null }">
            			<a href="create.jsp"><button type="button" class="btn btn-success btn-lg">
                   		 글쓰기</button></a>
            		</c:when>
            		<c:when test="${user eq null }">
            			<button type="button" class="btn btn-success btn-lg" disabled>
                    		글쓰기</button>
            		</c:when>
            	</c:choose>
                
            </div>    
       </div>
      </div> 
        
        
        
        
        
        
       <div class="row">
        <div class="col-lg-11">
            <nav aria-label="Page navigation example">
                <ul class="pagination nav justify-content-center">
                   
                    <%
						 if(count > 0){
						  int pageBlock = 5;
						  int imsi = count % pageSize == 0 ? 0 : 1;
						  int pageCount = count / pageSize + imsi;
						  int startPage = (int)((currentPage-1) / pageBlock) * pageBlock + 1;
						  int endPage = startPage + pageBlock - 1;
						  if(endPage > pageCount) endPage = pageCount;
						  if(startPage > pageBlock) { %>
						   <a href="index.jsp?pageNum=<%=startPage-pageBlock%>">[이전]</a>
						<% 
						  }
						  for(int i = startPage; i <= endPage; i++){ %>
						  <li class="page-item active" style="margin-left:2px;"><a class="page-link" href="index.jsp?pageNum=<%=i%>"><%=i%></a></li>
						<% 
						  }
						  if(endPage < pageCount) { %>
						   <a href="index.jsp?pageNum=<%=startPage+pageBlock%>">[다음]</a>
						<%
						  }
						 }
					%>
                </ul>
            </nav>
        </div>
        <div class="col-lg-1"></div>
    </div>
       

    
    
</body>
</html>