<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="test.*, java.util.*,java.io.* " %>
<html>
<head><title>업로드 처리</title></head>
<body>
<%
	
	request.setCharacterEncoding("UTF-8");
	String savePath = "/fileUpload/upload";
 	ServletContext context = getServletContext();
    String uploadFilePath = context.getRealPath(savePath);
	int size = 10*1024*1024;
	String name="";
	String title = "";
	String filename ="";
	String orig = "";
	
	try{
		MultipartRequest multi = new MultipartRequest(
				request,
				uploadFilePath,
				size,
				"UTF-8",
				new DefaultFileRenamePolicy());
		name=multi.getParameter("name");
		title = multi.getParameter("title");
		filename = multi.getFilesystemName("uploadFile");
	
		String fe = "";//확장자만 가져옴
		File file = new File(uploadFilePath+"/"+filename);
		
		int i = filename.lastIndexOf('.');
		if (i > 0) {
		    fe = filename.substring(i);
		}
		String tmp = System.currentTimeMillis()+"_user"+fe;
		File newFile = new File(uploadFilePath+"/"+tmp);
		file.renameTo(newFile); //이름 바꿔줌
		
		
		testDAO t = testDAO.getInstance();
		t.insert(name, filename, tmp);
		response.sendRedirect("test.jsp");
	}catch(Exception e){
		e.printStackTrace();
	}
	
	%>
   

  
</body>
</html>