<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head/menu-head.jsp" %>
<link href="../../../resources/css/include/head/menu_head.css" type="text/css" rel="stylesheet">
<link rel='stylesheet' href="../../../resources/css/purchase/purchase-mypurchase.css">
<link rel='stylesheet' href="../../../resources/css/chat/chat.css">
<meta charset="UTF-8">


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
					<tr>
						<td>2</td>
						<td>공구참여</td>
						<td>탐사수(2L x 12개)</td>
						<td>2021년 12월 7일 오후 3:20</td>
						<td>강남 kh정보교육원</td>
						<td>구매확정</td>
					</tr>
					
					<tr>
						<td>1</td>
						<td>공구모집</td>
						<td>쌀 한 포대</td>
						<td>2021년 11월 20일 오후 10:00</td>
						<td>신천역 3번출구</td>
						<td>거래완료</td>
					</tr>
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
				
				<tbody>
					<tr id="detail-table-body">
						<td>구구</td>
						<td>권구현</td>
						<td>010-1111-2222</td>
						<td>2</td>
					</tr>
					<tr id="detail-table-body">
						<td>babyfox225</td>
						<td>황륜수</td>
						<td>010-3333-4444</td>
						<td>3</td>
					</tr>
					<tr id="detail-table-body">
						<td>구구</td>
						<td>권구현</td>
						<td>010-1111-2222</td>
						<td>2</td>
					</tr>
					<tr id="detail-table-body">
						<td>babyfox225</td>
						<td>황륜수</td>
						<td>010-3333-4444</td>
						<td>3</td>
					</tr>
					<tr id="detail-table-body">
						<td>구구</td>
						<td>권구현</td>
						<td>010-1111-2222</td>
						<td>2</td>
					</tr>
					<tr id="detail-table-body">
						<td>babyfox225</td>
						<td>황륜수</td>
						<td>010-3333-4444</td>
						<td>3</td>
					</tr>
					<tr id="detail-table-body">
						<td>구구</td>
						<td>권구현</td>
						<td>010-1111-2222</td>
						<td>2</td>
					</tr>
					<tr id="detail-table-body">
						<td>babyfox225</td>
						<td>황륜수</td>
						<td>010-3333-4444</td>
						<td>3</td>
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
<script type="text/javascript" src="../../../resources/js/chat/chat.js"></script>
</html>