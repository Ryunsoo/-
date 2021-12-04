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
										<tr><td>${jl.id}</td><td>${jl.company}</td><td>${jl.parseDate}</td><td>
										<button onclick="location.href = '/admin/approval-first?id=${jl.id}&cate=join'" class='check'>조회</button></td>
									</tbody>
								</c:forEach>
							</c:if>
						</table>
					</div>
					<div class='page'>
						<c:if test="${paging.startPage ne 1}">
							<i class="fas fa-caret-left" onclick="location.href = '/admin/join-request?nowPage=1&cntPerPage=${paging.cntPerPage}'"></i>
						</c:if>
						<div>
						<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage}">
									<span>${p}</span>
								</c:when>
								<c:otherwise>
									<span>${p}</span>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						</div>
						<c:if test="${paging.endPage != paging.lastPage}">
							<i class="fas fa-caret-right" onclick="location.href = '/admin/join-request?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}'"></i>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	
		
</body>
</html>