<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section{
		display:inline-block;
		background: rgba(246, 246, 246, 1);
		margin: auto;
		min-height: 900px;
		width: 100%;
	}
	.inquiry-div{
		min-height: 100px; 
		background: white;
		margin: auto;
		margin-top: 20px;
		border-radius: 2px;
		box-shadow: 0px 2px 2px 3px lightgray;
		padding: 20px;
		width: 80%;
		max-width: 800px;
	}
	.inquiry-header{
		text-align: center;
		font-size: 25px;
		margin-bottom: 10px;
		font-weight: bolder;
	}
	#inquiry-contents{
		border-top: 2px solid rgba(245, 113, 92, 1);
		border-bottom: 2px solid rgba(245, 113, 92, 1);
		min-height: 500px;
		padding: 10px;
	}
	.title{
		margin-top: 10px;
	}
	.title-span{
		display:inline-block;
		width: 100px;
		font-weight: bold;
	}
	.image-div{
		width: 500px;
		margin-top: 20px;
	}
	.image-div>img{
		width: 100%;
	}
	.contents{
		background: rgba(255, 195, 152, 0.13);
		min-height: 200px;
		margin-top: 20px;
		padding: 10px;
	}
	.reply-writer{
		height: 40px;
		margin-top: 20px;
		padding-top: 20px;
		padding-bottom: 0px;
		border-top: 2px solid rgba(245, 113, 92, 1);
	}
	.reply-div{
		background: rgba(229, 229, 229, 0.37);
		min-height: 200px;
		padding: 10px;
	}
	.comments{
		width: 80%;
		max-width: 800px;
		min-height: 100px;
		background: white;
		margin: auto;
		margin-top: 20px;
		padding: 20px;
	}
	#comment-table{
		margin: auto;
		width: 95%;
	}
	.write-comment{
		margin:auto;
		margin-top: 20px;
	}
	#comment-input{
		height: 30px;
		width: 90%;
	}
	#comment-submit{
		height: 35px;
		background: white;
		border: 1px solid black;
	}
	.btn-div{
		width: 80%;
		max-width:800px;
		margin:auto;
		height: 50px;
	}
	.list-btn{
		background: rgba(196, 196, 196, 1);
		float: right;
		color: white;
		border: none;
		margin-top: 10px;
		height: 35px;
		width: 100px;
		margin-right: 5px;
	}
	#modify-btn{
		background: rgba(103, 73, 44, 1);
	}
	#delete-btn{
		background: rgba(201, 95, 18, 1);
	}
</style>
</head>
<body>
	<section>
		<div class="inquiry-div">
			<div class="inquiry-header">문의사항</div>
			<div id="inquiry-contents">
				<div class="title">
					<span class="title-span">제목</span>
					<span>이 기능 추가해주시면 안될까요???</span>
				</div>
				<div class="writer">
					<span class="title-span">작성자</span>
					<span>강건강</span>
				</div>
				
				<!-- 이미지 파일 넣기 -->
				<div class="image-div">
					<img src="<%=request.getContextPath()%>/images/bookEX.jpg">
				</div>
				<!-- ---------- -->
				
				<div class="contents">
					제가 이거를 1년 썼는데 
					장바구니를 이렇게 롸롸 기능 추가하는건 어때요??
				</div>
				<div class="reply-writer">
					관리자
				</div>
				<div class="reply-div">
					오호 좋네요
					포인트 150점 드립니다.
				</div>
			</div>
		</div>
		<form id="comments-form" action="<%=request.getContextPath()%>/write.co">
			<div class="comments">
				<div class="comment-list">
					<table id="comment-table">
						<tr>
							<td>user01</td>
							<td>좋은 아이디어에요!</td>
							<td>2020-12-20</td>
						</tr>
					</table>
				</div>
				<div class="write-comment">
					<input type="text" id="comment-input" name="comments" placeholder="댓글을 입력하세요">
					<input type="submit" id="comment-submit" value="등록">
				</div>
			</div>
		</form>
		<div class="btn-div">
			<!-- 관리자아이디  또는 글쓴이  -->
			<button class="list-btn" id="modify-btn">수정하기</button>
			<button class="list-btn" id="delete-btn">삭제하기</button>
			<!-- ------- -->
			<button class="list-btn">목록으로</button>
		</div>
		<script>
			$('#list-btn').click(function(){
				//location.href = ${loc}; // 이전으로 가기historyback
			});
		</script>
	</section>
</body>
</html>