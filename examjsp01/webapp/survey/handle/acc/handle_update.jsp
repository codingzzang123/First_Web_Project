<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.* , user.*, java.util.*, java.io.* , template.* " 
    %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>    
<% request.setCharacterEncoding("UTF-8");%>    
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
	String id=(String)session.getAttribute("loginID");
	userDAO dao = userDAO.getInstance();	

	request.setCharacterEncoding("UTF-8");
	String savePath = "/fileUpload/acc";
 	ServletContext context = getServletContext();
    String uploadFilePath = context.getRealPath(savePath);
	int size = 10*1024*1024;
	
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
		
		
		pw = multi.getParameter("pw");
		age = multi.getParameter("age");
		comment = multi.getParameter("comment");
		filename = multi.getFilesystemName("upic");
		
		if(!dao.isMember(id, pw)){
			response.sendRedirect("/examjsp01/error.jsp");
		}else{
		
			//비밀번호 맞으면 update진행 해야함
			if(filename == null){ //파일 안골랐을때..
				dao.updateUser(id, age, comment);
				response.sendRedirect("/examjsp01/survey/page/acc/info.jsp?user="+id);
			}else{
				String fe = "";//확장자만 가져옴
				File file = new File(uploadFilePath+"/"+filename);
				
				int i = filename.lastIndexOf('.');
				if (i > 0) {
				    fe = filename.substring(i);
				}
				//기존 유저 사진 삭제
				
				String deleteFileName = multi.getParameter("origin");
				if( !(deleteFileName.equals("0.png"))){
					File f = new File(uploadFilePath+"/"+deleteFileName);
					f.delete();
				}
				//유저 사진 업데이트
				String code = System.currentTimeMillis()+"_user"+fe;
				File newFile = new File(uploadFilePath+"/"+code);
				file.renameTo(newFile); //이름 바꿔줌
				
				
				
				dao.updateUserPic(id, age, comment,filename,code);
				response.sendRedirect("/examjsp01/survey/page/acc/info.jsp?user="+id);
			}
		}
	}catch(Exception e){
		e.printStackTrace();
	}
	
	%>