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
		max-width: 1000px;
	}
	.notice-header{
		text-align: center;
		font-size: 25px;
		margin-bottom: 10px;
		font-weight: bolder;
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
	#notice-table tr{
		height:30px;
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
		top: 76%;
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
<%@ include file="../common/menubar.jsp" %>
	<section>
		<div class="notice-div">
			<div class="notice-header">공지사항</div>
			<table id="notice-table">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>조회수</th>
					<th>댓글</th>
					<th>작성일</th>
				</tr>
				<%for(int i = 0; i<10; i++){ %>
				<tr>
					<td><%=10-i %></td>
					<td>공지사항</td>
					<td>0</td>
					<td>0</td>
					<td>2020.01.01</td>
				</tr>
				<%} %>
			</table>
		</div>
		<!-- 관리자 아이디일 시 보이게 -->
		<div class="write-btn">
			<img src="${contextPath }/resources/images/bookreview/write.png"/>
		</div>
		<!-- ---------------- -->
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