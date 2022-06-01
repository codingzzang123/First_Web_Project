<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.* , user.*, java.util.*, java.io.* , template.* " 
    %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>    
<% request.setCharacterEncoding("UTF-8");%>    
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>


<%
	userDAO dao = userDAO.getInstance();	

	request.setCharacterEncoding("UTF-8");
	String savePath = "/fileUpload/acc";
 	ServletContext context = getServletContext();
    String uploadFilePath = context.getRealPath(savePath);
	int size = 10*1024*1024;
	String id="";
	String pw = "";
	String age = "";
	String comment ="";
	String filename ="";
	
	try{
		MultipartRequest multi = new MultipartRequest(
				request,
				uploadFilePath,
				size,
				"UTF-8",
				new DefaultFileRenamePolicy());
		
		id = multi.getParameter("id");
		pw = multi.getParameter("pw");
		age = multi.getParameter("age");
		comment = multi.getParameter("comment");
		filename = multi.getFilesystemName("upic");
		
		if(dao.idCheck(id)){ %>
			<script>
				alert("이미 존재하는 아이디 입니다.")
				history.go(-1);
			</script>
		<%}
		
		if(filename == null){
			dao.insertUser(id, pw, age, comment);
			response.sendRedirect("/examjsp01/survey/page/acc/login.jsp");
		}else{
			String fe = "";//확장자만 가져옴
			File file = new File(uploadFilePath+"/"+filename);
			
			int i = filename.lastIndexOf('.');
			if (i > 0) {
			    fe = filename.substring(i);
			}
			String code = System.currentTimeMillis()+"_user"+fe;
			File newFile = new File(uploadFilePath+"/"+code);
			file.renameTo(newFile); //이름 바꿔줌
		
			dao.insertUserPic(id, pw, age, comment, filename, code);
			response.sendRedirect("/examjsp01/survey/page/acc/login.jsp");
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	
	%>

