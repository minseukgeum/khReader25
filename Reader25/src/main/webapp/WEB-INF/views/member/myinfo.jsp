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
								(${ addr })
							</c:if>
							<c:if test="${ status.index eq 0 && !(addr >= '0' && addr <= '99999') }">
								${ addr }
							</c:if>
							<c:if test="${ status.index eq 1 }">
								${ addr }
							</c:if>
							<c:if test="${ status.index eq 2 }">
								${ addr }
							</c:if>
						</c:forTokens>
					</td>
				</tr>
			</table>
			<br><br>
			<table border="1px" align="center">	
				<tr>
					<td colspan="2" align="center">					
						<button type="button" onclick="location.href='mpwdUpdateView.me'">비밀번호수정</button>
						<button type="button" onclick="location.href='mupdateView.me'">정보수정</button>
						<c:url var="mdelete" value="mdelete.me">
							<c:param name="id" value="${ loginUser.id }"/><!-- 넘어갈 값이 있으니 param을 넣게 c:url -->
						</c:url>
						<button type="button" onclick="location.href='${ mdelete }'">회원탈퇴</button>
					</td>
				</tr>
			</table>
		</div>
	
	</div>

</body>
</html>