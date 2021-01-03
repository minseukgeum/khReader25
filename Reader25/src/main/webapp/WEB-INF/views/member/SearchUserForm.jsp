<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reader들을 위한 Reader 25</title>

<link rel="stylesheet" href="${contextPath}/resources/css/member/searchUserForm.css" type="text/css">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<style>
.outer { display:block; position:fixed; 
           text-align:center; 
           padding-top:80px; 
           width: 900px; min-height: 400px; margin-left: auto; margin-right: auto; 
			margin-top:8%; margin-bottom: 10%;
           font-family: 카페24 아네모네에어; font-size:25px;}
</style>
</head>
<body>
<c:import url="../common/menubar.jsp"/>

  <div class="outer">
  	<h3>아이디/비밀번호 찾기</h3>
				<div style="margin-bottom: 10px;" class="radio_div">
					<input type="radio" id="search_1" name="search_total" onclick="search_check(1)" checked="checked">
					<label for="search_1">아이디 찾기</label>
				</div>
				<div class="radio_div">
					<input type="radio" id="search_2" name="search_total" onclick="search_check(2)"> 
					<label for="search_2">비밀번호 찾기</label>
				</div>
				<br>
				<div id="searchI">
					<div class="form-group">
						<label class="font-weight-bold text-white" for="inputName_1">이름</label>
						<div>
							<input type="text" class="form-control" id="inputName_1" name="inputName_1" placeholder="ex) 김건강">
						</div>
					</div>
					<br>
					<div class="form-group">
						<label class="font-weight-bold text-white" for="inputPhone_1">휴대폰번호</label>
						<div>
							<input type="text" class="form-control" id="inputPhone_1" name="inputPhone_1" placeholder="ex) 010-7777-9999">
						</div>
					</div>
					<br><br>
					<div class="form-group">
						<button id="searchBtn" type="button" onclick="idSearch_click()" class="btn btn-primary btn-block"><label for="modal">확인</label></button>
						<button  style="cursor:pointer" id="btn3" class="btn3" onclick="location.href='loginView.me'"><span class="txt_type">취소</span></button>
					</div>
				</div>
				<div id="searchP" style="display: none;">
					<div class="form-group">
						<label class="font-weight-bold text-white" for="inputId">아이디</label>
						<div>
							<input type="text" class="form-control" id="inputId_2" name="inputId_2" placeholder="ex) asdfg">
						</div>
					</div>
					<br>
					<div class="form-group">
						<label class="font-weight-bold text-white" for="inputEmail_2">이메일</label>
						<div>
							<input type="email" class="form-control" id="inputEmail_2"	name="inputEmail_2" placeholder="ex) E-mail@gmail.com">
						</div>
					</div>
					<br><br>
					<div class="form-group">
						<button id="searchBtn2" type="button" onclick="pwSearch_click()" class="btn1"><label for="modal2">확인</label></button>
						<button style="cursor:pointer" id="btn3" class="btn3" onclick="location.href='loginView.me'"><span class="txt_type">취소</span></button>
  					</div>
         
  				</div>
  	</div>

<!-- 아이디 찾기 모달창 -->
  <input type="checkbox" id="modal" class="hidden">
  <div class="box_modal">
      <label for="modal" class="closer">x</label>
      <div class="text">
		
           <h4><b>찾으시는 아이디는</b></h4>
           
           <h2 id="id_value"></h2>
           
           <h4><b>입니다 ^-^</b></h4>

       </div>
  </div>
  
<!-- 비밀번호 찾기 모달창 -->
  <input type="checkbox" id="modal2" class="hidden">
  <div class="box_modal2">
      <label for="modal2" class="closer">x</label>
      <div class="text">
		
           <h4><b>임시 비밀번호는</b></h4>
          
           <h2 id="pw_value"></h2>
          
           <h4><b>입니다 ^-^</b></h4>
         
           <h4><b>로그인 후 비밀번호 변경을 해주세요</b></h4>

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
	
	// 아이디 값 저장하기 위한 변수
	var idV = "";
	// 아이디 값 받고 출력하는 ajax
	var idSearch_click = function(){
		
		var inputName_1 = $('#inputName_1').val();
		var inputPhone_1 = $('#inputPhone_1').val();
		
		$.ajax({
			type:"POST",
			url: 'userSearch.me',
			data: {inputName_1:inputName_1, inputPhone_1:inputPhone_1},
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
	
	// 비밀번호 값 받고 출력하는 ajax
	var pwSearch_click = function(){
		
		var inputId_2 = $('#inputId_2').val();
		var inputEmail_2 = $('#inputEmail_2').val();
		
		$.ajax({
			type:"POST",
			url: 'pwSearch.me',
			data: {inputId_2:inputId_2, inputEmail_2:inputEmail_2},
			success:function(data){
				if(data == null){
					$('#pw_value').text("다시 시도해주세요.");	
				} else {
					$('#pw_value').text(data);
				}
			}
		});
	}

</script>

</html>