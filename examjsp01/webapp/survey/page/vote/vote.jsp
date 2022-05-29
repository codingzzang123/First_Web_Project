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
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<c:if test="${loginID eq null }"><c:redirect url="/error.jsp" context="/examjsp01"/></c:if>
	

	<%
		String loginID = (String)session.getAttribute("loginID"); 
    	pageContext.setAttribute("user", loginID );	
		if(loginID == null){
			response.sendRedirect("../acc/login.jsp");
		}
	%>

	<jsp:include page="/survey/template/navbar.jsp"></jsp:include>
	<div class="container mt-5 mb-5">
        <h1>Vote Page👀</h1>
        <br><br>
    <div class="text-end">
        <a href="create.jsp" class="btn btn-dark">Topic 생성</a>
    </div>
    
	    
    
    <jsp:useBean id="tdao" class="vote.TopicDAO"></jsp:useBean>
    <jsp:useBean id="vdao" class="vote.VoterDAO"></jsp:useBean>
    <%@ page import = "java.util.*, vote.*" %>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
 	
    
    <%
    	List<TopicVO> lv = tdao.selectAll(); 
    	pageContext.setAttribute("list", lv); 
    	ArrayList<List<String>> als = new ArrayList<>(); 
    	for(TopicVO tvo : lv){
    		als.add(vdao.getVoter(tvo.getSubject()));
    	}
    	pageContext.setAttribute("voterList", als);     	
    	%>

    	<c:set var="i" value="0" />    	
    	
    	
	    <div class="row mt-5">
    	<c:if test="${not empty list }">
    		<c:forEach var="tv" items="${list }">
    			<c:set var="flag" value="false"/>
    			<c:if test="${tv ne null }">
    				<div class="col-lg-4 mt-5">
		                <div class="card" style="width: 18rem;">
		                    <img src="/examjsp01/survey/img/no-image.png" class="card-img-top" alt="...">
		                  	<c:if test="${voterList.get(i) ne null }"> 
				                    <c:forEach var="t" items="${voterList.get(i) }">
										<c:if test="${t eq user }">
											<c:set var="flag" value="true" />
										</c:if>	 
				                    </c:forEach>
		                    </c:if>
		                   	<c:choose>
		                   		<c:when test="${flag eq 'true' }">
		                   			<div class="card-body" style="background-color:red;">
				                    	<h4 class="card-title"><b>${tv.subject}</b></h4>
				                    	<p class="card-text">${tv.content_s }</p>
				                    	<div class="text-end">
				                    		<a href="detail.jsp?sub=${tv.subject }" class="btn btn-primary">투표하기</a>
				                  	    </div>
		                    		</div>
		                   		</c:when>
		                   		<c:when test="${flag eq 'false' }">
			                   		<div class="card-body" style="background-color:blue;">
				                    	<h4 class="card-title"><b>${tv.subject}</b></h4>
				                    	<p class="card-text">${tv.content_s }</p>
				                    	<div class="text-end">
				                    		<a href="detail.jsp?sub=${tv.subject }" class="btn btn-primary">투표하기</a>
				                  	    </div>
				                    </div>
		                   		</c:when>
		                   	</c:choose>		                
		                <c:set var="i" value="${i + 1}"/>
		                </div>
		           	</div>
    			</c:if>
    		</c:forEach>
    	</c:if>
    </div>
	
    	
    	
</body>
</html>