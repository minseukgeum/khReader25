<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reader들을 위한 Reader 25</title>

<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/signup.css">

<style>
.outer{
		width: 700px; height: 900px; font-size: 13px;
		margin-left: auto; margin-right: auto; margin-top: 5%; 
		margin-bottom: 50px;
		}
</style>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<%-- <%@ include file="../common/menubar.jsp" %> --%>
	
	<div class="outer">
				
		<form action="<%= request.getContextPath() %>/insert.me" method="post" id="joinForm" name="joinForm" onsubmit="return send(this);">
			<br>
			<h2 class="txt_signup">회원가입 . . .</h2>
			<hr><br>
			<table align="center">
				<tr>
					<td class="txt_signup_tb">아이디</td>
					<td width="200px"><input type="text" id= "joinMemberid" name="joinMemberid" placeholder="6자 이상의 영문+숫자" required></td>
					<td width="150px"><input type="button" class="btn_sign_input" id="idCheck" onclick="idCheck();" value="중복확인"></td>
				</tr>
				<tr>
					<td class="txt_signup_tb">이름</td>
					<td><input type="text" name="joinMembername" required></td>
					<td></td>
				</tr>
				<tr>
					<td class="txt_signup_tb">비밀번호</td>
					<td><input type="password" class="joinPassword" id="joinPassword1" name="joinPassword1" required></td>
					<td rowspan="2"><label id="pwResult"></label></td>
				</tr>
				<tr>
					<td class="txt_signup_tb">비밀번호 확인</td>
					<td><input type="password" class="joinPassword" id="joinPassword2" name="joinPassword2" required></td>
				</tr>
				<tr>
					<td class="txt_signup_tb">연락처</td>
					<td><input type="tel" maxlength="11" name="joinPhone" placeholder="(-없이)01012345678"></td>
					<td></td>
				</tr>
				<tr>
					<td class="txt_signup_tb">우편번호</td>
					<td><input type="text" id="userPostal" name="joinPostal" readonly></td>
					<td><input type="button" class="btn_sign_input" id="findPostal" onclick="ifindPostal();" value="검색"></td>
				</tr>
				<tr>
					<td class="txt_signup_tb">주소</td>
					<td><input type="text" id="joinAddress1" name="joinAddress1" readonly></td>
					<td><span id="guide" style="color:#999;display:none"></span></td>
				</tr>
				<tr>
					<td class="txt_signup_tb">상세주소</td>
					<td><input type="text" id="joinAddress2" name="joinAddress2"></td>
					<td></td>
				</tr>
				<tr>
					<td class="txt_signup_tb">이메일</td>
					<td><input type="email" id="joinEmail" name="joinEmail"></td>
					<td><input type="button" class="btn_sign_input" id="emailCheck" onclick="emailCheck();" value="중복확인"></td>
				</tr>
				<tr>
					<td class="txt_signup_tb">성별</td>
					<td><input type="radio" id="male" name="gender" value="M">남자<input type="radio" id="female" name="gender" value="F">여자</td>
					<td></td>
				</tr>
				<tr>
					<td class="txt_signup_tb">생년월일</td>
					<td><input type="date" name="joinMemberDate"></td>
					<td></td>
				</tr>
				<tr>
					<td class="txt_signup_tb">MBTI</td>
					<td><input type="text" name="joinMemberMbti"></td>
					<td></td>
				</tr>
			</table>
			
			<br><hr><br>
			
			
			<br clear="all">
			
			<div class="btns" id="signUpBtns" align="center">
				<table>
					<tr>
						<td width="300" align="center">
							<button style="cursor:pointer" id="btn1" type="submit" class="btn1"><span>가입하기</span></button>
						</td>
						<td width="300" align="center">
							<input class="btn2" type="submit" id="signUpBtn" value="메인으로">
						</td>
					</tr>
				</table>
				
			</div>
			
		</form>
		
	</div>
	
	
	<script>
	
	function ifindPostal() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if (extraRoadAddr !== '') {
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('userPostal').value = data.zonecode;
                document.getElementById("joinAddress1").value = roadAddr;
				//document.getElementById("joinAddress2").value = data.jibunAddress;
				document.getElementById("joinAddress2").value = "";

                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if (roadAddr !== '') {
                    document.getElementById("joinAddress1").value += extraRoadAddr;
                } else {
                    document.getElementById("joinAddress1").value += '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if (data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if (data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
	
	function idCheck(){
		window.open('checkIdForm.me', 'checkIdForm', 'width=400 , height=520 , top=100, left=200');
	}
	
	function emailCheck(){
		window.open('emailCheckForm.me', 'emailCheckForm', 'width=400 , height=520 , top=100, left=200');
	}
	
	</script>
	
	
	<%-- <%@ include file="../common/footer.jsp" %> --%>


</body>
</html>