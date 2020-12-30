<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BookReview</title>
<script type="text/javascript" src="<%= request.getContextPath() %>/js/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/bookReview.css">
</head>
<body>
	<%@include file="../common/menubar.jsp" %>
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
					<img src="<%=request.getContextPath() %>/resources/images/bookreview/search.png" id="search-icon"/>
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
			<% for(int i = 0; i < 12; i++){ %>
			<div class="list-div">
				<div class="img-div">
					<img class="list-img" src="${ contextPath }/resources/images/bookreview/book.jpg">
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
<%-- 		<c:if test="${ !empty loginUser }"> --%>
			<div class="write-btn">
				<img src="${contextPath }/resources/images/bookreview/write.png"/>
			</div>
			<script>
				$('.write-btn').click(function(){
					location.href="<%=request.getContextPath()%>/write.re";
				});
			</script>
<%-- 		</c:if> --%>
	</section>
</body>
</html>