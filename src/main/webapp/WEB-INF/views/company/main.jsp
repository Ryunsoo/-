<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head/company-head.jsp" %>
<link rel="stylesheet" href="${contextPath}/resources/css/company/main.css">
<link rel='stylesheet' href="../../../resources/css/include/chat/chat.css">
<style>
.alertMessage {
	text-align: center;
	font-size: 20px;
	font-weight: bold;
}
</style>
<script type="text/javascript">

function alertMessage(msg){
	let modal = initModal('modal', 3);
	appendTitle(modal, '');
	setButton(modal, '닫기');
	setContent(modal, true, true);
	modalBlock();
	
	let modalBody = $('<div class="alertMessage">'+msg+'</div><br>')
	.addClass('send_modal_content');
	
	$('.modal_content').append(modalBody);
	
	$('.modal_left_btn').click(function() {
		modalNone();
	})
}

</script>
</head>
<body>
<%@ include file="/WEB-INF/views/include/chat/chat2.jsp" %>
	<div class='main'>
	
		<!-- 사이트 메뉴(조회해협 & MY 해협) -->
		<!-- <aside> -->
		<div class='aside'>
			<button class="help_list" onclick="location.href='/company/main'">조회 해협</button>
			<button class="my_help" onclick="location.href='/company/my'">MY 해협</button>
		</div>
		<!-- </aside> -->
		<div class='section'>
			<div class='wrapper'>
				<div class='search_area'>
					<div>
						<input class='area' name='area' placeholder='지역 검색' onkeypress="if(event.keyCode==13){searchArea()}">
						<i class="fas fa-search" onclick="searchArea()"></i>
					</div>
				</div>
				<div class='wrap_list'>
					<div class='list'>
						<table>
							<thead>
								<tr>
									<th>신청 분야</th>
									<th>지역</th>
									<th>신청인</th>
									<th>요청일</th>
									<th>희망 금액</th>
									<th>상세보기</th>
									
								</tr>
							</thead>
							<tbody>
							<c:forEach var="requestList" items="${requestList}">
								<tr>
									<td>${requestList.field}</td>
									<td>${requestList.oldAddress}</td>
									<td>${requestList.reqName}</td>
									<td>${requestList.reqTime}</td>
									<td>${requestList.reqPay} 원</td>
									<td class='td-icon'><i class="far fa-file-alt" onclick="showReqDetail(${requestList.reqIdx})"></i></td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="page">
					<div class="pg_wrap" style="display: block; text-align: center;">		
					<c:if test="${paging.startPage != 1 }">
						
						<a class="pg_start" href="/company/main?nowPage=1&cntPerPage=${paging.cntPerPage}<c:if test="${not empty area}">&area=${area}</c:if>">&lt;&lt;</a>
						<a class="pg_prev" href="/company/main?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}<c:if test="${not empty area}">&area=${area}</c:if>">&lt;</a>
					</c:if>
					<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
						<c:choose>
							<c:when test="${p == paging.nowPage }">
								<a class="pg_current">${p }</a>
							</c:when>
							<c:when test="${p != paging.nowPage }">
								<a class="pg_page" href="/company/main?nowPage=${p }&cntPerPage=${paging.cntPerPage}<c:if test="${not empty area}">&area=${area}</c:if>">${p }</a>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:if test="${paging.endPage != paging.lastPage}">
						<a class="pg_next" href="/company/main?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}<c:if test="${not empty area}">&area=${area}</c:if>">&gt;</a>
						<a class="pg_end" href="/company/main?nowPage=${paging.lastPage}&cntPerPage=${paging.cntPerPage}<c:if test="${not empty area}">&area=${area}</c:if>">&gt;&gt;</a>
					</c:if>
				</div>
				</div>
				</div>
			</div>
		</div>
	</div>
	<c:if test="${not empty message}">
		<script>alertMessage('${message}')</script>
	</c:if>
	<div class='back'></div>
		
	<!-- 자취해협 정보 footer -->
	<%@ include file="/WEB-INF/views/include/footer/footer.jsp" %>
	
	<script type="text/javascript" src="../../../resources/js/include/chat/chat2.js"></script>
</body>
	<script type="text/javascript" src="../../../resources/js/company/main.js"></script>
	<script type="text/javascript" src="../../../resources/js/company/detail.js"></script>
</html>