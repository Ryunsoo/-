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
								<c:when test="${not empty myPurchaseInfo.matchIdx}">
									공구참여
								</c:when>
								<c:otherwise>
									공구모집
								</c:otherwise>
							</c:choose>
							</td>
							<td>${myPurchaseInfo.itemName}</td>
							<td>${myPurchaseInfo.dealTime}</td>
							<td>${myPurchaseInfo.dealLoc}</td>
							<td>
								<c:choose>
									<c:when test="${not empty myPurchaseInfo.ongoing}">
										<c:choose>
											<c:when test="${myPurchaseInfo.ongoing eq 0}">
												구매대기
											</c:when>
											<c:when test="${myPurchaseInfo.ongoing eq 1}">
												구매확정
											</c:when>
											<c:when test="${myPurchaseInfo.ongoing eq 2}">
												거래완료
											</c:when>
										</c:choose>
									</c:when>
									<c:when test="${empty myPurchaseInfo.ongoing}">
										<c:choose>
											<c:when test="${myPurchaseInfo.done eq 'N'}">
												모집중
											</c:when>
											<c:when test="${myPurchaseInfo.done eq 'Y'}">
												모집완료
											</c:when>
										</c:choose>
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
			<select id="status-dropdown" name="status">
					<option selected>처리상태</option>
					<option value="?">구매대기</option>
					<option value="?">구매확정</option>
					<option value="?">거래완료</option>
			</select>
		</div>
		
		<br>
		
		<!-- 물품 list 페이징 -->
		<div class="list-paging-wrapper">
			<div class="list-paging">
				<div>
					<i class="fas fa-chevron-left"></i>
				</div>
				<div>1</div>
				<div>2</div>
				<div>3</div>
				<div>4</div>
				<div>5</div>
				<div>
					<i class="fas fa-chevron-right"></i>
				</div>
			</div>
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



</script>


<script type="text/javascript" src="../../../resources/js/include/chat/chat.js"></script>
</html>