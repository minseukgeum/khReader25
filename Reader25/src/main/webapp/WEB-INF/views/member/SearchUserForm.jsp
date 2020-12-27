<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String result = (String)request.getAttribute("result"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reader들을 위한 Reader 25</title>

<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/serchId.css">
<script src="https://code.jquery.com/jquery-latest.js"></script>
<style>
 * { margin:0; padding:0; }

.hidden { visibility:hidden;  }
.outer { display:block; position:fixed; 
           top:0; left:0; bottom:0; right:0; 
           text-align:center; 
           padding-top:80px; }
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
  <div class="outer">
  	<h3>아이디/비밀번호 찾기</h3>
				<div style="margin-bottom: 10px;"
					class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="search_1" name="search_total" onclick="search_check(1)" checked="checked">
					<label class="custom-control-label font-weight-bold text-white"	for="search_1">아이디 찾기</label>
				</div>
				<div class="custom-control custom-radio custom-control-inline">
					<input type="radio" class="custom-control-input" id="search_2" name="search_total" onclick="search_check(2)"> 
					<label class="custom-control-label font-weight-bold text-white" for="search_2">비밀번호 찾기</label>
				</div>
				<div id="searchI">
					<div class="form-group">
						<label class="font-weight-bold text-white" for="inputName_1">이름</label>
						<div>
							<input type="text" class="form-control" id="inputName_1" name="inputName_1" placeholder="ex) 김건강">
						</div>
					</div>
					<div class="form-group">
						<label class="font-weight-bold text-white" for="inputPhone_1">휴대폰번호</label>
						<div>
							<input type="text" class="form-control" id="inputPhone_1" name="inputPhone_1" placeholder="ex) 010-7777-9999">
						</div>
					</div>
					<div class="form-group">
						<button id="searchBtn" type="button" onclick="idSearch_click()" class="btn btn-primary btn-block"><label for="modal">확인</label></button>
						<button  style="cursor:pointer" id="btn3" class="btn3" onclick="location.href='loginView.me'"><span class="txt_type">취소</span></button>
					</div>
				</div>
				<div id="searchP" style="display: none;">
					<div class="form-group">
						<label class="font-weight-bold text-white" for="inputId">아이디</label>
						<div>
							<input type="text" class="form-control" id="inputId" name="inputId_2" placeholder="ex) asdfg">
						</div>
					</div>
					<div class="form-group">
						<label class="font-weight-bold text-white" for="inputEmail_2">이메일</label>
						<div>
							<input type="email" class="form-control" id="inputEmail_2"	name="inputEmail_2" placeholder="ex) E-mail@gmail.com">
						</div>
					</div>
					<div class="form-group">
						<button id="searchBtn2" type="button" class="btn1"><label for="modal">확인</label></button>
						<button style="cursor:pointer" id="btn3" class="btn3" onclick="location.href='loginView.me'"><span class="txt_type">취소</span></button>
  					</div>
         
  				</div>
  	</div>

  <input type="checkbox" id="modal" class="hidden">
  <div class="box_modal">
      <label for="modal" class="closer">x</label>
       <div class="text">
           <h4>
				<b>손님 아이디는?</b></span>
			</h4><br>
				<h2 id="id_value"></h2>
			<br>
			<button type="button" id="pwSearch_btn" class="btn peach-gradient btn-rounded waves-effect">
			<i class="fa fa-envelope"></i>비밀번호 찾기</button>

       </div>
  </div>
</body>
<script>
	//체크 버튼에 따라 아이디/비밀번호 기능이 달라진다
	function search_check(num) {
		if (num == '1') {
			document.getElementById("searchP").style.display = "none";
			document.getElementById("searchI").style.display = "";	
		} else {
			document.getElementById("searchI").style.display = "none";
			document.getElementById("searchP").style.display = "";
		}
	}
	
	// 아이디 & 스토어 값 저장하기 위한 변수
	var idV = "";
	// 아이디 값 받고 출력하는 ajax
	var idSearch_click = function(){
		$.ajax({
			type:"POST",
			url:"${pageContext.request.contextPath}/user/userSearch?inputName_1="
					+$('#inputName_1').val()+"&inputPhone_1="+$('#inputPhone_1').val(),
			success:function(data){
				if(data == null){
					$('#id_value').text("회원 정보를 확인해주세요!");	
				} else {
					$('#id_value').text(data);
					// 아이디값 별도로 저장
					idV = data;
				}
			}
		});
	}

</script>

</html>