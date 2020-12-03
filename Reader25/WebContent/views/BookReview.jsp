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
	}
	.top-div{
		width: 430px;
		height: 50px;
		margin: auto;
	}
	select {
		font-family: inherit;
		background: url('images/arrow.jpg') no-repeat 95% 50%;
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
		display:inline-block;
		border-bottom: 1px solid black;
	}
	.search-option{
		background:none;
		border: none;
	}
	#search-input{
		background: none;
	}
	.sort-div, .sort-div>h4{
		display: inline-block;
	}
	.sort-div>h4{
		font-size:12px;
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
				<img src="#">
			</div>
			<div class="sort-div">
				<h4 class="sort-h4">최신순</h4>
				<h4 class="sort-h4" id="like-h4">좋아요</h4>
				<h4 class="sort-h4">북마크</h4>
			</div>
		</div>
		
		<div class="list-div">
			
		</div>
	</section>
</body>
</html>