<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head/menu-head.jsp" %>
<link href="../../../resources/css/include/head/menu_head.css" type="text/css" rel="stylesheet">
<link rel='stylesheet' href="../../../resources/css/purchase/purchase-detail-writer.css">
<link rel='stylesheet' href="../../../resources/css/include/chat/chat.css">
<meta charset="UTF-8">
</head>


<body>
<%@ include file="/WEB-INF/views/include/chat/chat.jsp" %>
	<div id="map"></div>
	<!-- 섹션 시작 -->
	<div class="section">
		
		<!-- 페이지 제목 -->
		<div class="title">
			<div class="page-title-wrapper">
				<div id="this-page-name">&nbsp&nbsp조회해협</div>
				<div id="update-delete-icon">
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
					<img id="product-image" src = "${detailInfo.link}">
				</div>
			</div>
			
			
			
			<!-- 제품정보 -->
			<div class="product-info">
				<!-- 제품명 -->
				<div class="product-name">
					${detailInfo.itemName}
				</div>
				<br>
				
				<!-- 제품링크 -->
				<div class="product-link">
					<div class="orange-color-subtitle">제품 링크</div>
					<a href="http://${detailInfo.itemLink}">
						${detailInfo.itemLink}
					</a>
				</div>
				<br>
				
				<!-- 거래 위치 및 시간 -->
				<div class="location-and-time">
					<div class="orange-color-subtitle">거래 위치 및 시간</div>
					<div>
						거래 위치 : ${detailInfo.dealLoc} 
						<span><i style="margin-left:5px;" class="fas fa-map-marker-alt" onclick="viewMap('${detailInfo.dealLoc}')"></i></span>
					</div>
					
					<div>
						거래 시간 : ${detailInfo.dealTime}
					</div>
					
					<div id="remaining-time">
						* 신청 마감시간 : ${detailInfo.endTime}
					</div>
				</div>
				<br>
				
				<!-- 제품 금액 -->
				<div class="product-price">
					<div class="orange-color-subtitle">
						제품 금액
					</div>
					
					<div>
						${detailInfo.price}원
					</div>
				</div>
				<br>
				
				<!-- 어필 -->
				<div class="product-appeal">
					<div class="orange-color-subtitle">
						어필
					</div>
					
					<div>
						${detailInfo.content}
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
					<li>현재 신청개수 : ${buyNum}개</li>
					<li>남은 개수 : ${detailInfo.restNum}개</li>
				</ul>
				
				<progress style="height:50px; width:300px;" value="${buyNum}" max="${detailInfo.totalNum}"></progress>
			</div>
			

			<div class="submit-ask" onclick="location.href = '/purchase/purchase-commit?id=${detailInfo.id}&regIdx=${detailInfo.regIdx}'">
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
	
	
<script type="text/javascript" src="../../../resources/js/include/chat/chat.js"></script>
</body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e5cd0153e48da9da48f6b22ac3f45bfd&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = {
    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};  

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

function viewMap(loc){
	//주소로 좌표를 검색합니다
	geocoder.addressSearch(loc, function(result, status) {

	// 정상적으로 검색이 완료됐으면 
	 if (status === kakao.maps.services.Status.OK) {

	    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	    // 결과값으로 받은 위치를 마커로 표시합니다
	    var marker = new kakao.maps.Marker({
	        map: map,
	        position: coords
	    });

	    mapContainer.style.display = 'block';
	    map.relayout();

	    // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	    map.setCenter(coords);
	    marker.setPosition(coords);
	} 
	}); 	
}

</script>
</html>