<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="../../../resources/css/include/head/menu_head.css" type="text/css" rel="stylesheet">
<link href="../../../resources/css/help/review.css" type="text/css" rel="stylesheet">
<link rel='stylesheet' href="../../../resources/css/include/chat/chat.css">
<meta charset="UTF-8">
</head>
<body>
<div class="wrap">
<%@ include file="/WEB-INF/views/include/head/menu-head.jsp" %>
		<div class="page_name">리뷰해협</div>

		<div class="toggle_area">
			<input type="checkbox" id="toggle" class="toggle"> <label
				for="toggle" class="toggle_btn"> <span class="toggle_switch"></span>
			</label>
		</div>
		<div class="toggle_name">우리 동네만</div>

		<div class="review_list">
			<table>
				<thead>
				<tr>
					<th class="fieldList">
						<select class="filter" name="nation">
								<option>전체</option>
							<c:forEach var="fieldList" items="${fieldList}">
								<option>${fieldList}</option>
							</c:forEach>	
						</select>
					</th>
					<th>지역</th>
					<th>업체명</th>
					<th>만족도</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
				</thead>
				<c:forEach var="reviewList" items="${reviewList}">
					<tr>
					<td>${reviewList.field}</td>
					<td>${reviewList.oldAddress}</td>
					<td>${reviewList.company}</td>
					<td>★ ${reviewList.score}</td>
					<td>${reviewList.nickname}</td>
					<td>${reviewList.reviewDate}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		
		<div class="paging" style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="/help/review?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="/help/review?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/help/review?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>

	</div>
	<%@ include file="/WEB-INF/views/include/chat/chat.jsp" %>
</body>
<script type="text/javascript" src="../../../resources/js/include/chat/chat.js"></script>
</html>