<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");%>

	<jsp:useBean id="udao" class="user.userDAO"></jsp:useBean>
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String remember = request.getParameter("remember");
		
		if(udao.isMember(id, pw)){ 
			if(remember == null){
				Cookie[] co = request.getCookies();
				if(co != null){
					for(Cookie c : co){
						if((c.getName()).equals("remember")){
							Cookie cookie = new Cookie("remember",id);
							cookie.setMaxAge(0);
							cookie.setPath("/examjsp01");
							response.addCookie(cookie);
							System.out.println("쿠키 데이터 삭제 완료");
							
							/*
							c.setPath("/");
							c.setMaxAge(0);
							response.addCookie(c);
							System.out.println("쿠키 데이터 삭제 완료");*/
						}
					}
				}
			}else if(remember.equals("remember")){
				Cookie cookie = new Cookie("remember",id);
				cookie.setMaxAge(60*10);
				cookie.setPath("/examjsp01");
				response.addCookie(cookie);
				System.out.println("쿠키 생성 완료");
			}
			System.out.println("로그인성공");
			session.setAttribute("loginID", id);
			response.sendRedirect("../page/main.jsp");
					
		}else{ %>
			<script>
				alert("아이디 혹은 비밀번호를 잘못 입력하셨습니다.")
				history.go(-1);
			</script>	
	  <%}
	%>
