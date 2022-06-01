<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8");%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="board.*, user.*, java.util.* " %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#reply{
		font-size:18px;  border:1px solid #ccc;
		border-radius:10px;
		margin-bottom:5px;
	}
	#reReply2{
		font-size:16px;  border:1px solid #ccc;
		border-radius:5px;
		margin-bottom:5px;
		background-color:#dee2e6;
	}
</style>
</head>
<body>
	<%  
		// detail 내용에 대한 변수들
		String user = (String)session.getAttribute("loginID");
		pageContext.setAttribute("user", user);
		
		BoardVO vo = null;
	    BoardDAO dao = BoardDAO.getInstance();
	    int num = Integer.parseInt(request.getParameter("num"));
	    dao.clicks(num); //클릭 수 1증가
	    
	    vo = dao.select(num);
	    String makerP = vo.getMaker();
	    pageContext.setAttribute("detail",vo);
	    pageContext.setAttribute("num",num);
	    
	    // 댓글에 대한 변수들
	    ReplyDAO daoReply = ReplyDAO.getInstance();
	    List<ReplyVO> replys = daoReply.getReplys(num);
	    pageContext.setAttribute("replys", replys);
	    
	    //댓글에 대한 답변?
	   	List<ReplyVO> reReplys = daoReply.reReplys(num);
	   	pageContext.setAttribute("reReplys", reReplys);
	   	
	   	//유저 사진 가져오기
		userDAO udao = userDAO.getInstance();
	   	String code = udao.getPicCode(makerP);
	   	
	   	pageContext.setAttribute("code",code);
	%>
	
	<jsp:include page="/survey/template/navbar.jsp"></jsp:include>
	<%-- 화면 출력 --%>
	<div class="container mt-5 mb-5">
        <h1><b>${detail.subject }</b></h1>
        <br>
        <div class="row">
            <div class="col-lg-8">
               <textarea class="form-control" style="height: 400px;" disabled>${detail.content }</textarea>
            </div>
            <div class="col-lg-4" style="margin:auto">
            	<c:choose>
					<c:when test="${code ne '0.png' }">
						<div class="text-center mt-5">
				            <img src="http://localhost:8080/examjsp01/fileUpload/acc/${code }" class="rounded-circle" width="250px    ">
				        </div>
					</c:when>
					<c:when test="${code eq '0.png' }">
						<div class="text-center mt-5">
				            <img src="http://localhost:8080/examjsp01/fileUpload/acc/default.jfif" class="rounded-circle" width="250px    ">
				        </div>
					</c:when>
				</c:choose>
                <div class="mt-5 text-center">
                    written by <b>${detail.maker }</b>
                </div>
                <div class="mt-2 text-center">
                     ${detail.pubdate } 
                </div>
            </div>
        </div>
        
	
		
		<%-- login user만 수정,삭제 버튼 클릭  --%>
        <div class="text-end mt-5">
            <a href="index.jsp" class="btn btn-dark btn-lg">BACK</a>
            <c:choose>
            	<c:when test="${user ne null }">
            		<c:choose>
            			<c:when test="${user eq detail.maker }">
            				<a href="update.jsp?num=${num }"><button type="button" class="btn btn-primary btn-lg" >
                				MOD</button></a>
            				<a href="/examjsp01/survey/handle/board/delete.jsp?num=${num }&code=${detail.maker}"><button type="button" class="btn btn-danger btn-lg">
                				DEL</button></a>
            			</c:when>
            			<c:when test="${user ne detail.maker }">
            				<a href="#"><button type="button" class="btn btn-primary btn-lg" disabled>
                				MOD</button></a>
		                	<button type="button" class="btn btn-danger btn-lg" disabled>
		                		DEL</button>
            			</c:when>
           			</c:choose>
            	</c:when>
            	<c:when test="${user eq null }">
					<a href="#"><button type="button" class="btn btn-primary btn-lg" disabled>
                		MOD</button></a>
                	<button type="button" class="btn btn-danger btn-lg" disabled>
                		DEL</button>
            	</c:when>
            </c:choose>
        </div>

		<%-- 댓글 출력 --%>
		<div class="row mt-5" >
			<div class="col-lg-8">
				전체 댓글<b> ${detail.replys } </b>개
			</div>
			<div class="col-lg-1"></div>
			<div class="col-lg-1">본문보기</div>
			<div class="col-lg-1">댓글닫기</div>
			<div class="col-lg-1">새로고침</div>
		</div>
		<hr style="background-color:blue; height:3px;">
		
		
		<%-- 댓글 출력 --%>
		<c:set var="i" value="1"/>
		<c:if test="${replys ne null }">
			<c:forEach var="re" items="${replys }">
				<div class="row" id="reply">
					<div class="col-lg-1">${re.maker }</div>
					<div class="col-lg-8" onclick="maketest(${i})">${re.content }
					</div>
					<div class="col-lg-2 text-end">${re.pubdate }</div>
					<c:choose>
						<c:when test="${loginID eq null }"><div class="col-lg-1 text-end"><img src="x.png" width="15" height="15" style="margin-bottom:5px;" /></div></c:when>
						<c:when test="${re.maker ne loginID }"><div class="col-lg-1 text-end"><a href="/examjsp01/error.jsp"><img src="x.png" width="15" height="15" style="margin-bottom:5px;" /></a></div></c:when>
						<c:when test="${re.maker eq loginID }"><div class="col-lg-1 text-end"><a href="/examjsp01/survey/handle/board/replyDelete.jsp?code=${re.order }&num=${num }"><img src="x.png" width="15" height="15" style="margin-bottom:5px;" /></a></div></c:when>
					</c:choose>
				</div>
				<h3>
					<%-- 댓글에 대한 답변.. --%>
					<c:if test="${reReplys ne null }">
						<c:forEach var="r" items="${reReplys }">
							<c:if test="${r.ref eq re.order }">
								<div class="row" id="reReply2" style="margin-left:50px;">
									<div class="col-lg-1">┖ </div>
									<div class="col-lg-1">${r.maker }</div>
									<div class="col-lg-7">${r.content }</div>
									<div class="col-lg-2 text-end">${r.pubdate }</div>
									<c:choose>
										<c:when test="${loginID eq null }"><div class="col-lg-1 text-end"><img src="x.png" width="10" height="10" style="margin-bottom:5px;" /></div></c:when>
										<c:when test="${r.maker ne loginID }"><div class="col-lg-1 text-end"><a href="/examjsp01/error.jsp"><img src="x.png" width="10" height="10" style="margin-bottom:5px;" /></a></div></c:when>
										<c:when test="${r.maker eq loginID }"><div class="col-lg-1 text-end"><a href="/examjsp01/survey/handle/board/reReplyDelete.jsp?code=${r.step }&num=${num }"><img src="x.png" width="10" height="10" style="margin-bottom:5px;" /></a></div></c:when>
									</c:choose>
								</div>
							</c:if>
						</c:forEach>
					</c:if>
				</h3>
				<form action="/examjsp01/survey/handle/board/test.jsp">
					<input type="hidden" name="num" value="${re.num }">
					<input type="hidden" name="order" value="${re.order }">
					<div class="row" id="here${i }" style="margin-left:50px;"></div>
				</form>
				<c:set var="i" value="${i+1 }"/>
			</c:forEach>
        </c:if>
        
        
        
        <hr style="background-color:blue; height:1px;">
        <%-- 댓글 입력  --%>
        <form method="post" action="/examjsp01/survey/handle/board/reply.jsp">
          <div class="row">
              <c:choose>
              	<c:when test="${user ne null }">
	              		<div class="col-lg-8">
	              			<input type="text" name="con" class="form-control" placeholder="댓글을 남겨주세요">
	              		</div>
	              		<div class="col-lg-4">
	              			<input type="hidden" name="number" value="${num }">
	              			<button type="submit" class="btn btn-dark">확인</button>
	            		</div>
              	</c:when>
              	<c:when test="${user eq null }">
              		<div class="col-lg-8">
              			<input type="text" name="com" class="form-control" disabled placeholder="로그인이 필요한 기능입니다">
	              	</div>
              		<div class="col-lg-4">
              			<button class="btn btn-dark" disabled>확인</button>
            		</div>
              	</c:when>
              </c:choose>
          </div>
        </form> 
	
        </div>
	
   		<script>
   		var arr = [];
   	
   		for(var i=0; i<100; i++){
   			arr.push(0);
   		}
   		function maketest(i){
   			var el = "here"+i;
			const div = document.getElementById(el);
   			if(arr[i]>0){
   				if(div.style.display === 'none')  {
					    div.style.display = 'block';
			    }else {
					    div.style.display = 'none';
			    }
   			}
   			
   			if(arr[i]==0){
   				d = document.getElementById(el)
	       		n = document.createElement("div")
		        n.setAttribute('class', 'mt-1')
		        n.innerHTML ='<div style="display: inline-block; margin-right:10px;">┖ </div><div class="col-lg-8" style="display: inline-block"><input type="text" name="con2" class="form-control" placeholder="답글을 입력해주세요🗨"></div><div class="col-lg-3" style="display: inline-block"><button class="btn btn-dark" type="submit" style="margin-left:10px">확인</button></div>'
	       		d.appendChild(n)
		        arr[i]=1;
   			}
   		}
   		
   		var ch1 = 0;
   		var ch2 = 0;
   		var ch3 = 0;
   		function make(i){
   			if(i==1){
   				const div = document.getElementById('here1');
   				if(ch1>0){
   					if(div.style.display === 'none')  {
   					    div.style.display = 'block';
   					  }else {
   					    div.style.display = 'none';
  					  }
   				}
   				if(ch1==0){
   					d = document.getElementById("here1")
		       		n = document.createElement("div")
			        n.setAttribute('class', 'mt-1')
			        n.innerHTML ='<div style="display: inline-block; margin-right:10px;">┖ </div><div class="col-lg-8" style="display: inline-block"><input type="text" name="con2" class="form-control" placeholder="답글을 입력해주세요🗨"></div><div class="col-lg-3" style="display: inline-block"><button class="btn btn-dark" type="submit" style="margin-left:10px">확인</button></div>'
		       		d.appendChild(n)
			        ch1=1;
		        }
   			}else if(i==2){
   				const div = document.getElementById('here2');
   				if(ch2>0){
   					if(div.style.display === 'none')  {
   					    div.style.display = 'block';
   					  }else {
   					    div.style.display = 'none';
   					  }
   				}
   				if(ch2==0){
   					d = document.getElementById("here2")
		       		n = document.createElement("div")
			        n.setAttribute('class', 'mt-1')
			        n.innerHTML ='<div style="display: inline-block; margin-right:10px;">┖ </div><div class="col-lg-8" style="display: inline-block"><input type="text" name="con2" class="form-control" placeholder="답글을 입력해주세요🗨"></div><div class="col-lg-3" style="display: inline-block"><button class="btn btn-dark" type="submit" style="margin-left:10px">확인</button></div>'
		       		d.appendChild(n)
			        ch2=1;
		        }
   			}else if(i==3){
   				const div = document.getElementById('here3');
   				if(ch3>0){
   					if(div.style.display === 'none')  {
   					    div.style.display = 'block';
   					  }else {
   					    div.style.display = 'none';
   					  }
   				}
   				if(ch3==0){
   					d = document.getElementById("here3")
		       		n = document.createElement("div")
		       		n.setAttribute('class', 'mt-1')
			        n.innerHTML ='<div style="display: inline-block; margin-right:10px;">┖ </div><div class="col-lg-8" style="display: inline-block"><input type="text" name="con2" class="form-control" placeholder="답글을 입력해주세요🗨"></div><div class="col-lg-3" style="display: inline-block"><button class="btn btn-dark" type="submit" style="margin-left:10px">확인</button></div>'
		       		d.appendChild(n)
			        ch3=1;
		        }
   			}
	        
	    }
        </script>
</body>
</html>