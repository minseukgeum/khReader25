<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.bookreview-div{
		margin-top: 20px;
	}
	.info{
		width: 80%;
		margin:auto;
		max-width: 1000px;
	}
	.img-div{
		display:inline-block;
		width: 50%;
		line-height: 350px;
		float: left;
		background: rgba(246, 243, 243, 1);
		text-align: center;
	}
	.img-div img{
		clear: both;
		width: 350px;
		margin:auto;
		vertical-align: middle;
		text-align: center;
	}
	
	.info-content{
		display:inline-block;
		width: 47%;
		height: 350px;
		margin-left: 15px;
	}
	.title{
		display:inline-block;
		margin: 10px;
		margin-top: 80px;
		width: 100%;
		font-size: 30px;
	}
	.tag{
		display:inline;
		margin: 10px;
		margin-right: 0px;
		color: gray;
		font-size: 13px;
	}
	.wise-saying{
		height: 100px;
		width: 100%;
		margin-top: 10px;
	}
	.wise-saying>div{
		width: 80%;
		margin: auto;
		text-align: center;
	}
	#quote1{float:left;}
	#quote2{float:right;}
	.wise-content{display:inline-block; margin-top: 10px;}
	.contents{width: 80%;margin:auto; margin-top: 10px; min-height: 200px; max-width: 1000px;}
	.contents>p{margin:15px;}
	.list{
		width: 80%;
		margin:auto;
		margin-top:10px;
		max-width: 1000px;
	}
	.list-header{
		background:rgba(247, 180, 94, 1);
		padding-left: 20px;
		height: 35px;
		line-height: 35px;
	}
	.list-header p{
		display:inline;
	}
	.list-contents{
		background: rgba(246, 246, 246, 1);
		padding: 10px;
	}
	.list-table{
		width: 95%;
		border-collapse: collapse;
		margin:auto;
	}
	.list-table td{
		text-align: center;
	}
	.list-table td[class=td-left]{
		text-align: left;
	}
	.paging-btn{
		width: 200px;
		margin: auto;
		margin-top: 10px;
	}
	.paging-btn>a{
		background:rgba(229, 229, 229, 1);
		color:rgba(85, 83, 83, 1);
		border: none;
		width: 20px;
		height: 20px;
	}
	.paging-btn>p {
		background:rgba(39, 50, 56, 1);
		color: white;
	}
	.paging-btn>a:hover{
		background: rgba(210, 210, 210, 1);
		font-weight: bolder;
	}
	.write-div{
		width: 80px;
		font-size: 18px;
		height: 25px;
		position: relative;
		float: right;
		margin-right: 10%;
		top: -30px;
	}
	.write-btn{
		background:rgba(255, 195, 152, 1);
		border: none;
		width: 100%;
		height: 100%;
	}
	.write-btn:hover{
		background:rgba(245, 185, 142, 1);
		cursor:pointer;
	}	
</style>
</head>
<body>
	<%@include file="../common/menubar.jsp" %>
	<section>
		<div class="bookreview-div">
			<div class="info">
				<div class="img-div">
					<c:if test="${at ne null}">
						<img src="resources/buploadFiles/${at.atcName}"/>
					</c:if>
					<c:if test="${at eq null }">
						<img />
					</c:if>
				</div>
				<div class="info-content">
					<h3 class="title">${ board.bTitle }</h3>
					<p class="tag">#제목</p>
					<span class="info" id="author">${booktitle }</span>
					<p class="tag">#작가</p>
					<span class="info" id="sort">${author }</span>
					<br>
					<p class="tag">#글쓴이</p>
					<span class="info" id="sort">${board.userId }</span>
					<div class="wise-saying">
						<div>
							<img class="quote-img" id="quote1" src="resources/images/bookreview/quote1.png"/>
							<div class="wise-content">명언은 명언이다.</div>
							<img class="quote-img" id="quote2"src="resources/images/bookreview/quote2.png"/>
						</div>
					</div>
				</div>
			</div>
			<div class="contents">
				${ board.bContent}
			</div>
		</div>
		<div class="list">
			<div class="list-header">
				<p>이 책의 다른 리뷰</p>
			</div>
			<div class="list-contents">
				<table class="list-table">
					<%for(int i = 0; i < 10; i++){ %>
					<tr>
						<td class="td-left">이 책 정말 재밌네</td>
						<td>강건강</td>
						<td>2020.01.01</td>
					</tr>
					<%} %>
				</table>
			</div>
		</div>

		<div class="paging-btn">
			<!-- 이전 -->
			<c:if test="${ pi1.currentPage <=1 }">
				<p>&lt;</p>
			</c:if>
			<c:if test="${ pi1.currentPage > 1 }">
				<a onclick="before1();">&lt;</a>
			</c:if>
			<!-- 번호 -->
			<c:forEach begin="${ pi1.startPage }" end="${ pi1.endPage }" var="p">
				<c:if test="${ pi1.currentPage eq p }">
					<p>${ p }</p>
				</c:if>
				<c:if test="${ pi1.currentPage ne p }">
					<a onclick="p1();">${ p }</a>
				</c:if>
			</c:forEach>

			<!-- 다음 -->
			<c:if test="${ pi1.currentPage >= pi1.endPage }">
				<a onclick="next1();">&gt;</a>
			</c:if>
			<c:if test="${pi1.currentPage < pi1.endPage }">
				<p>&gt;</p>
			</c:if>

		</div>
		<script>
			$(function(){
				getAnotherReview();
				setInterval(function(){
					getAnotherReview();
				}, 5000);
				$('.review-a').click(function(){
					getAnotherReview();
				});
			});
			function before1(){
				var page1 = 
			}
			function getAnotherReview(){
				var booktitle = ${booktitle};
				$.ajax({
					url: 'reList.re',
					data: {booktitle:booktitle, page1:page1},
					success: function(data){
						console.log(data);
					}
				});
			}
		</script>
		<div class="list">
			<div class="list-header">
				<p>명대사</p>
			</div>
			<div class="list-contents">
				<table class="list-table">
					<%for(int i = 0; i < 10; i++){ %>
					<tr>
						<td class="td-left">스케일이 남다르다.</td>
						<td>강건강</td>
						<td>2020.01.01</td>
					</tr>
					<%} %>
				</table>
			</div>
		</div>
		<div class="paging-btn">
			<button>&lt;</button>
			<button>1</button>
			<button>2</button>
			<button>3</button>
			<button>4</button>
			<button>5</button>
			<button>&gt;</button>
		</div>
		<div class="write-div"><button class="write-btn" onclick='location.href="write.re"'>리뷰쓰기</button></div>
	</section>
</body>
</html>