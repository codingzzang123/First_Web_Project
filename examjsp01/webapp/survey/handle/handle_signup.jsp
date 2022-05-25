<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.* , user.*, java.util.* , template.* " 
    %>
<% request.setCharacterEncoding("UTF-8");%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:useBean id="udao" class="user.userDAO" />
	<jsp:useBean id="uvo" class="user.userVO" />
	<jsp:setProperty property="*" name="uvo" />
	
	<%	
		String id = uvo.getId();
		//out.println(id);
		//out.println(uvo.getId());
		if(udao.idCheck(id)){
			
			response.sendRedirect("../page/acc/fail.jsp");
			System.out.print("중복 있음!!");
			
			
		}else{ 
			udao.insertUser(uvo.getId(), uvo.getPw(), uvo.getAge(), uvo.getComment());
			response.sendRedirect("../page/acc/login.jsp");
			System.out.print("중복 없음!!");
		}
		
		/*List<userVO> lu = udao.selectAll();	
		
		String tmpId = uvo.getId();
		boolean flag = false;
		
		if(lu == null){
			flag = false;			
		}else{
			for(userVO u : lu){
				if(tmpId.equals(u.getId())){
					flag = true;
					break;
					
				}
			}
		}
		if (flag){ //아이디가 중복된다면 
			response.sendRedirect("../page/acc/fail.jsp");
		}else{
			//udao.insertUser(tmpId, uvo.getPw(), uvo.getAge(), uvo.getComment());
			response.sendRedirect("../page/acc/login.jsp");
		}*/
		
	%>
</body>
</html>