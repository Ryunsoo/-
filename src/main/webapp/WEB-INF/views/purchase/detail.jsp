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
						<span><i class="fas fa-map-marker-alt"></i></span>
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
					<li>현재 신청개수 : ${purchaseInfo.buyNum}개</li>
					<li>남은 개수 : ${purchaseInfo.restNum}개</li>
				</ul>
				
				<progress style="height:50px;width:300px;" value="${buyNum}" max="${purchaseInfo.totalNum}"></progress>
				
			</div>
			
			<div class="submit-ask-wrapper">
			<c:choose>
				<c:when test="${purchaseInfo.ongoing eq 0}">
					<div class="submit-ask">
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
						<div class="submit-ask">
							거래완료
						</div>
					</c:if>
				</c:when>
				<c:when test="${purchaseInfo.ongoing eq 2}">
					<div class="submit-ask" style="background-color: lightgray; cursor: default;">
						거래완료
					</div>
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