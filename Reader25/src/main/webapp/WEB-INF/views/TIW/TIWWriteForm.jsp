<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reader들을 위한 Reader 25</title>

<link rel="stylesheet" href="${contextPath}/resources/css/TIW.css" type="text/css">

<style>
.outer{
		width: 900px; min-height: 400px; margin-left: auto; margin-right: auto; 
		margin-top:100px; margin-bottom: 5%; background-color:  #F6F6F6;
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

.title-div>input {
	height: 25px;
	margin-left: -7px;
	width: 91%;
	border: 1px solid rgba(235, 235, 235, 1);
}
.contents{
	width: 80%;
	margin: auto;
	margin-top: 20px;
	max-width: 1100px;
	min-height: 500px;
}
#smart_edit{
	height:500px;
}
</style>
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	
	<div class="outer">
	
		<form id="TIW_form" method="post" enctype="Multipart/form-data" action="TIWinsert.to">
	
			<h2 class="txt_TIW" align="center">오늘은 나도 작가</h2>
			
			<div class="title-div">
				<div class="title">title</div>
				<input type="text" name="title" id="title" placeholder="제목을 작성하세요">
			</div>
			<div class="contents">
					<textarea name="smart_edit" id="smart_edit" style="width:100%;"></textarea>
			</div>
			<div class="btn-div">
				<button id="submit-btn" class="btn">작성완료</button>
				<input type="reset" class="btn" value="작성취소">
			</div>
		
		</form>
	
	</div>
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

				// validate 검증하기
				 var title = $('#title').val()
				 if(title == ""){
					 event.preventDefault();
				        this.blur();
				        
				        $.popup({
				        	url: 'modal',
				        	data : "제목", //보내는 값
				        	close : function(result){
				        		// 모달창에서 넘어온 값
				        		console.log(result);
				        	}
				       
				        });
					 return false;
				}else{
					$('#notice-form').submit();
				}
			});
			
		</script>
	<%-- <%@ include file="../common/footer.jsp" %> --%>
</body>
</html>