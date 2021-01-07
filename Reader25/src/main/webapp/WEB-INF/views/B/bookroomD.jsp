<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP&Servlet</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<style>
	 body{
		background:url('<%= request.getContextPath() %>/images/bg.png') no-repeat center center fixed;
		background-size: cover;
	}  
	img{
		align="center"
	}
	.loginArea{float: right;}
	#loginTable{text-align: right;}
	#loginTable td:nth-child(1){padding-right: 15px;}
	.loginBtns{float: right; margin-left: 5px;}
	#loginBtn, #myPageBtn{background: #D1B2FF;}
	#joinBtn, #logoutBtn{background: #B2CCFF;}
	input[type=button], input[type=submit]{cursor: pointer; border-radius: 15px; color: white;}
	#userInfo label{font-weight: bold;}

	.wrap{background: #F5715C; width: 100%; height: 50px;}
	.menu{
		background: #F5715C; color: white; text-align: center; font-weight: bold; 
		vertical-align: middle; width: 150px; height: 50px; display: table-cell;
	}
	nav{width: 600px; margin-left: auto; margin-right: auto;}
	.menu:hover {background: beige; color:orangered; font-weight:bold; cursor:pointer;}
 
 /*        상세조회                  */
  
 .outer2 {
      width: 100%; min-height:auto; background: rgba(255, 255, 255, 0.4); border: 5px solid white;
      margin-left:auto; margin-right:auto; margin-top:50px; align: center;
   }
   .detail{text-align:left;}
   .detail td{width: 400px; background: rgba(255, 255, 255, 0.4); font-family: "나눔스퀘어"; font-size: 15px; margin-left: 10px;}
   .th{width: 60px; background: rgba(255, 255, 255, 0.4); font-family: "나눔스퀘어"; font-size: 15px; color:gray;}
   #title{backgroung: white;}
   .th{color: #F5715C; text-align: left;}
   #titleImgArea{width:400px; height:500px; margin-left:auto; margin-right:auto;}
   #titleImg{width:350px; height:450px;}
   #contentArea{width: 300px; height:200px; border: none; font-family: "나눔스퀘어"; font-weight: bold; font-size: 17px; color:gray; resize: none; outline: none; line-height :25px;}
   .detailImgArea{width:833px; height:auto; margin-left:auto; margin-right:auto; margin-top: 50px; margin-bottom: 50px;}
   .detailImg{width:833px; height:auto; align:center;}
   .downBtn{background: #D1B2FF;}
   #thumbTable{margin: auto;}
   #title{font-family: "나눔스퀘어"; font-size: 25px; color: #3c3c3c; font-weight: bold;}
   hr {width: 833px; align: center; margin-top:50px;}
   .replyArea{margin-bottom: 20px;}
   .button{border: none; background: #F5715C; border-radius: 10px; color: white; width: 60px; height: 30px; text-align: center; font-family: "나눔스퀘어";}
   #replyInsert, #replySelectTable{font-family: "나눔스퀘어";}
   #replyDeleteBtn{background: rightgray;}
 

 
 /*    footer    */
footer{
	position:absolute;
	width: 100%;
	height: 270px;
	background-color: #F5715C; color: white;
	padding-top: 30px;
}
#bottom_logo{
	display: inline-block;
	width: 346px;
	height: 77px;
}

#notice{
	display: inline-block;
	width: 800px;
	color: white;
	padding:3px 2px 0 10px;
	/*출력할 문자의 위치 ( 위쪽에서 3px , 오른쪽 2px , 아래쪽 0 , 왼쪽 30px만큼 공간을 띄고 출력)  */
	font-family: NanumGothic;
	font-size: 15px;
	font-weight:bold;
	line-height: 18px;
	letter-spacing: 3px;
}

#list-all-div{
left: 100px;

}
</style>
</head>
<body>
	<br>
	<div class="top_logo">
	<img src="${ pageContext.servletContext.contextPath }/images/Logo2.png"
		style="display: block; margin: 0 auto;"  width="210" height="45" >
	</div>			
	<div class="loginArea">		
		<form id="loginForm" action="<%= request.getContextPath() %>/login.me" method="post">
			<table id="loginTable">
				<tr>
					<td><label>ID</label></td>
					<td><input type="text" name="userId" id="userId"></td>
				</tr>
				<tr>
					<td><label>PWD</label></td>
					<td><input type="password" name="userPwd" id="userPwd"></td>
				</tr>
			</table>
			<div class="loginBtns">
				<input type="submit" id="loginBtn" value="로그인">
				<input type="button" id="joinBtn" value="회원가입" onclick="memberJoin();">
			</div>
		</form>		
	</div>	
	<br clear="all">
	<br>
	<div class="wrap">
		<nav>
			<div class="menu" onclick="goHome();">HOME</div>
			<div class="menu" onclick="goNotice();">토론 게시판</div>
			<div class="menu" onclick="goBoard();">책을 읽고</div>
			<div class="menu" onclick="goThumbnail0();">오늘 의작가</div>
			<div class="menu" onclick="goThumbnail1();">책 사고팔기</div>
		</nav>
	</div>
	<br><br>	  
	   <div class="outer2">
   <form action="<%= request.getContextPath() %>/boardUpdateForm.memberR" id="detailForm" method="post">
      <table class="detail" id="thumbTable">
         <tr>
            <td rowspan="5">
               <div id="titldImgArea" align="center">
                  <img id="titleImg" src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%-- <%= titleImg.getChangeName() %> --%>">
               </div>
            </td>
            <th colspan="2" id="title"><%-- [<%= b.getBoardTitle() %>] --%></th>
         </tr>
         <tr>
            <th class="th">작성자</th>
            <td>
            	<%-- <%= b.getBoardWriter() %> --%>
            	<input type="hidden" name="bId" value="<%-- <%= b.getBoardId() %> --%>">
            </td>
         </tr>
         <tr>
            <th class="th">작성일</th>
            <td><%-- <%= b.getCreateDate() %> --%></td>
         </tr>
         <tr>
            <th class="th">책<br>소　개</th>
            <td>
               <textarea id="contentArea" readonly><%-- <%= b.getBoardContent() %> --%></textarea>
            </td>
         </tr>
      </table>
      <br><br>
      <div align="center">
            <%-- 글 쓴 사람만 볼 수 있도록~! --%>
            <%-- <% if(loginUser != null && loginUser.getMemberid().equals(b.getBoardWriter())) { %> --%>
               <input type="submit" class="button" id="updateBtn" value="수정">
               <input type="button" onclick="deleteBoard();" class="button" id="deleteBtn" value="삭제" >
            <%-- <% } %> --%>   
            
               <input type="button" onclick="location.href='<%= request.getContextPath() %>/list.memberR'" id="menuBtn" class="button" value="메뉴로">
            </div>
         </form>
      <hr>
        <%--  <% for(int i = 1; i < fileList.size(); i++){ %> --%>
               <div class="detailImgArea">
                  <img id="detailImg" class="detailImg" 
                     src="<%= request.getContextPath() %>/thumbnail_uploadFiles/<%-- <%= fileList.get(i).getChangeName() %> --%>">
               </div>
         <%-- <% }  %> --%>
      </div>
      
      <div class="replyArea" align="center">
         <div class="replyWriterArea">
            <table>
               <tr>
                  <td id="replyInsert">댓글 작성</td>
                  <td><textarea rows="3" cols="80" id="replyContent" style="resize: none;"></textarea></td>
                  <td><button class="button" id="addReply">등록</button></td>
               </tr>
            </table>
         </div>
         <div id="replySelectArea">
            <table id="replySelectTable">
               <%-- <% if(list.isEmpty()) { %> --%>
                  <tr><td colspan="3">댓글이 없습니다.</td></tr>
             <%--   <% } else { %> --%>
                  <%-- <% for(int i = 0; i < list.size(); i++) { %> --%>
                     <tr>
                        <td width="100px"><%-- <%= list.get(i).getReplyWriter() %> --%></td>
                        <td width="400px"><%-- <%= list.get(i).getReplyContent() %> --%></td>
                        <td width="200px"><%-- <%= list.get(i).getCreateDate() %> --%></td>
                        <td>
                        <%-- <% if(loginUser != null && loginUser.getMemberid().equals(list.get(i).getReplyWriter())) { %> --%>
              			   <input type="button" onclick="replyDelete(<%-- <%= list.get(i).getrId() %> --%>);" class="button" id="replyDeleteBtn" value="삭제">
              			   <input type="hidden" name="rId" value="<%-- <%= list.get(i).getrId() %> --%>">
          			    <%-- <% } %> --%>
          			    </td> 
                     </tr>
                 <%--  <% } %> --%>
               <%-- <% } %> --%>
            </table>
         </div>
      </div>
      </p>
	<!-- outer마지맘ㄱ -->
	 <br><br><br><br><br><br><br><br>
	 <br><br><br><br><br><br><br><br>
	 <br><br><br><br><br><br><br><br> 
	<br><br><br><br><br>
	<footer>
	<div class="footer">
			<div class="frame botton_area">
				<div id="bottom_logo">
				<img src="${ pageContext.servletContext.contextPath }
				/images/Logo2.png"style="float: left;  margin: 0 auto;"  
				width="210" height="45" ></div>
				<br>
				<div id="notice">
					레시피팩토리에 게시된 모든 컨텐츠들은 저작권법에 의거 보호받고 있습니다. <br> 저작권자 또는
					(주)레시피팩토리의 승인없이 컨텐츠의 일부 또는 전부를 복제,전송,배포 및 기타의 방법으로 저작물을 이용할 경우에는<br>
					저작권법에 의해 법적 조치에 처해질 수 있으므로 주의하시길 바랍니다. <br> <br> 사업자등록번호:
					111-22-33333 통신판매업신고번호 : 제1111-서울역삼-2222호 대표 : 금민석 <br> 주소 :
					서울시 역삼동 어쩌주 저쩌구 고객센터: 1234-1004 <br> <br> <b>ⓒ 2020
						Recipe Factory Corp. Ltd. All rights reserved</b>
				</div>
			</div>
		</div>
	</footer>
	<script>
		function logout(){
			location.href='<%= request.getContextPath() %>/logout.me';
		}
		
		function memberJoin(){
			location.href="<%= request.getContextPath() %>/signUpForm.me";
		}
		
		function goHome(){
			location.href='<%= request.getContextPath() %>';
		}
		
		function goNotice(){
			location.href='<%= request.getContextPath() %>/list.no';
		}
		
		function goBoard(){
			location.href='<%= request.getContextPath() %>/list.bo';
		}
		
		function goThumbnail0(){
			location.href='<%= request.getContextPath() %>/list.th';
		}
		function goThumbnail1(){
			location.href='<%= request.getContextPath() %>/list.th';
		}
		function noticeboard(){
			location.href="<%= request.getContextPath() %>/NoticeListServlet.no";
		}
		
		function qna(){
		      location.href="<%=request.getContextPath() %>/QboardListServlet.qb";
		}
		<%-- function fqna(){
			location.href="<%= request.getContextPath()%>/FAQListServlet.fa";
		} --%>
	</script>
</body>
</html>