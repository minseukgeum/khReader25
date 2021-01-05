<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.main{
	width : 1300px;
	margin-top : 200px;
	margin-left : 300px;
	margin-right : 300px;
	background : #f4f4f4;
	}
	.bookInfo{
	 width : 1300px;
	 height : 450px;
	}
	.bookdetailInfo{
	width : 1300px;
	height : 300px;
	}
	.bookreview{
	width : 1300px;
	height : 400px;
	}
	.image{
	width : 500px;
	height : 450px;
	float : left;
	}
	.info{
	float : left;
	width : 500px;
	height : 450px;
	}
	.button_space{
	float : right;
	width : 300px;
	height : 450px;
	}
	#buy_button{
	position : relative;
	top : 280px;
	right : 50px;
	width : 200px;
	height : 50px;
	float : right;
	color: #FFFFFF;
	background: #C95F12;
	font-family: Roboto;
	font-style: normal;
	font-weight: normal;
	font-size: 30px;
	}
	#basket_button{
	position : relative;
	top : 300px;
	right : 50px;
	margin-top : 20px;
	width : 200px;
	height : 50px;
	float : right;
	font-family: Roboto;
	font-style: normal;
	font-weight: normal;
	font-size: 30px;
	color: #FFFFFF;
	background: #F09661;
	}
</style>
<body>
	<div class = "main">
		<div class = "bookInfo">
			<div class = "image">
				<div style = "margin-left : 100px; width : 300px; height : 450px; background : #bbbbbb;">이미지 넣는 div입니다.</div>
			</div>
			<div class = "info">
				<div style = "margin-top : 80px;">
					<h1>책이름</h1>
					<h3>작가명</h3>
					<h3>출판사</h3>
					가격 <br>
					판매자(구매자) 닉네임<br>
				</div>
			</div>
			<div class = "button_space">
			<button id="buy_button">구매하기</button>
			<button id="basket_button">장바구니</button>
			</div>				
		</div>
		<div class = "bookdetailInfo">
			<div style = "width : 1300px; height : 30px; background: #F7B45E;">이 책의 상태</div>
			<div><p>책 상태등칙에대한 정보는 가져오는 공간입니다.</div>
		</div>
		<div class = "bookreview">
			<div style = "width : 1300px; height : 30px; background: #F7B45E;">이 책을 읽고</div>
			<div>이 책에대한 댓글들을 표시하는 공간입니다.</div>
		</div>
	</div>
</body>
</html>