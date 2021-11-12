<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head/menu-head.jsp" %>
<link href="../../../resources/css/include/head/menu_head.css" type="text/css" rel="stylesheet">
<link rel='stylesheet' href="../../../resources/css/purchase/purchase-main.css">
<link rel='stylesheet' href="../../../resources/css/chat/chat.css">
<meta charset="UTF-8">



</head>






<body>


	
	
	
	<!-- 섹션 시작 -->
	<div class="section">
		
		<!-- 검색파트 wrapper -->
		<div class="search-wrapper">
		
			<!-- 서치 파트-->
			<div class="search">
				<div class="this-page-name">구매해협</div>
				
				<form class="search-form">
					<input id="search-input" type="text" placeholder="검색어를 입력하세요.">
					<div id="search-submit">
						<i class="fas fa-search"></i>
					</div>
				</form>
			</div>
			
			<!-- 필터 파트 -->
			<div class="search-filter">
				
				<div>등급</div>
			
				<!-- 등급 선택 -->
				<select id="grade-dropdown" name="grade">
					<option selected>전체</option>
					<option value="dia">다이아</option>
					<option value="gold">골드</option>
					<option value="silber">실버</option>
					<option value="bronze">브론즈</option>
				</select>
				
				<div>우리 동네만</div>
				
				<!-- toggle switch -->
				<label class="switch">
				  <input type="checkbox">
				  <span class="slider round"></span>
				</label>
			
			</div>		

		</div>
		
		
		<!-- 물품 list wrapper-->
		<div class="item-list-wrapper">
			
			<!-- 물품 list 첫번째 줄 -->
			<div class="item-list-line">
			
				<div class="item">
					<div class="item-image"></div>
					<div class="item-title-wrapper">
						<span id="title">상품 제목</span> <span>(예약된 인원수)</span>
					</div>
					<div class="item-price">가격 : 150000원</div>
					<div class="item-stock">남은수량 : 15개</div>
				</div>
				
				<div class="item">
					<div class="item-image"></div>
					<div class="item-title-wrapper">
						<span id="title">상품 제목</span> <span>(예약된 인원수)</span>
					</div>
					<div class="item-price">가격 : 150000원</div>
					<div class="item-stock">남은수량 : 15개</div>
				</div>
				
				<div class="item">
					<div class="item-image"></div>
					<div class="item-title-wrapper">
						<span id="title">상품 제목</span> <span>(예약된 인원수)</span>
					</div>
					<div class="item-price">가격 : 150000원</div>
					<div class="item-stock">남은수량 : 15개</div>
				</div>
				
			</div>
			
			<!-- 물품 list 두번째 줄 -->
			<div class="item-list-line">
			
				<div class="item">
					<div class="item-image"></div>
					<div class="item-title-wrapper">
						<span id="title">상품 제목</span> <span>(예약된 인원수)</span>
					</div>
					<div class="item-price">가격 : 150000원</div>
					<div class="item-stock">남은수량 : 15개</div>
				</div>
				
				<div class="item">
					<div class="item-image"></div>
					<div class="item-title-wrapper">
						<span id="title">상품 제목</span> <span>(예약된 인원수)</span>
					</div>
					<div class="item-price">가격 : 150000원</div>
					<div class="item-stock">남은수량 : 15개</div>
				</div>
				
				<div class="item">
					<div class="item-image"></div>
					<div class="item-title-wrapper">
						<span id="title">상품 제목</span> <span>(예약된 인원수)</span>
					</div>
					<div class="item-price">가격 : 150000원</div>
					<div class="item-stock">남은수량 : 15개</div>
				</div>
				
			</div>
			
			<!-- 물품 list 세번째 줄 -->
			<div class="item-list-line">
			
				<div class="item">
					<div class="item-image"></div>
					<div class="item-title-wrapper">
						<span id="title">상품 제목</span> <span>(예약된 인원수)</span>
					</div>
					<div class="item-price">가격 : 150000원</div>
					<div class="item-stock">남은수량 : 15개</div>
				</div>
				
				<div class="item">
					<div class="item-image"></div>
					<div class="item-title-wrapper">
						<span id="title">상품 제목</span> <span>(예약된 인원수)</span>
					</div>
					<div class="item-price">가격 : 150000원</div>
					<div class="item-stock">남은수량 : 15개</div>
				</div>
				
				<div class="item">
					<div class="item-image"></div>
					<div class="item-title-wrapper">
						<span id="title">상품 제목</span> <span>(예약된 인원수)</span>
					</div>
					<div class="item-price">가격 : 150000원</div>
					<div class="item-stock">남은수량 : 15개</div>
				</div>
				
			</div>
			
		</div>
		
		<!-- 물품 list 끝 -->
		
		
		
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
		
		
	
	</div>
	<!-- 섹션 끝 -->
	
	
	<!-- 후터 -->
	<div class="hooter">
	</div>




<%@ include file="/WEB-INF/views/include/chat/chat.jsp" %>
</body>
<script type="text/javascript" src="../../../resources/js/chat/chat.js"></script>
</html>