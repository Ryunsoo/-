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
/* 	color: #b57033; */
	font-size: 21px;
	font-weight: bold;
}

.page-title-wrapper {
	display: flex;
	justify-content: space-between;
}

/* 제목 옆에 수정삭제 아이콘 호버 */
#update-delete-icon> i:hover {
	cursor: pointer;
	color: #909090;
}


/* 구분선 */

.line-wrapper> #seprate-line {
	color: black;
	width: 100%;
}

/* 제목파트 끝 */





/* 제품파트 wrapper */
.product-detail-wrapper {
	display: flex;
}



/* 제품 이미지 */

.product-detail-image {
	display: flex;
	margin-top: 30px;
	margin-left:70px;
	width: 430px;
	height: 430px;
	flex-direction: column;
	justify-content: space-between;
}

.product-detail-image> #uploaded-image{
	width: 100%;
	height: 430;
}

.product-detail-image> #uploaded-image> #product-image {
	height: 100%;
	width: 100%;
}


/* 제품 정보 */
.product-info{
	margin-left: 60px;
	margin-top: 30px;
	width: 460px;
	word-break:break-all;   /* 영역 밖으로 텍스트가 삐져나가면, 자동 줄바꿈처리 */
}

.product-name {
	font-weight: bold;
	font-size: 22px;
}
/* 오랜지색 소제목들 */
.orange-color-subtitle {
	color:  #e58030;
	font-weight: bold;
	font-size: 17px;
}

/* 신청 마감시간 붉은색으로 */
#remaining-time {
	font-size: 13px;
	font-weight: bold;
	color: #e65143;
}





/* 아래쪽 구분선 */
#line-bottom-wrapper {
	margin-top: 30px;
	margin-bottom: 20px;
	margin-left: 50px;
	margin-right: 50px;
}



/* 신청해협, 문의해협 파트 */
.submit-and-ask-button {
	margin-top: 30px;
	margin-bottom: 20px;
	margin-left: 50px;
	margin-right: 50px;
	
	display: flex;
	align-items: center;
	justify-content: space-between;
	
}


/* 재고/신청개수 상태 */
.stock-status {
	margin-left: 30px;
}

#status-bar-outer {
	background-color: #e0e0e0;
	width: 300px;
	height: 10px;
	border-radius: 100px 100px 100px 100px;
}

/* 안쪽 초록색 영역 (width로 조절) */
#status-bar-inner {
	background-color: #2ecc71;
	height: 100%;
	width: 60%;
	border-radius: 100px 100px 100px 100px;
}




/* 신청해협 & 문의해협 버튼 wrapper */
.submit-ask {
	display: flex;
	justify-content: flex-end;
	width: 220px;
}

.submit-ask> div{
	width: 100px;
	height: 100px;
	border-radius: 25px;
	background-color: #e67e22;
	display: flex;
	justify-content: center;
    align-items: center;
    color: white;
    font-weight: bold;
    font-size: 19px; 
    transition: all 0.13s;
    cursor: pointer;
}

/* 신청해협/ 문의해협 버튼 호버 */
.submit-ask> div:hover{
	background-color: #f9b67a;
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
		
		<!-- 페이지 제목 -->
		<div class="title">
			<div class="page-title-wrapper">
				<div id="this-page-name">&nbsp&nbsp조회해협</div>
				<div id="update-delete-icon">
					<i class="fas fa-pen"></i>
					<i class="fas fa-trash"></i>
				</div>
			</div>
			
			<!-- 구분선 -->
			<div id="line-wrapper">
				<hr id="seprate-line">
			</div>
			
		</div>
		
		
		
		<div class="product-detail-wrapper">
			
			<!-- 이미지 -->
			<div class="product-detail-image">
				<div id="uploaded-image">
					<img id="product-image" src = "../../../resources/image/product-image.png">
				</div>
			</div>
			
			
			
			<!-- 제품정보 -->
			<div class="product-info">
				<!-- 제품명 -->
				<div class="product-name">
					탐사수 (2Lx12개)
				</div>
				<br>
				
				<!-- 제품링크 -->
				<div class="product-link">
					<div class="orange-color-subtitle">제품 링크</div>
					<a href="https://www.coupang.com/vp/products/27613130?itemId=109846121&vendorItemId=3213757282&sourceType=CAMPAIGN&campaignId=82&categoryId=194176&isAddedCart=">
					https://www.coupang.com/vp/products/27613130?itemId=109846121&vendorItemId=3213757282&sourceType=CAMPAIGN&campaignId=82&categoryId=194176&isAddedCart=
					</a>
				</div>
				<br>
				
				<!-- 거래 위치 및 시간 -->
				<div class="location-and-time">
					<div class="orange-color-subtitle">거래 위치 및 시간</div>
					<div>
						거래 위치 : 강남 kh정보교육원 
						<span><i class="fas fa-map-marker-alt"></i></span>
					</div>
					
					<div>
						거래 시간 : 12월 7일 오후 3:20
					</div>
					
					<div id="remaining-time">
						신청 마감시간 : 60일 언저리
					</div>
				</div>
				<br>
				
				<!-- 제품 금액 -->
				<div class="product-price">
					<div class="orange-color-subtitle">
						제품 금액
					</div>
					
					<div>
						6,790원(1roekd 565원)
					</div>
				</div>
				<br>
				
				<!-- 어필 -->
				<div class="product-appeal">
					<div class="orange-color-subtitle">
						어필
					</div>
					
					<div>
						물 3개씩 구매하실 분만 신청해주세요
					</div>
				</div>
				
				
			</div>
			
			
			
		</div>
		
		
		<!-- 구분선 -->
		<div id="line-bottom-wrapper">
			<hr id="seprate-line">
		</div>
		
		
		
		<!-- 현재신청개수, 신청해협버튼, 문의해협 버튼 -->
		<div class="submit-and-ask-button">
			
			
			<!-- 재고/신청 현황 -->
			<div class="stock-status">
				<ul>
					<li>현재 남은 신청개수 : 5개</li>
					<li>남은 개수 : 7개</li>
				</ul>
				
				<div id="status-bar-outer">
					<div id="status-bar-inner">
					</div>
				</div>
			</div>
			
			<div class="submit-ask">
				<div>
					<p>구매확정</p>
				</div>
			</div>
			
			
		</div>
		
		
		
		
		
	
	
	
	</div>
	<!-- 섹션 끝 -->
	
	
	<!-- 후터 -->
	<div class="hooter">
	</div>



</body>
</html>