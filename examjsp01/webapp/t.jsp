<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/survey/template/navbar.jsp"></jsp:include>
	<div class="container mt-5 mb-5" style="font-size: 20px; font-weight: bold; width: 80%;">
        <h1><b>Topic 작성</b></h1>
        <form method="post" action="tre.jsp">
            

            <div class="text-center">
                <button type="button" onclick="make()" class="btn btn-dark">항목 입력</button>
            </div>
            <div class="row" id="here">
                
            </div>   

            <div class="text-end mt-3">
                <button class="btn btn-success" type="submit">생성</button>
            </div>
        </form>
    </div>
</body>
	<script>
	    function make(){
	        d = document.getElementById("here")
	        n = document.createElement("div")
	        n.setAttribute('class', 'col-lg-4 mt-2')
	        n.innerHTML ='<input type="text" name="chname" class="form-control mt-5" placeholder="입력하세요">\
	                    \<textarea class="form-control" name="chcon" placeholder="설명해주세요"></textarea>'
	        d.appendChild(n)
	    }	
	</script>
</html>