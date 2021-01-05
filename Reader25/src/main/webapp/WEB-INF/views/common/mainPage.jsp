<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title><style>

.font_white{
position: absolute;
width: 56px;
height: 23px;
left: 1121px;
top: 639px;

font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 20px;
line-height: 23px;
text-align: center;

color: #FFFFFF;
}
#tomonth_button1{
position: absolute;
width: 81px;
height: 30px;
left: 404px;
top: 636px;

background: #A84E19;
border: 1px solid #000000;
box-sizing: border-box;
}


#tomonth_button2{
position: absolute;
width: 82px;
height: 32px;
left: 484px;
top: 636px;

background: #F5715C;
border: 1px solid #000000;
box-sizing: border-box;
}

#tomonth_button3{
position: absolute;
width: 80px;
height: 32px;
left: 564px;
top: 636px;

background: #F5715C;
border: 1px solid #000000;
box-sizing: border-box;
}
#best_button1{
position: absolute;
width: 80px;
height: 32px;
left: 876px;
top: 636px;

background: #F5715C;
border: 1px solid #000000;
box-sizing: border-box;
}
#best_button2{
position: absolute;
width: 82px;
height: 32px;
left: 796px;
top: 636px;

background: #F5715C;
border: 1px solid #000000;
box-sizing: border-box;
}
#best_button3{
position: absolute;
width: 81px;
height: 30px;
left: 716px;
top: 636px;

background: #A84E19;
border: 1px solid #000000;
box-sizing: border-box;
}
#discussion_button1{
position: absolute;
width: 80px;
height: 32px;
left: 1188px;
top: 634px;

background: #F5715C;
border: 1px solid #000000;
box-sizing: border-box;
}
#discussion_button2{
position: absolute;
width: 82px;
height: 32px;
left: 1108px;
top: 634px;

background: #F5715C;
border: 1px solid #000000;
box-sizing: border-box;
}
#discussion_button3{
position: absolute;
width: 81px;
height: 30px;
left: 1028px;
top: 634px;

background: #A84E19;
border: 1px solid #000000;
box-sizing: border-box;
}
#author_button1{
position: absolute;
width: 80px;
height: 32px;
left: 1504px;
top: 636px;

background: #F5715C;
border: 1px solid #000000;
box-sizing: border-box;
}
#author_button2{
position: absolute;
width: 82px;
height: 32px;
left: 1424px;
top: 636px;

background: #F5715C;
border: 1px solid #000000;
box-sizing: border-box;
}
#author_button3{
position: absolute;
width: 81px;
height: 30px;
left: 1344px;
top: 636px;

background: #A84E19;
border: 1px solid #000000;
box-sizing: border-box;
}
/* 로그인 위치 공간 적용 */
#login_space{
position: absolute;
width: 250px;
height: 250px;
left: 1331px;
top: 255px;
text-align:center;

background: #FFFFFF;
border: 1px solid #000000;
box-sizing: border-box;
border-radius: 50px;
}

/* 광고 */
#Advertising{
position: absolute;
width: 912px;
height: 267px;
left: 380px;
top: 247px;

background: linear-gradient(180deg, #FFFFFF 0%, rgba(255, 255, 255, 0) 100%), #FFFFFF;
border: 1px solid #000000;
box-sizing: border-box;
}

/*페이지 개수*/
#Advertisings{
position: absolute;
width: 15px;
height: 15px;
left: 829px;
top: 490px;

background: #C4C4C4;
}


/* 이달의 책 추천 List */
#recommendation_book{
position: absolute;
width: 237px;
height: 35px;
left: 415px;
top: 589px;

font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 30px;
line-height: 35px;

color: #000000;
}


/* 이달의Best리뷰 */
#best_review{
position: absolute;
width: 198px;
height: 35px;
left: 732px;
top: 589px;

font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 30px;
line-height: 35px;
text-align: center;

color: #000000;
}


/* 실시간 토론 현황 */
#real_time_discussion{
position: absolute;
width: 240px;
height: 35px;
left: 1044px;
top: 589px;

font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 30px;
line-height: 35px;

color: #000000;
}
/* 오나작 인기글 */
#today_Author{
position: absolute;
width: 200px;
height: 35px;
left: 1366px;
top: 597px;

font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 30px;
line-height: 35px;

color: #000000;

	
}
/*소식 페이지 슬라이드 배너*/
#news{
position: absolute;
width: 912px;
height: 267px;
left: 380px;
top: 247px;

background: linear-gradient(180deg, #FFFFFF 0%, rgba(255, 255, 255, 0) 100%), #FFFFFF;
border: 1px solid #000000;
box-sizing: border-box;
}
/* 리스트들 감싸는 사각형*/
#list_rect_recommendation{
position: absolute;
width: 240px;
height: 372px;
left: 404px;
top: 665px;

background: #FFFFFF;
border: 1px solid #000000;
box-sizing: border-box;
}

#list_rect_best{
position: absolute;
width: 240px;
height: 372px;
left: 716px;
top: 665px;

background: #FFFFFF;
border: 1px solid #000000;
box-sizing: border-box;
}

#list_rect_discussion{
position: absolute;
width: 240px;
height: 374px;
left: 1028px;
top: 663px;

background: #FFFFFF;
border: 1px solid #000000;
box-sizing: border-box;
}

#list_rect_author{
position: absolute;
width: 240px;
height: 372px;
left: 1344px;
top: 665px;

background: #FFFFFF;
border: 1px solid #000000;
box-sizing: border-box;
}

#login_button{
margin-top : 60px;
width: 125px;
height: 40px;
left: 1393px;
top: 315px;

background: #C95F12;
}
#Sign_Up{
margin-top : 15px;
width: 125px;
height: 40px;
left: 1393px;
top: 368px;

background: #FFC398;
}
#find_id{
margin-top : 397px;
}
#find_pwd{
margin-top : 397px;
}
.login_font{

font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 20px;
line-height: 29px;

color: #FFFFFF;
}

.Sign_Up_font{

font-family: Roboto;
font-style: normal;
font-weight: normal;
font-size: 20px;
line-height: 29px;
color: #000000;
}

#logo_size {

position: absolute;
width: 378px;
height: 118px;
left: 771px;
top: 4px;

}
#menubar{

position: absolute;
width: 3000px;
height: 67px;
left: -4px;
top: 138px;
background: #F5715C;
}
#UserImage{
 width : 100px;
 height : 100px;
 margin-top : 30px;
 margin-left : 20px;
 border: 1px solid #000000;
 float : left;
}
#UserInfomation{
 float : right
 width : 100px;
 height : 100px;
  margin-top : 30px;
 margin-left : 20px;
}
#Userpagelogout{
margin-top : 40px;
}
</style>
</head>
<body>
<div id = "news">
</div>
<div id = "login_space">
	<c:if test="${ empty sessionScope.loginUser }">
		<button class = "login_font" id =  "login_button" onclick="location.href='loginView.me'">로그인하기</button>
		<button class = "Sign_Up_font" id = "Sign_Up" onclick="location.href='enrollView.me'">회원가입</button>
		<br>
		<br>
		<span id = "find_id"><a>아이디 찾기</a> </span>
		<span id = "find_pwd"><a>비밀번호 찾기</a></span>
	</c:if>
	<c:if test="${ !empty sessionScope.loginUser }">
		<div id = "UserImage">사진</div>
		<div id = "UserInfomation">
		<h2><c:out value="${loginUser.name}"/></h2>
			<h4>${loginUser.rank }</h4>
		</div>
		<div id = "Userpagelogout">
			<c:url var="mypage" value="mypage.me"/>
			<c:url var="logout" value="logout.me"/>
			<button onclick="location.href='${mypage}'">마이페이지</button>
			<button onclick="location.href='${logout}'">로그아웃</button>
		</div>
	</c:if>
</div>
<a id = "recommendation_book">이달의 책 추천 </a>
<button class = "font_white" id = "tomonth_button1">일간</button>
<button class = "font_white" id = "tomonth_button2">주간</button>
<button class = "font_white" id = "tomonth_button3">월간</button>
<div id = "list_rect_recommendation">

</div>
<a id = "best_review">best 리뷰</a>
<button class = "font_white" id = "best_button1">월간</button>
<button class = "font_white" id = "best_button2">주간</button>
<button class = "font_white" id = "best_button3">일간</button>
<div id = "list_rect_best">

</div>
<a id = "real_time_discussion">실시간 토론 현황</a>
<button class = "font_white" id = "discussion_button1">조회수</button>
<button class = "font_white" id = "discussion_button2">댓글순</button>
<button class = "font_white" id = "discussion_button3">최신순</button>
<div id = "list_rect_discussion">
</div>
<a id = "today_Author">오나작 인기글</a>
<button class = "font_white" id = "author_button1">조회수</button>
<button class = "font_white" id = "author_button2">댓글순</button>
<button class = "font_white" id = "author_button3">최신순</button>
<div id = "list_rect_author">
</div>
</body>
</html>