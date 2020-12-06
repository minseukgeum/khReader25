<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookReview</title>
<style>
	*{border: 1px solid pink;}
	section{
		background: rgba(246, 246, 246, 1);
		margin-left: 10%;
		margin-right: 10%;
	}
	.top-div{
		width: 440px;
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
	}
	#search-icon{
		float: right;
		width:20px;
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
		
		<div class="list-div">
			<span class="list-span">
				
			</span>
		</div>
	</section>
</body>
</html>