<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head/main-head.jsp" %>
<%@ include file="/WEB-INF/views/head/head.jsp" %>
<link href="../../../resources/css/include/head/menu_head.css" type="text/css" rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

body, html{
   /* heigth: 690px; */
   position: relative;
   min-height: 690px;
   width: 1130px;
   display: flex;
   flex-direction: column;
   align-items: center;
   font-family: 'Han Sans, 본고딕';
}




/* 섹션 시작*/

.section{
	height: 100%;
	width: 95%;
}





/* form wrapper */
.form-wrapper{
	display: flex;
}



/* 제목 파트 */

.title {
	margin-top: 30px;
	margin-bottom: 20px;
	margin-left: 50px;
	margin-right: 50px;
 	color: #a47c02;
	font-size: 21px;
	font-weight: bold;
}

/* 제목파트 끝 */



/* 테이블 파트 */
.table-wrapper {
	margin-left: 70px;
	width: 985px;
}

.table-wrapper> .my-bought-list {
	width: 100%;
	text-align: center;
	border-collapse: collapse;  /* 표(table)의 테두리와 셀(td)의 테두리 사이의 간격을 없앰. 겹치는 부분은 한 줄로 나타냅니다.*/
	color: #606060;
}

#head-row> tr> th{
	height: 55px;
	font-size: 22px;
/* 	font-weight: normal; */
	border-bottom: 1px solid;
}

#body-row> tr{
	transition: all 0.13s;
}

#body-row> tr> td{
	border-bottom: 1px solid;
	height: 40px;
}

#body-row> tr:hover{
	cursor: pointer;
	background-color: #eaeaea;
}


/* 처리상태 드롭다운 */
.status-select {
	display: flex;
	justify-content: flex-end;
	margin-right: 80px;
	margin-top: 20px;
}

.status-select> #status-dropdown {
	height: 30px;
	width: 100px;
	border: 2px solid;
	border-color: #999999;
	border-radius: 3px 3px 3px 3px;
	font-size: 15px;
	color: #505050;
}










/* 상품목록 페이징 */

.list-paging-wrapper{
	padding-top: 20px;
	padding-bottom: 20px;
	display: flex;
	justify-content: center;
}

.list-paging-wrapper> .list-paging {
	width: 150px;
	display: flex;
	justify-content: space-between;
	font-size: 20px;
	
}

/* 페이징 처리 호버이벤트 */

.list-paging-wrapper> .list-paging> div{
	font-weight: bold;
	transition: all 0.2s;
	color: #868686;
}

.list-paging-wrapper> .list-paging> div:hover{
	color: #3498db;
}



/* 상세내역  */

#table-title {

	margin-left: 90px;
	height: 35px;
	width: 100px;
	background-color: #bebebe;
	color: white;
	display: flex;
	align-items: center;
	justify-content: center;
	font-weight: bold;
	font-size: 19px;
}

.table-detail-wrapper {
	margin-left: 70px;
	width: 985px;
	height: 250px;
	border: solid;
	border-color: #bebebe;
	overflow: auto;
	display: flex;
	flex-direction: column;
    align-items: center;
}



.detail-table {
	margin-top: 20px;
	margin-bottom: 20px;
	border: solid;
	border-color: #cccccc;
	width: 920px;
	border-collapse: collapse;
}


#detail-table-header {
	background-color: #eaeaea;
}

#detail-table-header> th {
	border: 0.5px solid #cccccc;
	height: 50px;
}

#detail-table-body> td {
	border: 0.5px solid #cccccc;
	height: 45px;
	text-align: center;
	font-size: 19px;
}









/* 섹션 끝 */




/* 후터 */
.hooter {
	height: 200px;
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





</body>
</html>