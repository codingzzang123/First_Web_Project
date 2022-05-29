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
	
	<jsp:include page="/survey/template/navbar.jsp"></jsp:include>
	<jsp:useBean id="tdao" class="vote.TopicDAO"></jsp:useBean>
	<jsp:useBean id="cdao" class="vote.ChoiceDAO"></jsp:useBean>
	<jsp:useBean id="vdao" class="vote.VoterDAO"></jsp:useBean>
	<%@ page import = "java.util.*, vote.* " %>
	<% 
		String sub = request.getParameter("sub"); //subject
		System.out.println("sub:"+sub);
		TopicVO tv = tdao.selectTopic(sub); 
		List<String> ls = vdao.getVoter(sub);
		
		
    	
			%>
		
	<div class="container mt-5 mb-5">  
        <h1>Vote Page✔ </h1>
 
	    <hr>
	    <div class="row mt-5">
	        <div class="col-lg-8"><textarea class="form-control" style="height: 300px;" disabled><%= sub %></textarea></div>
	        <div class="col-lg-4" style="margin:auto">
	            <div class="text-center">
	                made by <b><%= tv.getMaker() %></b>
	                <br><%= tv.getDate() %>
	            </div>
	        </div>
	    </div>
	    <hr>
	    
	    
	    
	    <%
	    	List<ChoiceVO> cv = cdao.selectChoice(sub);
			double sum = 0;
	    	for(ChoiceVO c:cv){
	    		sum += c.getCount();
	    	}
	    	boolean flag = false;
	    	if(ls != null){
	    		for(String s : ls){
		    		if(((String)session.getAttribute("loginID")).equals(s)){
			    			flag = true;
			    			break;
		    			}
	    		}
	    	} %>
	    	
	    	<% if(flag){ %>
	    		<div class="row mt-2">
		            <% for(ChoiceVO c:cv){ %>
		          
		                <div class="col-lg-4">
		                    <div class="mt-2 mb-2" style="margin-left:12px;">
	                            <%= c.getChname() %>
		                    </div>
		                    <textarea class="form-control mt-2" disabled><%= c.getChcom() %></textarea>
		                    <div class="progress mt-2">
		                    	<%if(sum==0){%>
		                    		<div class="progress-bar" role="progressbar" style="width: 100%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
		                            	0%</div>
		                    	<%}else{%>
		                    		<div class="progress-bar" role="progressbar" style="width:<%= (double)(c.getCount()/sum)*100.0 %>%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">
		                            	<%= (double)(c.getCount()/sum)*100.0 %> %
	                            	</div>
		                    	<%}%>
		                        
		                    </div>
		                </div>
	              	<% } 
	              		String selected = request.getParameter("selected");
	              	%>
	              	<a href="/examjsp01/survey/handle/choice_cancel.jsp?sub=<%= tv.getSubject() %>">
	              		<button class="btn btn-danger btn-lg">취소하기</button></a>    
		        </div>
		        <br>
	    	<%}else{%>
	    		<form method="post" action="/examjsp01/survey/handle/choice.jsp?sub=<%= tv.getSubject() %>">
		            <div class="row mt-2">
		            	<% for(ChoiceVO c : cv){ %>
		                    <div class="col-lg-4">
		                        <div class="mt-2 mb-2 text-center">
		                            <div class="form-check">
		                                <input class="form-check-input" type="radio" name="ch" value="<%= c.getChname() %>">
		                            </div>
		                            <%= c.getChname() %>
		                        </div>
		                        <textarea class="form-control mt-2" disabled><%= c.getChcom() %></textarea>
		                    </div>
		                <% } %>
		            </div>
		            <div class="text-center mt-4">
		                <button type="submit" class="btn btn-dark btn-lg">투표하기</button>  
		            </div>
		        </form>
	    	<%}%>
	    
	  
	     
	        
	   
	    
	   
	   
	   
	   
	   
	   
	    
	               
      		<div class="text-end">
      			<% if(((String)session.getAttribute("loginID")).equals(tv.getMaker())){ %>
      				<a href="/examjsp01/survey/page/vote/vote.jsp"><button class="btn btn-danger">뒤로가기</button>  </a>
      				<a href="delete.jsp?sub=<%= tv.getSubject() %>"><button type = "submit" class="btn btn-danger">주제 삭제</button></a>
      			<%}else{%>
      				<a href="/examjsp01/survey/page/vote/vote.jsp"><button class="btn btn-danger">뒤로가기</button>  </a>
      				<a href=""><button disabled class="btn btn-danger">주제 삭제</button></a>
      			<%} %>
      		</div>
	   
	   
	   
	        
	        	
   
	    
	</div>
	
</body>
</html>