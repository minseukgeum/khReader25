<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reader들을 위한 Reader 25</title>

<link rel="stylesheet" href="${contextPath}/resources/css/TIW.css" type="text/css">
<script src="<%=request.getContextPath()%>/smartedit/js/service/HuskyEZCreator.js"></script>
<style>
.outer{
		width: 80%; min-height: 400px; margin-left: 10%; margin-right: 10%; 
		margin-top:100px; margin-bottom: 5%; min-width: 1000px;
		background-color:  #F6F6F6;
	}
.title-div {
	clear: both;
	width: 80%;
	max-width: 1100px;
	margin: auto;
	margin-top: 10px;
	padding: 0;
}

.title, .cate {
	display: inline-block;
	background: rgba(235, 235, 235, 1);
	text-align: center;
	vertical-align: middle;
	width: 80px;
	height: 27px;
	border: 1px solid rgba(235, 235, 235, 1);
	border-radius: 3px 0px 0px 3px;
	color: rgba(85, 83, 83, 1);
}

.title-div>input {
	height: 25px;
	margin-left: -7px;
	width: 60%;
	border: 1px solid rgba(235, 235, 235, 1);
}
.title-div>select{
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
	width: 80px;
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
.contents{
	width: 80%;
	margin: auto;
	margin-top: 20px;
	max-width: 1100px;
	min-height: 500px;
}

.content-edit{
		width: 80%;
		margin:auto;
		margin-top: 20px;
		min-height: 300px;
	}
</style>
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	
	<div class="outer">
	
		<form id="TIW_form" method="post" enctype="Multipart/form-data" action="TIWupdate.to">
	
			<h2 class="txt_TIW" align="center">오늘은 나도 작가</h2>
			
			<div class="title-div">
				<div class="title">title</div>
				<input type="text" name="bTitle" id="title" value="${ board.bTitle }">
				<input type="hidden" name="page" value="${ page }">
				<input type="hidden" name="boardNo" value="${ board.boardNo }">
			</div>
			<br>
			<div class="title-div">
				<div class="cate">카테고리</div>
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
				<input type="text" name="code2" id="code2" value="${ board.code }">
			</div>
			<br>
			<div class="writer-div">
				<div class="writer">작가</div>
				<input type="text" name="userId" id="writer" readonly value="${ board.userId }">
			</div>
			<br>
			<div class="content-edit" style="text-align:center;">
					<textarea name="bContent"id="smart_edit" style="width:70%;">${ board.bContent }</textarea>
				</div>
			<br><br>
			
			<div class="btn-div" align="center">
				<button type="submit" id="submit-btn" class="btn1">작성완료</button>
				<input type="reset" class="btn2" value="작성취소">
			</div>
			<br><br>
		
		</form>
	
	</div>
	<script>
			var fileCheck = false;
			var oEditors = [];
			//스마트 에디터 생성 함수
			 nhn.husky.EZCreator.createInIFrame({
			      oAppRef :oEditors,
			      elPlaceHolder : "smart_edit", 
			      sSkinURI : "<%=request.getContextPath()%>/smartedit/SmartEditor2Skin.html",
			      fCreator: "createSEditor2"
			});
			$('#submit-btn').click(function(){
				oEditors.getById["smart_edit"].exec("UPDATE_CONTENTS_FIELD",[]);
				
				$('#write-book').submit();
			});
			$('#file-img').click(function(){
				$('#input-file')[0].click();
			});
			
			function loadImg(value) {
				if (value.files[0]) {
					var reader = new FileReader();
					fileCheck = true;
					reader.onload = function(e) {
 						$('#load-img').attr('src', e.target.result);
					}
					reader.readAsDataURL(value.files[0]);
				}
			}
		</script>
	<%-- <%@ include file="../common/footer.jsp" %> --%>
</body>
</html>