<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head/admin-head.jsp" %>
<link rel="stylesheet" href="${contextPath}/resources/css/admin/join-request.css">
</head>
<body>
	<div class='main'>
	
		<!-- 사이트 메뉴(조회해협 & MY 해협) -->
		<!-- <aside> -->
		<div class='aside'>
			<button class="join_list" onclick="location.href='/admin/join-request'">가입 요청</button>
			<button class="revision_list" onclick="location.href='/admin/modify-request'">수정 요청</button>
			<button class="finished_list" onclick="location.href='/admin/finish-list'">완료 목록</button>
		</div>
		<!-- </aside> -->
		<div class='section'>
			<div class='wrapper'>
				<div class='wrap_list'>
					<div class='list'>
						<table>
							<thead>
								<tr>
									<th>아이디</th>
									<th>업체명</th>
									<th>요청일</th>
									<th>자세히</th>
								</tr>
							</thead>
							 <c:if test="${not empty joinRequestList}">
							 	<c:forEach items="${joinRequestList}" var="jl">
									<tbody>
										<tr><td>${jl.id}</td><td>${jl.company}</td><td>${jl.parseDate}</td><td><button class='check'>조회</button></td>
									</tbody>
								</c:forEach>
							</c:if>
						</table>
					</div>
					<div class="pg_wrap" style="display: block; text-align: center;">
						<c:if test="${paging.startPage != 1 }">
							<a class="pg_start"
								href="/purchase/my-purchase?nowPage=1&cntPerPage=${paging.cntPerPage}&ongoing=${field.ongoing}&done=${field.done}">&lt;&lt;</a>
							<a class="pg_prev"
								href="/purchase/my-purchase?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&ongoing=${field.ongoing}&done=${field.done}">&lt;</a>
						</c:if>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
							var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage }">
									<a class="pg_current">${p }</a>
								</c:when>
								<c:when test="${p != paging.nowPage }">
									<a class="pg_page"
										href="/purchase/my-purchase?nowPage=${p }&cntPerPage=${paging.cntPerPage}&ongoing=${field.ongoing}&done=${field.done}">${p }</a>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.endPage != paging.lastPage}">
							<a class="pg_next"
								href="/purchase/my-purchase?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&ongoing=${field.ongoing}&done=${field.done}">&gt;</a>
							<a class="pg_end"
								href="/purchase/my-purchase?nowPage=${paging.lastPage}&cntPerPage=${paging.cntPerPage}&ongoing=${field.ongoing}&done=${field.done}">&gt;&gt;</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	
		
</body>
</html>