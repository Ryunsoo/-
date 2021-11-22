<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head/main-head.jsp" %>
<%@ include file="/WEB-INF/views/include/head/menu-head.jsp" %>
<link href="../../../resources/css/include/head/menu_head.css" type="text/css" rel="stylesheet">
<link rel='stylesheet' href="../../../resources/css/purchase/purchase-main.css">
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
					<option value="silver">실버</option>
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
				<c:forEach items="${registerMap}" var="rm">
					<div class="item">
						<div class="item-image"><img style="width: 100%; height: 100%;" src="${rm.regInfo.link}"></div>
						<div class="item-title-wrapper">
							<span id="title">${rm.regInfo.itemName}</span> <span>(${rm.count}명)</span>
						</div>
						<div class="item-price">가격 : ${rm.regInfo.price}</div>
						<div class="item-stock">남은수량 : ${rm.regInfo.restNum}개</div>
					</div>
				</c:forEach>
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
</body>
</html>