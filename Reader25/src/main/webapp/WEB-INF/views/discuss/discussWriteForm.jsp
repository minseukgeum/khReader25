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
  		border: 1px solid rgba(246, 246, 246, 1);
  		width: 80%;
  		margin:auto;
  		min-width: 1000px;
  	}
	.title-div{
		width: 80%;
		margin: auto;
		margin-top: 10px;
		padding: 0;
	}
	.title-div>input{
		height: 32px;
		margin-left: -7px;
		width: 75%;
		border:  1px solid rgba(235, 235, 235, 1);
	}
	.title-div>select{
		height: 32px;
		width: 190px;
		border:  1px solid rgba(235, 235, 235, 1);
		margin-left: -6px;
		color: rgba(85, 83, 83, 1);		
	}
	.content{
		margin-top: 30px;
	}
	.content-edit{
		width: 80%;
		margin:auto;
		margin-top: 20px;
		min-height: 300px;
	}

	.btn{
		width: 165px;
		height: 40px;
		margin-bottom: 20px;
		margin-top: 20px;
		font-size: 25px;
	}
	.btn0{
		width: 110px;
		height: 32px;
	}
	#btn1{background: #C95F12;}
	#btn2{background: #FFC398;}
	#btn3{background: #67492C;}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<section>
		<form action="discussInsert.di" id="write-book" method="post">
			<div class="title-div">
				<h1>토론방 열기</h1>
				<input type="text" placeholder="제목을 작성하세요">
				<select>
					<option selected="selected">찬성</option>
					<option>반대</option>
				</select>
				<button class="btn0" id="btn1">이미지 추가</button>
			</div>
			<div class="content">
				<div class="content-edit" style="text-align:center;">
					<textarea name="smart_edit"id="smart_edit" style="width:100%; min-height:600px;"></textarea>
				</div>
				<div style="text-align:right; width:90%; padding:0;">
					<input type="button" class="btn" id="btn2" onclick="" value="토론방 수정">
					<input type="button"class="btn" id="btn3" onclick="'javascript:history.go(-1)';">토론방 취소</button>
					<input type="submit" class="btn" id="btn1">토론방 열기</button>
				</div>
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
		</script>
	</section>
</body>
</html>