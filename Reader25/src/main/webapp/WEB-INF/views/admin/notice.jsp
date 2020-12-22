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
		min-height: 700px;
		position: relative;
		margin-left: 10px;
		width: 80%;
	}
	.notice-div{
		min-height: 100px; 
		background: white;
		margin: auto;
		margin-top: 20px;
		border-radius: 5px;
		box-shadow: 0px 2px 3px 3px lightgray;
		padding: 10px;
		max-width: 1100px;
	}
	#notice-table{
		width: 100%;
		height: 100%;
		border-top:2px solid rgba(245, 113, 92, 1);
		border-collapse: collapse;
		text-align: center;
	}
	#notice-table th{
		height: 30px;
		border-bottom: 1px solid rgba(245, 113, 92, 1);
	}
	#write{
		margin-left:90%;
		cursor:pointer;
		position: fixed;
	}
	.write-btn {
		position: fixed;
		border-radius: 50%;
		background: rgba(245, 113, 92, 1);
		width: 50px;
		height: 50px;
		text-align: center;
		top: 90%;
		right: 12%;
	}
	.write-btn>img {
		margin-top: 7px;
	}
	.write-btn:hover {
		cursor: pointer;
	}
	.paging-div {
		width: 250px;
		margin: auto;
		margin-top: 30px;
	}
	.paging-div>button {
		width: 30px;
		height: 30px;
		color: rgba(85, 83, 83, 1);
		font-size: 15px;
		background: rgba(229, 229, 229, 1);
		border: none;
	}	

	.paging-div>button:hover {
		font-weight: bold;
		background: rgba(220, 220, 220, 1);
	}

	.paging-div>button:active {
		background: rgba(39, 50, 56, 1);
		color: white;
	}
</style>
</head>
<body>
	<header>
		<img src="#logo"/>
		<h3 id="header-h2">공지 사항</h3>
	</header>
	<%@ include file="header.jsp" %>
	<section>
		<div class="notice-div">
			<table id="notice-table">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>조회수</th>
					<th>댓글</th>
					<th>게시일</th>
				</tr>
				<tr><td colspan="5">공지사항이 없습니다.</td></tr>
			</table>
		</div>
		<div class="write-btn">
			<img src="/Reader25/images/bookreview/write.png"/>
		</div>
		<script>
			$('.write-btn').click(function(){
				location.href="<%=request.getContextPath()%>/write.no";
			});
		</script>
				<!-- 페이징 버튼 -->
		<div class="paging-div">
			<button>&lt;</button>
			<button>1</button>
			<button>2</button>
			<button>3</button>
			<button>4</button>
			<button>5</button>
			<button>&gt;</button>
		</div>
	</section>
</body>
</html>