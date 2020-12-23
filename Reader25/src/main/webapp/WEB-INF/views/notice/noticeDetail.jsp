<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section{
		background: rgba(246, 246, 246, 1);
		width: 80%;
		min-height: 900px;
		min-width: 1000px;
		margin:auto;
		padding-top: 20px;
	}
	.notice-div{
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
	.notice-header{
		text-align: center;
		font-size: 25px;
		margin-bottom: 10px;
		font-weight: bolder;
	}
	#notice-contents{
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
		min-height: 400px;
		margin-top: 20px;
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
	<%@ include file="../common/menubar.jsp" %>

	<section>
		<div class="notice-div">
			<div class="notice-header">공지사항</div>
			<div id="notice-contents">
				<div class="title">
					<span class="title-span">제목</span>
					<span>이번 주 배송이 늦어 집니다.</span>
				</div>
				<div class="writer">
					<span class="title-span">작성자</span>
					<span>관리자</span>
				</div>
				
				<!-- 이미지 파일 넣기 -->
				<div class="image-div">
					<img src="<%=request.getContextPath()%>/images/bookEX.jpg">
				</div>
				<!-- ---------- -->
				
				<div class="contents">
					왜냐하면 크리스마스 주이기 때문입니다.
					다들 메리크리스마스!~~~
				</div>
			</div>
		</div>
		<form id="comments-form" action="<%=request.getContextPath()%>/write.co">
			<div class="comments">
				<div class="comment-list">
					<table id="comment-table">
						<tr>
							<td>user01</td>
							<td>메리크리스마스~</td>
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
			<!-- 관리자아이디 시 보임 아니면 안보임 -->
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