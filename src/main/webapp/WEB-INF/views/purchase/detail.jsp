<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head/menu-head.jsp" %>
<link href="../../../resources/css/include/head/menu_head.css" type="text/css" rel="stylesheet">
<link rel='stylesheet' href="../../../resources/css/purchase/purchase-detail.css">
<link rel='stylesheet' href="../../../resources/css/include/chat/chat.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
</head>


<body>
<div id='modal'></div>
<%@ include file="/WEB-INF/views/include/chat/chat.jsp" %>
<div id="map" onclick="noneDisplay()"></div>
	<!-- 페이지 제목 -->
		<div class="title">
			<div id="this-page-name"></div>
		</div>


	<!-- 섹션 시작 -->
	<div class="section">
		
		
		
		<div class="product-detail-wrapper">
			
			<!-- 이미지 -->
			<div class="product-detail-image">
				<div id="uploaded-image">
					<img id="product-image" src="/file/${purchaseInfo.savePath}${purchaseInfo.reName}">
				</div>
			</div>
			
			
			
			<!-- 제품정보 -->
			<div class="product-info">
				<!-- 제품명 -->
				<div class="product-name">
					${purchaseInfo.itemName}
				</div>
				<br>
				
				<!-- 제품링크 -->
				<div class="product-link">
					<div class="orange-color-subtitle">제품 링크</div>
					<a href="${purchaseInfo.itemLink}">
					${purchaseInfo.itemLink}
					</a>
				</div>
				<br>
				
				<!-- 거래 위치 및 시간 -->
				<div class="location-and-time">
					<div class="orange-color-subtitle">거래 위치 및 시간</div>
					<div>
						${purchaseInfo.dealLoc}
						<span><i class="fas fa-map-marker-alt" onclick="viewMap('${purchaseInfo.dealLoc}')"></i></span>
					</div>
					
					<div>
						거래 시간 : ${purchaseInfo.dealTime}
					</div>
					
					<div id="remaining-time">
						* 신청 마감일 : ${purchaseInfo.endTime}
					</div>
				</div>
				<br>
				
				<!-- 제품 금액 -->
				<div class="product-price">
					<div class="orange-color-subtitle">
						제품 금액 (1개 당)
					</div>
					
					<div>
						${purchaseInfo.price}원
					</div>
				</div>
				<br>
				
				<!-- 어필 -->
				<div class="product-appeal">
					<div class="orange-color-subtitle">
						어필
					</div>
					
					<div>
						${purchaseInfo.content}
					</div>
				</div>
				
				
			</div>
			
			
			
		</div>
		
		
		<!-- 구분선 -->
			<div id="seprate-line"></div>
		
		
		
		<!-- 현재신청개수, 신청해협버튼, 문의해협 버튼 -->
		<div class="submit-and-ask-button">
			
			
			<!-- 재고/신청 현황 -->
			<div class="stock-status">
				<ul id="stock-list">
					<li>현재 신청개수 : ${buyNum}개</li>
					<li>남은 개수 : ${purchaseInfo.restNum}개</li>
				</ul>
				
				<progress style="height:50px;width:300px;" value="${buyNum}" max="${purchaseInfo.totalNum}"></progress>
				
			</div>
			
			<div class="submit-ask-wrapper">
			<c:choose>
				<c:when test="${purchaseInfo.ongoing eq 0}">
					<div class="submit-ask" onclick="location.href = '/purchase/buyer-cancel?regIdx=${purchaseInfo.regIdx}'">
						취소해협
					</div>
				</c:when>
				<c:when test="${purchaseInfo.ongoing eq 1}">
					<c:if test="${empty dealTime}">
						<div class="submit-ask" style="background-color: lightgray; cursor: default;">
							거래중
						</div>
					</c:if>
					<c:if test="${not empty dealTime}">
						<div class="submit-ask" onclick="location.href = '/purchase/deal-done?regIdx=${purchaseInfo.regIdx}'">
							거래완료
						</div>
					</c:if>
				</c:when>
				<c:when test="${purchaseInfo.ongoing eq 2}">
					<div class="submit-ask" style="background-color: lightgray; cursor: default;">
						거래완료
					</div>
				</c:when>
				<c:when test="${purchaseInfo.ongoing eq 3}">
					<div class="submit-ask" style="background-color: lightgray; cursor: default;">
						거래취소
					</div>
				</c:when>
				<c:otherwise>
					<div class="submit-ask" onclick="location.href = '/purchase/request?regIdx=${purchaseInfo.regIdx}'">
						신청해협
					</div>
				</c:otherwise>
			</c:choose>
				<div class="submit-ask" id="chat">
					문의해협
				</div>
			</div>
			<textarea style="display: none;" id="sellerId" name=sellerId>${purchaseInfo.sellerId}</textarea>
			
		</div>
		
		
		
		
		
	
	
	
	</div>
	<!-- 섹션 끝 -->
	
	
	<!-- 후터 -->
	<div class="hooter">
	</div>








<script type="text/javascript" src="../../../resources/js/include/chat/chat.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e5cd0153e48da9da48f6b22ac3f45bfd&libraries=services"></script>
<script type="text/javascript">
document.querySelector("#chat").addEventListener("click", () => {
	
	 fetch('/chat/create-chatRoom?friendId=' + sellerId)
	  .then(res=> res.text())
		.then(text=> {
			if(text) {
				
					let modal = initModal('modal', 3);
					appendTitle(modal, '');
					setButton(modal, '닫기');
					setContent(modal, true, true);
					modalBlock();
					
					let modalBody = $('<div class="alertMessage">채팅방이 생성 되었습니다.</div><br>')
					.addClass('send_modal_content');
					
					$('.modal_content').append(modalBody);
					
					$('.modal_left_btn').click(function() {
						modalNone();
					})
				}
			})
		})
		
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
	
	if (mapContainer.style.display == 'none'){
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
		
	} else {
		mapContainer.style.display = 'none';
	}
	
}

function noneDisplay(){
	document.getElementById('map').style.display = 'none';
}

</script>
</body>
</html>