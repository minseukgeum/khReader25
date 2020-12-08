<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookReview</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<style>
/* 	*{border: 1px solid pink;} */
	section{
		background: rgba(246, 246, 246, 1);
		margin-left: 10%;
		margin-right: 10%;
	}
	.top-div{
		width: 500px;
		height: 50px;
		margin: auto;
	}
	select{
		font-family: inherit;
		font-size:15px;
		background: url('/Reader25/images/bookreview/arrow3.png') no-repeat 100% 50%;
		border-radius: 0px;
		-webkit-appearance: none;
		-moz-appearance: none;
		appearance: none;
		padding: 2px;
	}
	select::-ms-expand {
		display: none;
	}
	.search-div{
		margin:0px;
		padding:0px;
		display:inline-block;
		border-bottom: 1px solid black;
	}
	.search-option{
		border: none;
		width:50px;
	}
	#search-input{
		background: none;
		border:none;
		width: 220px;
	}
	#search-icon{
		float: right;
		width: 20px;
	}
	#search-icon:hover{
		cursor: pointer;
	}
	.sort-div{
		margin-left: 13px;
	}
	.sort-div, .sort-div>h4{
		clear:both;
		display: inline-block;
	}
	.sort-div>h4{
		font-size:15px;
		font-weight: normal;
	}
	.sort-div>h4:hover{
		font-weight: bolder;
		cursor: pointer;
	}
	#like-h4{
		border-left: 1px solid black;
		border-right: 1px solid black;
		padding-left: 5px;
		padding-right: 5px;
	}
	.list-all-div{
		width: 90%;
		min-height: 800px;
		margin:auto;
		margin-top: 20px;
		text-align: center;/*  */
	}
	.list-div{
		text-align:left;
		width: 200px;
		height: 300px;
		display:inline-block;
		margin-left:1%;
	}
	.img-div{
		background: rgba(229, 229, 229, 1);
		line-height: 180px; /* 이미지 가운데로 넣기 */
	}
	.list-img{
		height: auto;
		width: 100%;
		vertical-align: middle;
	}
	.content-div{
		background: white;
	}
	.content-ul{
		list-style-type:none;
		margin: 0;
		padding:0;
		padding: 5px;
	}
	.content-ul>li{
		margin:0;
		width: 100%;
	}
	.title-li{
		font-weight: bold;
	}
	.tag-li{
		font-size: 13px;
		color: rgba(245, 113, 92, 1);
	}
	.writer-li{
		font-size: 10px;
	}
	.wise-li{
		font-size: 13px;
	}
	.paging-div{
		width: 250px;
		margin:auto;
		margin-top: 10px;
	}
	.paging-div>button{
		width: 30px;
		height: 30px;
		color:rgba(85, 83, 83, 1);
		font-size:15px;
		background:rgba(229, 229, 229, 1);
		border:none;
	}
	.paging-div>button:hover{
		font-weight: bold;
		background:rgba(220, 220, 220, 1);
	}
	.paging-div>button:active{
		background: rgba(39, 50, 56, 1);
		color: white;
	}
</style>
</head>
<body>
	<section>
		<div class="top-div">
			<div class="search-div">
				<select class="search-option">
					<option selected="selected">title</option>
					<option>author</option>
					<option>writer</option>
				</select>
				<input type="text" id="search-input">
				<span class="img-span">
					<img src="<%=request.getContextPath() %>/images/bookreview/search.png" id="search-icon"/>
				</span>
			</div>
			<script>
				$('#search-icon').click(function(){
					location.href="<%=request.getContextPath()%>/search";
				});				
			</script>
			<div class="sort-div">
				<h4 class="sort-h4">최신순</h4>
				<h4 class="sort-h4" id="like-h4">좋아요</h4>
				<h4 class="sort-h4">북마크</h4>
			</div>
		</div>
		
		<div class="list-all-div">
			<% for(int i = 0; i <= 10; i++){ %>
			<div class="list-div">
				<div class="img-div">
					<img class="list-img" src="/Reader25/images/bookreview/book.jpg">
				</div>
				<div class="content-div">
					<ul class="content-ul">
						<li class="title-li">제목</li>
						<li class="tag-li">#작가 #분야</li>
						<li class="writer-li">회원ID</li>
						<li class="wise-li">명언</li>
					</ul>
				</div>
			</div>
			<%} %>
		</div>
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