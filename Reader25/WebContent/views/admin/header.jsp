<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<style type="text/css">
	header{
		background: rgba(245, 113, 92, 1);
		height: 50px;
		width:100%;
	}
	header>h2, header>img{
		display:inline-block;
		color:white;
		margin-top: 10px;
		margin-left: 5%;
	}
	nav{
		display:inline-block;
		background:rgba(39, 50, 56, 1);
		min-height: 700px;
		width: 200px;
		border: 1px solid rgba(39, 50, 56, 1);
		float:left;
	}
	.nav-ul{
		list-style-type:none;
		margin:0;
		padding:0;
	}
	.nav-ul>li{
		border-bottom: 2px solid black;
		font-size: 20px;
		height: 50px;
		text-align: center;
	}
	.nav-a{
		display: inline-block;
		text-decoration: none;
		color:white;
		margin-top: 10px;
	}
	.nav-ul>li:hover{
		font-weight: bolder;
		background: black;
	}
	.naviSelect{
		font-weight: bolder;
		background: black;
	}
</style>
</head>
<body>
	<header>
		<img src="#logo"/>
		<h2 id="header-h2">회원 정보 조회</h2>
	</header>
	<nav>
		<ul class="nav-ul">
			<li><a href="#" class="nav-a">회원 정보 조회</a></li>
			<li><a href="#" class="nav-a">결제 리스트</a></li>
			<li><a href="#" class="nav-a">문의 사항</a></li>
			<li><a href="#" class="nav-a">공지 사항</a></li>
			<li><a href="#" class="nav-a">통계자료</a></li>
		</ul>
	</nav>
	<script>
		$('.nav-a').click(function(){
			var text = $(this).text()
			$('#header-h2').text(text)
		});
	</script>
</body>
</html>