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

</style>
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	
	<div class="outer">
		
		<table border="1px" align="center">
			<tr>
				<td colspan="8" rowspan="3" width="240px" height="250px" align="center"><img id="myimg" alt="기본이미지" src="resources/images/logo/Leader25.jpg"></td>
				<td colspan="4" width="120px">이름</td>
				<td colspan="6" rowspan="3" width="180px">비밀번호 변경</td>
			</tr>
			<tr>
				<td colspan="4" width="120px">폰번호</td>
			</tr>
			<tr>
				<td colspan="2" width="60px">포인트</td>
				<td colspan="2" width="60px">레벨</td>
			</tr>
		</table>
		
		<table border="1px" align="center">
			<tr>
				<td colspan="6" width="180px" height="150px">내 정보 보기</td>
				<td colspan="6" width="180px">포인트 내역</td>
				<td colspan="6" width="180px">내 서재</td>
			</tr>
		</table>
		
		
	
	</div>
	
</body>


</html>