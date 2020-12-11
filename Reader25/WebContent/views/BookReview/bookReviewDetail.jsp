<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{border: 1px solid pink;}
	.info{
		width: 80%;
		margin:auto;
	}
	.img-div{
		display:inline-block;
		width: 50%;
		line-height: 350px;
		float: left;
		background: rgba(246, 243, 243, 1);
		text-align: center;
	}
	.img-div>img{
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
	.wise-content{display:inline-block;}
	.contents{width: 80%;margin:auto;}
	.contents>p{margin:15px;}
</style>
</head>
<body>
	<section>
		<div class="bookreview-div">
			<div class="info">
				<div class="img-div"><img src="../../images/bookreview/book.jpg"/></div>
				<div class="info-content">
					<h3 class="title">Scale</h3>
					<p class="tag">#</p>
					<span class="info" id="author">작가</span>
					<p class="tag">#</p>
					<span class="info" id="sort">소설</span>
					<div class="wise-saying">
						<div>
							<img class="quote-img" id="quote1" src="${ contextPath }/Reader25/images/bookreview/quote1.png"/>
							<div class="wise-content">명언은 명언이다.</div>
							<img class="quote-img" id="quote2"src="${ contextPath }/Reader25/images/bookreview/quote2.png"/>
						</div>
					</div>
				</div>
			</div>
			<div class="contents">
				<p>정말 뜻 깊은 책이다 남다른 스케일이 있는 책! 살아가면서 한 번쯤은 읽어봐야할 책이다. 이 책에서 가장 인상깊었던
					부분은 사람마다 다른 스케일을 소개했을 때이다. 정말 다양한 사람들이 ......</p>
			</div>
		</div>
		<div class="list">
			<div class="list-header">
			</div>
			<div class="list-contents">
			</div>
		</div>
	</section>
</body>
</html>