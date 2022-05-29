<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.* , user.*, java.util.* , template.* " 
    %>
<% request.setCharacterEncoding("UTF-8");%>    

	<jsp:useBean id="udao" class="user.userDAO" />
	<jsp:useBean id="uvo" class="user.userVO" />
	<jsp:setProperty property="*" name="uvo" />
	<%	
		String id = uvo.getId();
		if(udao.idCheck(id)){ %>
			
			<script>
				alert("이미 존재하는 아이디 입니다.")
				history.go(-1);
			</script>
			
			
		<%}else{ 
			udao.insertUser(uvo.getId(), uvo.getPw(), uvo.getAge(), uvo.getComment());
			response.sendRedirect("../page/acc/login.jsp");
		}
		
	%> 

