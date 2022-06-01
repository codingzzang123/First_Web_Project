function idCheck(id){
	
		if(id==""){ 
	        alert("아이디를 입력해 주세요.");
	        document.regForm.id.focus();
	        
	    }else{
			var popWidth = 200;
	        var popHeight = 100;
	        var winHeight = document.body.clientHeight;    // 현재창의 높이
	        var winWidth = document.body.clientWidth;    // 현재창의 너비
	        var winX = window.screenLeft;    // 현재창의 x좌표
	        var winY = window.screenTop;    // 현재창의 y좌표
	        var popX = winX + (winWidth - popWidth)/2;
	        var popY = winY + (winHeight - popHeight)/2;
		
			url = "/examjsp01/survey/handle/handleIdCheck.jsp?id="+id;
		    
			window.open(url,"post",
				"left="+popX+",top="+popY+",width="+popWidth+", height="+popHeight);
		}
		
	
		
	}	


function inputCheck(){
    if(document.loginForm.id.value==""){
        alert("아이디를 입력해 주세요.");
        document.regForm.id.focus();
        return;
    }
    if(document.loginForm.pw.value==""){
        alert("비밀번호를 입력해 주세요.");
        document.regForm.pw.focus();
        return;
    }
   
   
    document.loginForm.submit();
}

function update(){
    if(document.updateForm.id.value==""){
        alert("아이디를 입력해 주세요.");
        document.regForm.id.focus();
        return;
    }
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


	