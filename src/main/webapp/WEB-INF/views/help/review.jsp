<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
			<c:if test="${myArea eq 'on'}">
				<input type="checkbox" id="toggle" class="toggle" onchange="reviewFiltering()" checked="checked"> 
					<label for="toggle" class="toggle_btn" > 
				<span class="toggle_switch"></span>
			</label>
			</c:if>
			<c:if test="${myArea eq 'off'}">
				<input type="checkbox" id="toggle" class="toggle" onchange="reviewFiltering()"> 
					<label for="toggle" class="toggle_btn" > 
				<span class="toggle_switch"></span>
			</label>
			</c:if>
			
		</div>
		<div class="toggle_name">우리 동네만</div>

		<div class="review_list">
			<table>
				<thead>
				<tr>
					<th class="fieldList">
						<select class="filter" name="nation" onchange="reviewFiltering()" >
							<c:if test=""></c:if>
								<option value="all">전체</option>
							<c:forEach var="fieldList" items="${fieldList}">
								<option value="${fieldList.field}"
									<c:if test="${param.field == fieldList.field }">selected</c:if>
								>${fieldList.fullName}</option>
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
					<td class="recomment" onmouseenter="recomment(this,${reviewList.helpIdx})" onmouseout="recommentOut(this)">★ ${reviewList.score}
					<div class="recomment_box"></div></td>
					<td>${reviewList.nickname}</td>
					<td>${reviewList.reviewDate}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		
		<div class="pg_wrap" style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a class="pg_start" href="/help/review?nowPage=1&cntPerPage=${paging.cntPerPage}&field=${filter}&myArea=${myArea}">&lt;&lt;</a>
			<a class="pg_prev" href="/help/review?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&field=${filter}&myArea=${myArea}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<a class="pg_current">${p }</a>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a class="pg_page" href="/help/review?nowPage=${p }&cntPerPage=${paging.cntPerPage}&field=${filter}&myArea=${myArea}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a class="pg_next" href="/help/review?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&field=${filter}&myArea=${myArea}">&gt;</a>
			<a class="pg_end" href="/help/review?nowPage=${paging.lastPage}&cntPerPage=${paging.cntPerPage}&field=${filter}&myArea=${myArea}">&gt;&gt;</a>
		</c:if>
	</div>

	</div>
	<%@ include file="/WEB-INF/views/include/chat/chat.jsp" %>
</body>
<script type="text/javascript" src="../../../resources/js/include/chat/chat.js"></script>
<script type="text/javascript" src="../../../resources/js/help/review.js"></script>
</html>