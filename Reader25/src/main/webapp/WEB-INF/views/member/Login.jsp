<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reader들을 위한 Reader 25</title>

<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/login.css">

<style>
.outer{
		width: 900px; min-height: 400px; margin-left: auto; margin-right: auto; 
		margin-top:100px; margin-bottom: 5%;
	}
</style>
</head>
<body>
	<%-- <%@ include file="../common/menubar.jsp"%> --%>

	<div class="outer">
		<form action="<%=request.getContextPath()%>/login.me" method="post" id="login">
		
			<h2 class="txt_login" align="center">로그인</h2>
			<br>
			<table class="login_put">
				<tr>
					<td width="200px">
						<div class="txt_login_div">
							아이디
						</div>
					</td>
					<td width="400px">
						<div class="input_id">
							<input type="text" name="userId" size="20" tabindex="1" placeholder="아이디를 입력하세요" required>
						</div>
					</td>
				</tr>
				<tr>
					<td width="200px">
						<div class="txt_login_div">
							비밀번호
						</div>
					</td>
					<td>
						<div class="input_pw">
							<input type="password" name="userPwd" size="20" tabindex="2" placeholder="비밀번호를 입력하세요" required>
						</div>
					</td>
				</tr>
				<tr>
					<td>
					</td>
					<td>
						<div class="login_search">
							<a class="link" style="cursor:pointer" onclick="searchId();">아이디 찾기</a><span> | </span>
							<a class="link" style="cursor:pointer" onclick="searchPw();">비밀번호찾기</a>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button style="cursor:pointer" id="btn1" type="submit" class="btn1"><span class="txt_type">회원가입</span></button>
						<button style="cursor:pointer" id="btn2" class="btn2" onclick="memberSignUp();"><span class="txt_type">로그인</span></button>
						<button style="cursor:pointer" id="btn3" class="btn3" onclick="goMain();"><span class="txt_type">메인으로</span></button>
					</td>
				</tr>
			</table>

		</form>
	</div>
	<br><br><br><br><br><br><br><br><br>
	
	

	<%-- <%@ include file="../common/footer.jsp" %> --%>
	
	<script>
		function memberSignUp(){//이렇게
		    location.href='<%=request.getContextPath() %>/signUpForm.me';
		};
		
		function goMain(){
		    location.href='<%=request.getContextPath() %>/main.me';
		};
		
		function searchId(){
			window.open("searchIdForm.me", "SearchIdForm", 'width=400 , height=520 , top=100, left=200');
		};
		
		function searchPw(){
			window.open("searchPwForm.me", "SearchPwForm", 'width=400 , height=520 , top=100, left=200');
		};
	</script>
</body>
</html>