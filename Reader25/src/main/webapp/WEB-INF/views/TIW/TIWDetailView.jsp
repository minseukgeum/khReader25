<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reader들을 위한 Reader 25</title>

<link rel="stylesheet" href="${contextPath}/resources/css/TIW.css" type="text/css">

<style>
.outer{
		width: 80%; min-height: 400px; margin-left: 10%; margin-right: 10%; 
		margin-top:100px; margin-bottom: 5%; min-width: 1000px;
		background-color:  #F6F6F6;
	}
#con_table{
			width: 80%;
			min-height: 500px;
		}
#img_td{width:40%}
#myimg{
		max-width: 300px;
		margin-left: 10%;
		margin-right: 10%;
	}
.title, .cate1, .date, .cate2, .writer, .like, .count  {
	display: inline-block;
	background: rgba(235, 235, 235, 1);
	text-align: center;
	vertical-align: middle;
	width: 50px;
	height: 27px;
	border: 1px solid rgba(235, 235, 235, 1);
	border-radius: 3px 0px 0px 3px;
	color: rgba(85, 83, 83, 1);
}

</style>
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	
	<div class="outer">
	
		<div class="page">
		<h2 class="txt_TIW" align="center">오늘은 나도 작가</h2>
		</div>
		<br>
		<div id ="content">
			<table id="con_table" border="1px" align="center">
				<tr>
					<td colspan="3" rowspan="4" id="img_td"><img id="myimg" alt="기본이미지" src="resources/images/logo/Leader25.jpg"></td>
					<td width="55px">
						<div class="title">title</div>
					</td>
					<td colspan="5">${ board.bTitle }</td>
				</tr>
				<tr>
					<td width="55px">
						<div class="cate1">cate</div>
					</td>
					<td colspan="2">${ board.code }</td>
					<td width="55px">
						<div class="date">date</div>
					</td>
					<td colspan="2">${ board.enrollDay }</td>
				</tr>
				<tr>
					<td width="55px">
						<div class="cate2">원작</div>
					</td>
					<td colspan="5">${ board.code }</td>
				</tr>
				<tr>
					<td id="w_td" width="55px">
						<div class="writer">작가</div>
					</td>
					<td>${ board.userId }</td>
					<td id="l_td" width="55px">
						<div class="like">좋아요</div>
					</td>
					<td>${ board.bLike }</td>
					<td id="c_td" width="55px">
						<div class="count">조회수</div>
					</td>
					<td>${ board.comCount }</td>
				</tr>
				<tr>
					<td colspan="9">내용</td>
				</tr>
			</table>
		</div>
		<!-- <div class="content">
			<img id="myimg" alt="기본이미지" src="resources/images/logo/Leader25.jpg">
			<div class="title-div">
			<div class="title">title</div>
			<input type="text" name="bTitle" id="title" placeholder="제목을 입력해주세요">
			</div>
			<select name="code1">
				<option selected="selected">분류</option>
				<option>총류</option>
				<option>철학</option>
				<option>종교</option>
				<option>사회 과학</option>
				<option>자연 과학</option>
				<option>기술 과학</option>
				<option>예술</option>
				<option>언어</option>
				<option>문학</option>
				<option>역사</option>
			</select>
			<select id="book" name="code2">
				<option selected="selected">책 이름</option>
				<option>총류</option>
				<option>철학</option>
				<option>종교</option>
				<option>사회 과학</option>
				<option>자연 과학</option>
				<option>기술 과학</option>
				<option>예술</option>
				<option>언어</option>
				<option>문학</option>
				<option>역사</option>
			</select>
		</div> -->
		
	
	
	</div>

</body>
</html>