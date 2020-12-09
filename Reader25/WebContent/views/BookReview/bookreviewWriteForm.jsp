<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%= request.getContextPath() %>/smartedit/js/service/HuskyEZCreator.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<style>
  	*{border: 1px solid pink;}  
  	section{
  		background:rgba(246, 246, 246, 1);
  		width: 80%;
  		margin:auto;
  	}
	.title-div{
		width: 550px;
		margin: auto;
		margin-top: 10px;
		padding: 0;
	}
	.title{
		display:inline-block;
		background: rgba(235, 235, 235, 1);
		text-align: center;
		vertical-align:middle;
		width: 50px;
		height: 27px;
		border: 1px solid rgba(235, 235, 235, 1);
		border-radius: 3px 0px 0px 3px;
		color: rgba(85, 83, 83, 1);
	}
	.title-div>input{
		height: 25px;
		margin-left: -7px;
		width: 400px;
		border:  1px solid rgba(235, 235, 235, 1);
	}
	.title-div>select{
		height: 29px;
		border:  1px solid rgba(235, 235, 235, 1);
		margin-left: -6px;
		color: rgba(85, 83, 83, 1);		
	}
	.content{
		margin-top: 30px;
	}
	.file-div{
		width: 250px;
		margin:auto;
	}
	.file-img{
		height: 200px;
		margin-top: 20px;
		background: lightgray;
	}
	.content-edit{
		width: 80%;
		margin:auto;
	}
</style>
</head>
<body>
	<section>
		<form action="#" id="write-book">
			<div class="title-div">
				<div class="title">title</div>
				<input type="text" placeholder="제목을 작성하세요">
				<select>
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
			</div>
			<div class="content">
				<div class="file-div">
					<input type="file">
					<div class="file-img"></div>
				</div>
				<div class="content-edit" style="text-align:center;">
					<textarea name="smart_edit"id="smart_edit" style="width:100%;"></textarea>
				</div>
			</div>
			<button id="submit-btn">작성하기</button>
		</form>
		<script>
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
		</script>
	</section>
</body>
</html>