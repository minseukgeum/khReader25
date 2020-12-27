<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<form action="login.me" method="post" id="login">
		
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
							<input type="text" name="id" size="20" tabindex="1" placeholder="아이디를 입력하세요">
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
							<input type="password" name="pwd" size="20" tabindex="2" placeholder="비밀번호를 입력하세요">
						</div>
					</td>
				</tr>
				<tr>
					<td>
					</td>
					<td>
						<div class="login_search">
							<a class="link" style="cursor:pointer" onclick="location.href='searchUserForm.me'">아이디 | 비밀번호 찾기 </a>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button style="cursor:pointer" id="btn2" type="submit" class="btn2"><span class="txt_type">로그인</span></button>
					</td>
				</tr>
			</table>

		</form>
			<table class="login_put">
				<tr>
					<td width="200px">
					</td>
					<td colspan="2" align="center">
						<button style="cursor:pointer" id="btn1" class="btn1" onclick="location.href='signUpForm.me'"><span class="txt_type">회원가입</span></button>
						<button style="cursor:pointer" id="btn3" class="btn3" onclick="location.href='home.me'"><span class="txt_type">메인으로</span></button>
					</td>
				</tr>
			</table>
	</div>
	<br><br><br><br><br><br><br><br><br>
	
	

	<%-- <%@ include file="../common/footer.jsp" %> --%>
	
</body>
</html>