<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reader들을 위한 Reader 25</title>
<link rel="stylesheet" href="${contextPath}/resources/css/mypage.css" type="text/css">
<style type="text/css">
.outer{
		width: 900px; min-height: 400px; margin-left: auto; margin-right: auto; 
		margin-top:100px; margin-bottom: 5%;
	}
#myimg{
		width: 200px; height: 200px;
		border-radius:100px;
	}
.hidden { visibility:hidden;  }
.button { font-size:24px; cursor:pointer;  }
.box_modal { position:fixed; display:block; width:350px; 
            height:250px; top:50%; left:50%;
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
		
		<table border="1px" align="center">
			<tr>
				<td colspan="8" rowspan="3" width="320px" height="250px" align="center"><img id="myimg" alt="기본이미지" src="resources/images/logo/Leader25.jpg"></td>
				<td colspan="4" width="160px">${ loginUser.name }</td>
				<td colspan="6" rowspan="3" width="240px">
					<button id="changePw" type="button" onclick="changePwMD_click()"><label for="modal">비밀번호 변경</label></button>
				</td>
			</tr>
			<tr>
				<td colspan="4" width="160px">${ loginUser.phone }</td>
			</tr>
			<tr>
				<td colspan="2" width="80px">${ loginUser.point }</td>
				<td colspan="2" width="80px">
					<c:choose>
						<c:when test="${ loginUser.rank == 0 }">
							종이
						</c:when>
						<c:when test="${ loginUser.rank == 1 }">
							브론즈
						</c:when>
						<c:when test="${ loginUser.rank == 2 }">
							실버
						</c:when>
						<c:when test="${ loginUser.rank == 3 }">
							골드
						</c:when>
						<c:when test="${ loginUser.rank == 4 }">
							다이아
						</c:when>
					</c:choose>
				</td>
			</tr>
		</table>
		
		<table border="1px" align="center">
			<tr>
				<td colspan="6" width="240px" height="150px">
					<c:url var="myinfo" value="myinfo.me"/>
					<button onclick="location.href='${myinfo}'">내 정보 보기</button>
				</td>
				<td colspan="6" width="240px">포인트 내역</td>
				<td colspan="6" width="240px">내 서재</td>
			</tr>
		</table>
	</div>
	
	<!-- 비밀번호 변경 모달창 -->
  <input type="checkbox" id="modal" class="hidden">
  <div class="box_modal">
      <label for="modal" class="closer">x</label>
      <div class="text">
		<br>
           <h4><b>비밀번호 변경</b></h4>
           <br>
			<div>
				<input type="text" id="inputPw" name="inputPw" placeholder="현재 비밀번호를 입력해주세요.">
				<br>
				<input type="text" id="newPw" name="newPw" placeholder="변경할 비밀번호를 입력해주세요.">
			</div>
			
			<button id="changeBtn" type="button" onclick="changePw_click()" class="btn1">확인</button>
			
            <h2 id="pw_change_value"></h2>

       </div>
  </div>
	
</body>

<script>

//비밀번호 값 받고 판단해서 변경 결과 출력하는 ajax
var changePw_click = function(){
	
	var inputPw = $('#inputPw').val();
	var newPw = $('#newPw').val();
	
	$.ajax({
		type:"POST",
		url: 'mChangePw.me',
		data: {inputPw:inputPw, newPw:newPw},
		success:function(data){
			if(data == null ){
				$('#pw_change_value').text("다시 시도해주세요.");	
			} else {
				$('#pw_change_value').text("비밀번호 변경에 성공하였습니다.");
			}
		}
	});
}



</script>

</html>