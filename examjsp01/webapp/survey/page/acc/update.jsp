<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.* , user.*, java.util.*, java.io.* , template.* "%>
<% request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>
<jsp:include page="/survey/template/navbar.jsp"></jsp:include>

<%
	String user = (String)session.getAttribute("loginID");
	userDAO udao = userDAO.getInstance();
	
	userVO vo = udao.select(user);
	pageContext.setAttribute("vo",vo);
%>

<form method="post" enctype="multipart/form-data" name="updateForm" action="/examjsp01/survey/handle/acc/handle_update.jsp">
    <div class="container mt-5 mb-5"  style="font-size: 20px; font-weight: bold; width: 60%;">
        <h1><b>정보수정</b></h1>
        <input type="hidden" name="origin" value="${vo.code }">
        <div class="mb-3 mt-5">
            <label class="form-label">USERNAME</label>
            <input type="text" value="${vo.id }" name="id" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" disabled>
        </div>
        <div class="mb-3">
            <label for="exampleInputPassword1" class="form-label">PASSWORD</label>
            <input type="password" class="form-control" name="pw" id="exampleInputPassword1">
        </div>
        <div class="mb-3">
            <label class="form-label">AGE</label>
            <input type="number" class="form-control" name="age" value="${vo.age }" aria-describedby="emailHelp">
        </div>
        <div class="mb-3">
            <label class="form-label">COMMENT</label>
            <textarea class="form-control" name="comment" >${vo.comment }</textarea>
        </div>
        <div class="mb-3">
            <label class="form-label">USERPIC (${vo.img })</label>
            <input type="file" class="form-control" id="exampleInputEmail1" name="upic" aria-describedby="emailHelp">
        </div>
        <div class="text-end">
            <a href="/examjsp01/survey/page/acc/info.jsp?user=${vo.id }"><button type="button" class="btn btn-dark">BACK</button></a>
            <input type="button" value="UPDATE" onclick="update()" class="btn btn-dark">
        </div>
    </div>
</form>
<script>
  function update(){
    
    if(document.updateForm.pw.value==""){
        alert("비밀번호를 입력해 주세요.");
        document.regForm.pw.focus();
        return;
    }
	if(document.updateForm.age.value==""){
	        alert("나이를 입력해 주세요.");
	        document.regForm.age.focus();
	        return;
	    }
	if(document.updateForm.comment.value==""){
	        alert("comment를 입력해 주세요.");
	        document.regForm.comment.focus();
	        return;
	    }
   
   
    document.updateForm.submit();
}
  </script>
</body>
</html>