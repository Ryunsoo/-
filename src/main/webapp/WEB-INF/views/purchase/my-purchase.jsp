<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head/menu-head.jsp" %>
<link href="../../../resources/css/include/head/menu_head.css" type="text/css" rel="stylesheet">
<link rel='stylesheet' href="../../../resources/css/purchase/purchase-mypurchase.css">
<link rel='stylesheet' href="../../../resources/css/include/chat/chat.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">

<style type="text/css">

#tempbody> td{
	border: 0.5px solid #cccccc;
	height: 150px;
	text-align: center;
	font-size: 19px;
}

</style>

</head>








<body>

	<!-- 섹션 시작 -->
	<div class="section">
		
		<!-- 작성해협 제목 -->
		<div class="title">
			<div id="this-page-name">&nbsp&nbspMY공구</div>
		</div>
		
		
		<!-- table wrapper -->
		<div class="table-wrapper">
			
			<!-- MY공구 테이블 -->
			<table class="my-bought-list">
				<thead id="head-row">
					<tr>
						<th>&nbsp&nbsp&nbsp&nbsp&nbsp</th>
						<th>말머리</th>
						<th>제품명</th>
						<th>거래시간</th>
						<th>거래위치</th>
						<th>처리상태</th>
					</tr>
				</thead>
				
				<tbody id="body-row">
					<c:forEach var="myPurchaseInfo" items="${myPurchaseInfo}" varStatus="status">
						<tr onclick = "participantsList('${myPurchaseInfo.regIdx}')">
							<td>${status.count}</td>
							<td>
							<c:choose>
								<c:when test="${authentication.id eq myPurchaseInfo.id}">
									공구모집
								</c:when>
								<c:otherwise>
									공구참여
								</c:otherwise>
							</c:choose>
							</td>
							<td>${myPurchaseInfo.itemName}</td>
							<td>${myPurchaseInfo.dealTime}</td>
							<td>${myPurchaseInfo.dealLoc}</td>
							<td>
								<c:choose>
									<c:when test="${authentication.id ne myPurchaseInfo.id && myPurchaseInfo.ongoing eq 0}">
										구매대기
									</c:when>
									<c:when test="${authentication.id ne myPurchaseInfo.id && myPurchaseInfo.ongoing eq 1}">
										구매확정
									</c:when>
									<c:when test="${authentication.id ne myPurchaseInfo.id && myPurchaseInfo.ongoing eq 2}">
										거래완료
									</c:when>
									<c:when test="${authentication.id eq myPurchaseInfo.id && myPurchaseInfo.done eq 'N'}">
										모집중
									</c:when>
									<c:when test="${authentication.id eq myPurchaseInfo.id && myPurchaseInfo.done eq 'Y'}">
										모집완료
									</c:when>
									<c:when test="${authentication.id eq myPurchaseInfo.id && myPurchaseInfo.done eq 'C'}">
										거래취소
									</c:when>
								</c:choose>
							</td>
						</tr>
					</c:forEach>
				</tbody>
				
			</table>
			
		</div>
		
		<!-- 처리상태 select -->
		<div class="status-select">
			<select id="status-dropdown" name="ongoing" onchange="statusFiltering()" onFocus = "focus()">
					<option value="3" <c:if test="${field.ongoing eq '3'}">selected</c:if>>전체보기</option>
					<option value="0" <c:if test="${field.ongoing eq '0'}">selected</c:if>>구매대기</option>
					<option value="1" <c:if test="${field.ongoing eq '1'}">selected</c:if>>구매확정</option>
					<option value="2" <c:if test="${field.ongoing eq '2'}">selected</c:if>>거래완료</option>
					<option value="N" <c:if test="${field.done eq 'N'}">selected</c:if>>모집중</option>
					<option value="Y" <c:if test="${field.done eq 'Y'}">selected</c:if>>모집완료</option>
					<option value="C" <c:if test="${field.done eq 'C'}">selected</c:if>>거래취소</option>
			</select>
		</div>
		
		<br>
		
		<!-- 물품 list 페이징 -->
		<div class="pg_wrap" style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a class="pg_start" href="/purchase/my-purchase?nowPage=1&cntPerPage=${paging.cntPerPage}&ongoing=${field.ongoing}&done=${field.done}">&lt;&lt;</a>
			<a class="pg_prev" href="/purchase/my-purchase?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}&ongoing=${field.ongoing}&done=${field.done}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<a class="pg_current">${p }</a>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a class="pg_page" href="/purchase/my-purchase?nowPage=${p }&cntPerPage=${paging.cntPerPage}&ongoing=${field.ongoing}&done=${field.done}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a class="pg_next" href="/purchase/my-purchase?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&ongoing=${field.ongoing}&done=${field.done}">&gt;</a>
			<a class="pg_end" href="/purchase/my-purchase?nowPage=${paging.lastPage}&cntPerPage=${paging.cntPerPage}&ongoing=${field.ongoing}&done=${field.done}">&gt;&gt;</a>
		</c:if>
	</div>
		
		
		
		<!-- MY공구 상세내역 -->
		
		<div id="table-title">
			상세내역
		</div>
		<div class="table-detail-wrapper">
			
			<table class="detail-table">
				<thead>
					<tr id="detail-table-header">
						<th>공구 참여자</th>
						<th>참여자 이름</th>
						<th>전화번호</th>
						<th>구매 수량</th>
					</tr>
				</thead>
				
				<tbody id="participants-list">
					<tr id="tempbody">
						<td colspan='4'>공구 참여자 정보</td>
					</tr>
				</tbody>
				
			</table>
			

			
			
		</div>

		

		
	
	</div>
	<!-- 섹션 끝 -->
	
	
	<!-- 후터 -->
	<div class="hooter">
	</div>
	





<%@ include file="/WEB-INF/views/include/chat/chat.jsp" %>
</body>

<script type="text/javascript">


let tbody = $('#participants-list');
let participantsList = (regIdx) => {
	let participants;
	fetch("http://localhost:9090/purchase/participants-list?regIdx=" + regIdx)
	.then((response) => response.json())
	.then((response) => {
		participants = response;
		console.log(participants);
		tbody.empty();
		if(participants){
			for(let i = 0; i<participants.length; i++) {
				  tbody.append('<tr id="detail-table-body">'
						   + '<td>' + participants[i].nickname + '</td>'
						   + '<td>' + participants[i].name + '</td>'
						   + '<td>' + participants[i].tell + '</td>'
						   + '<td>' + participants[i].joinBuyNum + '</td>'
						   + '</tr>');
			 }
		} else {
			tbody.append('<tr id="tempbody"><td colspan="4">참여자가 없습니다</td></tr>');
		}
	   
	});
}




let temp = '';

function statusFiltering() {
	temp = $('#status-dropdown').val();
	let ongoing;
	let done;
	if(temp == '0' || temp == '1' || temp == '2') {
		ongoing = temp;
		location.href='/purchase/my-purchase?ongoing=' + ongoing;
	} else if(temp == 'Y' || temp == 'N' || temp == 'C'){
		done = temp;
		location.href='/purchase/my-purchase?done=' + done;
	} else {
		location.href='/purchase/my-purchase';
	}
} 



</script>


<script type="text/javascript" src="../../../resources/js/include/chat/chat.js"></script>
</html>