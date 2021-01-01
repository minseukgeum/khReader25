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
#myimg{
		width: 70%;
		margin-left: 10%;
	}
.title-div {
	clear: both;
	width: 80%;
	max-width: 1100px;
	margin: auto;
	margin-top: 10px;
	padding: 0;
}

.title {
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

input {
	height: 25px;
	margin-left: -7px;
	width: 60%;
	border: 1px solid rgba(235, 235, 235, 1);
}
select{
		height: 29px;
		border:  1px solid rgba(235, 235, 235, 1);
		margin-left: -6px;
		color: rgba(85, 83, 83, 1);		
	}
#book{
		height: 29px; width: 230px;
		border:  1px solid rgba(235, 235, 235, 1);
		margin-left: -6px;
		color: rgba(85, 83, 83, 1);	
}
.writer {
	display: inline-block;
	background: rgba(235, 235, 235, 1);
	text-align: center;
	vertical-align: middle;
	width: 50px;
	height: 27px;
	border: 1px solid rgba(235, 235, 235, 1);
	border-radius: 3px 0px 0px 3px;
	color: rgba(85, 83, 83, 1);
	 margin-left: 10%;
}
.writer-div>input {
	height: 25px;
	margin-left: -7px;
	width: 20%;
	border: 1px solid rgba(235, 235, 235, 1);
}
#con_table{
			width: 80%;
			height: 300px;
		}
#img_td{
			width: 45%;
		}
#w_td{width: 15%;}
#f_td{width: 10%;}
#c_td{width: 15%;}
#d_td{width: 15%;}
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
					<td colspan="4" rowspan="3" id="img_td"><img id="myimg" alt="기본이미지" src="resources/images/logo/Leader25.jpg"></td>
					<td colspan="5">
						<div class="title">title</div>
						<input type="text" name="bTitle" id="title" placeholder="제목을 입력해주세요" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td colspan="2">카테1</td>
					<td colspan="3">카테2</td>
				</tr>
				<tr>
					<td id="w_td">
						<div class="title">작가</div>
						<input type="text" name="bTitle" id="title" placeholder="제목을 입력해주세요" readonly="readonly">
					</td>
					<td id="f_td">
						<div class="title">좋아요</div>
						<input type="text" name="bTitle" id="title" placeholder="제목을 입력해주세요" readonly="readonly">
					</td>
					<td id="c_td">
						<div class="title">조회수</div>
						<input type="text" name="bTitle" id="title" placeholder="제목을 입력해주세요" readonly="readonly">
					</td>
					<td colspan="2" id="d_td">
						<div class="title">날짜</div>
						<input type="text" name="bTitle" id="title" placeholder="제목을 입력해주세요" readonly="readonly">
					</td>
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