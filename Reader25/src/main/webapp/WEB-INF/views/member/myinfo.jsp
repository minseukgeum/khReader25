<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reader들을 위한 Reader 25</title>
<style type="text/css">
.outer{
		width: 900px; min-height: 400px; margin-left: auto; margin-right: auto; 
		margin-top:100px; margin-bottom: 5%;
	}
.hidden { visibility:hidden;  }
.button { font-size:24px; cursor:pointer;  }
.box_modal { position:fixed; display:block; width:450px; 
            height:500px; top:20%; left:40%;
            transform:scale(0,0); visibility:hidden; 
            margin-top:-75px; margin-left:-150px;
            background:#FFD8D8; 
            border:1px solid #CC3D3D;
            overflow:hidden;
            opacity:0.6;
            transition:all 0.2s ease; 
              }
.box_modal:hover { opacity:1; }  
.closer { position:absolute; width:30px; 
             height:30px; top:0; right:0;
             background:#eee; 
             border-left:1px solid #386980; 
             border-bottom: 1px solid #386980;
             text-align:center;
             }
.text { display:inline-block; 
          padding:20px; }
.text h3 { font-size:20px; }
.text p { font-size:14px; }
input[type=checkbox]:checked + .box_modal {
  visibility:visible; transform:scale(1,1);
}        
</style>
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	
	<div class="outer">
	
	<h1 align="center">${ loginUser.name }님의 정보 서랍</h1>
	
		<div class="centerText">
			<table id="myInfoTable" border="1px" align="center">
				<tr>
					<th>아이디</th>
					<td>${ loginUser.id }</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${ loginUser.name }</td>
				</tr>
				<tr>
					<th>성별</th>
					<c:if test="${ loginUser.gender eq 'M'}">
						<td>남성</td>
					</c:if>
					<c:if test="${ loginUser.gender eq 'F'}">
						<td>여성</td>
					</c:if>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>${ loginUser.birthDay }</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>${ loginUser.email }</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>${ loginUser.phone }</td>
				</tr>
				<tr>
					<th>MBTI</th>
					<td>${ loginUser.mbti }</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<c:forTokens var="addr" items="${ loginUser.address }" delims="/" varStatus="status">
							<c:if test="${ status.index eq 0 && addr >= '0' && addr <= '99999' }">
								(${ addr })<br>
							</c:if>
							<c:if test="${ status.index eq 0 && !(addr >= '0' && addr <= '99999') }">
								${ addr }<br>
							</c:if>
							<c:if test="${ status.index eq 1 }">
								${ addr }<br>
							</c:if>
							<c:if test="${ status.index eq 2 }">
								${ addr }<br>
							</c:if>
						</c:forTokens>
					</td>
				</tr>
			</table>
			<br><br>
			<table border="1px" align="center">	
				<tr>
					<td colspan="2" align="center">					
						<button id="changePw" type="button" onclick="mupdateMD_click()"><label for="modal">정보수정</label></button>
						<c:url var="mdelete" value="mdelete.me">
							<c:param name="id" value="${ loginUser.id }"/><!-- 넘어갈 값이 있으니 param을 넣게 c:url -->
						</c:url>
						<button type="button" onclick="location.href='${ mdelete }'">회원탈퇴</button>
					</td>
				</tr>
			</table>
		</div>
	
	</div>
	
<!-- 내 정보 변경 모달창 -->
  <input type="checkbox" id="modal" class="hidden">
  <div class="box_modal">
      <label for="modal" class="closer">x</label>
      <div class="text">
		<br>
           <h4><b>${ loginUser.name }님의 정보 변경</b></h4>
           <br>
			<div>
				<input type="text" id="inputName" name="inputPw" placeholder="변경할 이름을 입력해주세요">
				<br>
				<input type="text" id="inputEmail" name="inputEmail" placeholder="변경할 이메일을 입력해주세요.">
				<br>
				<input type="text" id="inputPhone" name="inputPhone" placeholder="변경할 연락처를 입력해주세요.">
				<br>
				<input type="text" id="inputMbti" name="inputMbti" placeholder="변경할 MBTI를 입력해주세요.">
			</div>
			
			<button id="changeBtn" type="button" onclick="changePw_click()" class="btn1">확인</button>
			
            <h2 id="pw_change_value"></h2>

       </div>
  </div>
</body>
</html>