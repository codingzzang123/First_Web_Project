<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");%>
<%
	String loginID = (String)session.getAttribute("loginID"); 
	if(loginID == null){
		response.sendRedirect("../acc/login.jsp");
	}
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/survey/template/navbar.jsp"></jsp:include>
	
	<div class="container mt-5 mb-5">
        <h1>Vote Page👀</h1>
        <br><br>
    <div class="text-end">
        <a href="create.jsp" class="btn btn-dark">Topic 생성</a>
    </div>
    <jsp:useBean id="tdao" class="vote.TopicDAO"></jsp:useBean>
    <%@ page import = "java.util.*, vote.*" %>
    <div class="row mt-5">
    <%
    	List<TopicVO> lv = tdao.selectAll();
    	if(lv!=null){
	    	for(TopicVO tv : lv){ 
	    		if(tv != null){ %>
			    	<div class="col-lg-4 mt-5">
		                <div class="card" style="width: 18rem;">
		                    <img src="/examjsp01/survey/img/no-image.png" class="card-img-top" alt="...">
		                    <div class="card-body">
		                    	<h4 class="card-title"><b><%= tv.getSubject() %></b></h4>
		                    	<p class="card-text"><%= tv.getContent_s() %></p>
		                    	<div class="text-end">
		                    		<a href="detail.jsp?sub=<%= tv.getSubject() %>" class="btn btn-primary">투표하기</a>
		                  	    </div>
		                    </div>
		                </div>
		           	</div>   
	         <%  }
    		}
    	}
    %>
    </div>
 
</div> 
</body>
</html>