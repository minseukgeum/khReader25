<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reader들을 위한 Reader 25</title>

<link rel="stylesheet" href="${contextPath}/resources/css/TIW/TIWListForm.css" type="text/css">

<style>
.outer{
		width: 80%; min-height: 400px; margin-left: 10%; margin-right: 10%; 
		margin-top:100px; margin-bottom: 5%; min-width: 1000px;
		background-color:  #F6F6F6;
	}
</style>
</head>
<body>
	<c:import url="../common/menubar.jsp"/>
	
	<div class="outer">
	
	<h2 class="txt_TIW" align="center">오늘은 나도 작가</h2>
	
	<h3 align="center">총 게시글 갯수 : ${ pi.listCount }</h3>
	
		<table id="TIWTable" align="center">
			<tr>
				<th>글 번호</th>
				<th>원작</th>
				<th>제목</th>
				<th>작가</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
			<c:forEach var="b" items="${ list }">
			<tr class="contentTR">
				<td align="center">${ b.boardNo }</td>
				<td align="center">${ b.cate }</td>
				<td align="left">
					<c:if test="${ !empty loginUser }">
						<c:url var="TIWdetail" value="TIWdetail.to">
							<c:param name="boardNo" value="${ b.boardNo }"/>
							<c:param name="page" value="${ pi.currentPage }"/>
						</c:url>
						<a href="${ TIWdetail }">${ b.bTitle }(${ b.comCount })	</a>
					</c:if>
					<c:if test="${ empty loginUser }">
						${ b.bTitle }(${ b.comCount })		
					</c:if>
				</td>
				
				<td align="center">${ b.userId }</td>
				<td align="center">${ b.enrollDay }</td>
				<td align="center">${ b.bCount }</td>
			</tr>
			</c:forEach>
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
		
			<c:url var="writeTIW" value="writeTIW.to">
				<c:param name="loginUser" value="${ loginUser }"/>
			</c:url>
				
			<c:if test="${ loginUser ne null }">
				<input type="button" onclick="location.href='${ writeTIW }'" id="writeTIWBtn" class="btn1" value="글쓰기">
			</c:if>
		</div>
	</div>
	
	<%-- <%@ include file="../common/footer.jsp" %> --%>
</body>
</html>