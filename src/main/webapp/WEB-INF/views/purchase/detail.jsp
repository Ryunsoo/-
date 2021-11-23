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
						<span><i class="fas fa-map-marker-alt"></i></span>
					</div>
					
					<div>
						거래 시간 : ${purchaseInfo.dealTime}
					</div>
					
					<div id="remaining-time">
						신청 마감일 : ${purchaseInfo.endTime}
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
		<div id="line-bottom-wrapper">
			<hr id="seprate-line">
		</div>
		
		
		
		<!-- 현재신청개수, 신청해협버튼, 문의해협 버튼 -->
		<div class="submit-and-ask-button">
			
			
			<!-- 재고/신청 현황 -->
			<div class="stock-status">
				<ul id="stock-list">
					<li>현재 남은 개수 : ${purchaseInfo.restNum}개</li>
				</ul>
				
				<div id="status-bar-outer">
					<div id="status-bar-inner">
					</div>
				</div>
			</div>
			
			<div class="submit-ask">
				<div>
					<a style="color: white; font-weight: bold;" onclick="location.href = '/purchase/request?regIdx=${purchaseInfo.regIdx}'">신청해협</a>
				</div>
				<div>
					<p id="chat">문의해협</p>
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
</script>
</body>
</html>