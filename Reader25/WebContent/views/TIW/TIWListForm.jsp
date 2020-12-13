<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reader들을 위한 Reader 25</title>

<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/css/TIW.css">

<style>
.outer{
		width: 900px; min-height: 400px; margin-left: auto; margin-right: auto; 
		margin-top:100px; margin-bottom: 5%; background-color:  #F6F6F6;
	}
</style>
</head>
<body>
	<%-- <%@ include file="../common/menubar.jsp"%> --%>
	
	<div class="outer">
	
	<h2 class="txt_TIW" align="center">오늘은 나도 작가</h2>
	
		<table id="TIWTable">
			<tr>
				<th>글 번호</th>
				<th>원작</th>
				<th>제목</th>
				<th>작가</th>
				<th>작성일</th>
			</tr>
		</table>
		
		<!-- 오늘은 나도 작가 리스트 페이징 부분 -->
			<div class="pagingArea" align="center">
				<!-- 이전으로 -->
				<c:if test="${ pi.currentPage <= 1 }">
					<
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="blistBack" value="${ loc }">
						<c:param name="currentPage" value="${ pi.currentPage -1 }"/>
					</c:url>
					<a href="${ blistBack }"><</a>
				</c:if>
				
				<!-- [번호] -->
				<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
					<c:if test="${ p eq pi.currentPage }">
						<font color="red" size="4"><b>${ p }</b></font>
					</c:if>
					<c:if test="${ p ne pi.currentPage}">
						<c:url var="blistCheck" value="${ loc }">
							<c:if test="${ searchValue ne null }">
								<c:param name="searchCondition" value="${ searchCondition }"/>
								<c:param name="searchValue" value="${ searchValue }"/>
							</c:if>
							<c:param name="currentPage" value="${ p }"></c:param>
						</c:url>
						<a href="${ blistCheck }">${ p }</a>
					</c:if>
				</c:forEach>
				<!-- 다음으로 -->
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					>
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="blistNext" value="${ loc }">
						<c:if test="${ searchValue ne null }">
							<c:param name="searchCondition" value="${ searchCondition }"/>
							<c:param name="searchValue" value="${ searchValue }"/>
						</c:if>
						<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
					</c:url>
					<a href="${ blistNext }">></a>
				</c:if>
			</div>
		<div class="insertbuttonArea" align="right">
		<%-- <% if(loginUser != null) { %> --%>
		<input type="button" onclick="location.href='writeTIW.do'" id="writeTIWBtn" class="btn1" value="글쓰기">
		<%-- <% } %> --%>
		</div>
	</div>
	
	<%-- <%@ include file="../common/footer.jsp" %> --%>
</body>
</html>