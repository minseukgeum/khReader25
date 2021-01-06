<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section{
  		border: 1px solid rgba(246, 246, 246, 1);
  		width: 80%;
  		margin:auto;
  		min-width: 1000px;
  	}
  	#first{
  		text-align: center;
  	}
  	b{font-size:60px; margin-left: 580px;}
  	#info{
  		width: 100%;
  		background: #F5715C;
  		font-size:20px;
  		text-align: center;
  	}
  	.head{text-align: center;}
  	.dradio{margin-left: 50px;}
  	.btn{
  		width:100px;
  		height:50px;
  		float: right;
  		margin: 5px;
  	}
  	#btn1{background: #FFC398;}
  	#btn2{background: #67492C;}
  	#btn3{background: #C95F12;}
  	#load-img{wdith:713px; height:427px;}
  	hr{border: 2px solid #F5715C}
  	p{font-size:20px;}
  	.Argument{
  		background: #FFC398;
  		width:100%;
  		min-height:435px;
  	}
  	#stime{float:right;}
   	ol{list-style: none;}
  	.dfom{display:block;}
  	.Atext{float:left; margin-right: 10px;}
  	#text{background: white; border: 1px solid black; width:1300px;}
  	#people-img{wdith:115px; height:80px;}
  	.wid{width:100%; margin: 3px;}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<br><br>
	<section>
		<div>
		<b>${d.getdTitle()}</b>
		<button class="btn" id="btn1">토론방 수정</button>
		<button class="btn" id="btn2">토론방 끝내기</button>
		</div>
		<div class="head" id="info">
			의견을 내주시면 감사하겠습니다. 글을 읽어본 뒤 찬성인지 반대인지 아래를 클릭하여 선택 후 자신의 주장을 펼치시면 됩니다!
		</div>
		<div class="head">
			<input type="radio"  name="discuss" value="찬성"> 찬성
			<input type="radio" class="dradio" name="discuss" value="중립" checked> 중립
			<input type="radio" class="dradio" name="discuss" value="반대"> 반대
		</div>
		<div class="head">
			<img src="" id="load-img">
		</div>
	<h2>토론주제</h2>
	<hr>
	<p>
	${d.getdContent()}</p>
	
	<h2>주장</h2>
	<hr>
	<div class="Argument">
		<select id="stime">
			<option selected>오래된순</option>
			<option>최신순</option>
		</select><br>
		<ol>
			<li>
				<div class="dfom">
					<div class="Atext">
						<img src="" id="people-img"><br>
						아이디 찬성
					</div>
					<div class="Atext" id="text"><p>대충 찬성이라는 글</p></div><br><br>
				</div><div style="clear:both;"></div>
			</li>
			<li>
				<div class="dfom">
					<div class="Atext">
						<img src="" id="people-img"><br>
						아이디 찬성
					</div>
					<div class="Atext" id="text"><p>대충 찬성이라는 글</p></div><br><br>
				</div><div style="clear:both;"></div>
			</li>
			<li>
				<div class="dfom">
					<br><div class="Atext" id="text"><p>대충 반대이라는 글</p></div>
					<div class="Atext">
						<img src="" id="people-img"><br>
						아이디 반대
					</div>
				</div><div style="clear:both;"></div>
			</li>
			
		</ol>
	</div>
	<form>
		<select class="wid">
			<option selected>찬성</option>
			<option>반대</option>
		</select><br>
		<input type="text" class="wid" id="id" placeholder="아이디을 작성하세요"><br>
		<textarea id="area1" class="wid" rows="10" cols="55"></textarea><br>
		<button class="btn" id="btn3">작성하기</button>
	</form>
	</section>
</body>
</html>