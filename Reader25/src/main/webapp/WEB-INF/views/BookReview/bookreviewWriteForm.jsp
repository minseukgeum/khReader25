<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="<%=request.getContextPath()%>/smartedit/js/service/HuskyEZCreator.js"></script>
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<style>
  	section{
  		background:rgba(246, 246, 246, 1);
  		width: 80%;
  		margin:auto;
  	}
	.title-div{
		width: 80%;
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
		width: 75%;
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
		width: 300px;
		margin:auto;
	}
	.file-img{
		min-height: 250px;
		margin-top: 20px;
		background: lightgray;
		text-align: center;
		position: relative;
	}
	#input-file{
		border: 1px solid lightgray;
	}
	#file-img:hover{
		background: LightSalmon;
	}
	#load-img{
		max-width: 100%;
		height: auto;
		margin: 0; 
 		position: absolute;/* 수직 정렬 */
 		top: 50%;
 		left: 50%;
 		transform: translate(-50%, -50%);
	}
	.tag{display:inline; color:rgba(245, 113, 92, 1);}
	.bookInfo{
		background: none;
 		border: none; 
	}
	.tag-div{
		display:inline-block; 
		height: 40px; 
		width: 400px; 
		margin-left: 33%;
		margin-top:10px;
	}
	.content-edit{
		width: 80%;
		margin:auto;
		margin-top: 20px;
		min-height: 300px;
	}
	.btn{
		width: 250px;
		height: 40px;
		margin: auto;
		margin-bottom: 20px;
		margin-top: 20px;
	}
	#submit-btn{
		width: 100%;
		height: 100%;
		color: white;
		background: rgba(85, 83, 83, 1);
		font-size: 18px;
	}
	#submit-btn:hover{
		background: rgba(75, 73, 73, 1);
		font-weight: bolder;
	}
</style>
</head>
<body>
	<section>
		<form action="#" id="write-book" method="post">
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
					<input type="file" id="input-file" name="image" onchange="loadImg(this);" accept="image/jpg, image/jpeg, image/png">
					<div class="file-img" id="file-img">
						<img src="#" id="load-img" >
					</div>
				</div>
				<div class="tag-div">
					<p class="tag">#</p><input type="text" class="bookInfo" name="booktitle" placeholder="제목">
					<p class="tag">#</p><input type="text" class="bookInfo" name="author" placeholder="작가">
				</div>
				
				<div class="content-edit" style="text-align:center;">
					<textarea name="smart_edit"id="smart_edit" style="width:100%;"></textarea>
				</div>
			</div>
			<div class="btn">
				<button id="submit-btn">등록하기</button>
			</div>
		</form>
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
	</section>
</body>
</html>