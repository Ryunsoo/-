<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head/main-head.jsp" %>
<%@ include file="/WEB-INF/views/include/head/menu-head.jsp" %>
<link href="../../../resources/css/include/head/menu_head.css" type="text/css" rel="stylesheet">
<link rel='stylesheet' href="../../../resources/css/purchase/purchase-detail.css">
<meta charset="UTF-8">
</head>


<body>
	<!-- 섹션 시작 -->
	<div class="section">
		
		<!-- 페이지 제목 -->
		<div class="title">
			<div id="this-page-name">&nbsp&nbsp조회해협</div>
			
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
				<ul id="stock-list">
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
					<p>신청해협</p>
				</div>
				<div>
					<p>문의해협</p>
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