<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head/menu-head.jsp" %>
<link href="${contextPath}/resources/css/include/head/menu_head.css" type="text/css" rel="stylesheet">
<link rel='stylesheet' href="${contextPath}/resources/css/purchase/purchase-request.css">
<link rel='stylesheet' href="${contextPath}/resources/css/include/chat/chat.css">
<meta charset="UTF-8">

</head>






<body>


	<!-- 섹션 시작 -->
	<div class="section">
		
		<!-- 작성해협 제목 -->
		<div class="title">
			<div id="this-page-name">&nbsp&nbsp신청해협</div>
			
			<!-- 구분선 -->
			<div id="line-wrapper">
				<hr id="seprate-line">
			</div>
			
		</div>
		
		
		
		<!-- 이미지 & 어필해협 -->
		<form class="form-wrapper">
			<div class="image-and-appeal-wrapper">
				<div id="uploaded-image">
					<img id="product-image" src = "../../../resources/image/product-image.png">
				</div>
				<div class="submit-input-title">*어필해협</div>
				<div id="appeal-help-content">
					"내용을 입력해주세요 ex)물 3개씩 구매하실 분만 신청해주세요 쌀: 구매개수 1개 = 1kg"
				</div>
			</div>
			
			
			
			<!-- 제품명 ~금액~ 제출까지 -->
			<div class="product-info-submit">
			<br><br>
				<div class="input-content-wrapper">
					<div class="submit-input-title">*제품명</div>
						<div class="text-output">
							<p>탐사수 (2Lx12개)</p>
						</div>
				</div>
				<br>
				
				<div class="input-content-wrapper">
					<div class="submit-input-title">*거래위치</div>
						<div class="text-output">
							<p>강남 kh정보교육원</p>
						</div>
				</div>
				<br>
				
				<div class="half-size-content-wrapper">
					<div class="input-content-wrapper">
						<div class="submit-input-title">*거래시간</div>
						<div class="text-output">
							<p>12월 7일 오후 3:20</p>
						</div>
					</div>
					
					<div class="input-content-wrapper">
						<div class="submit-input-title">*마감시간</div>
						<div class="text-output">
							<p>12월 7일 오후 3:40</p>
						</div>
					</div>
				</div>
				<br>
				
				
				<div class="input-content-wrapper">
					<div class="submit-input-title">*금액</div>
					<div class="text-output">
							<p>565원</p>
					</div>
				</div>
				<br>
				
				<div class="half-size-content-wrapper">
					<div class="input-content-wrapper">
						<div class="submit-input-title">*남은 개수</div>
						<div class="text-output">
							<p>15개</p>
						</div>
					</div>
					
					<div class="input-content-wrapper">
						<div class="submit-input-title">*내가 구매할 개수</div>
						<input class="text-input" type="text" placeholder="  수량을 입력하세요" name="file"/>
					</div>
				</div>
				<br>
				
				<div class="half-size-content-wrapper">
					<div class="input-content-wrapper">
						<div class="submit-input-title">*내 포인트</div>
						<div class="text-output">
							<p>3,000P</p>
						</div>
					</div>
				</div>
				<br>
				
				
				<button class="submit-button">
					SUBMIT!
				</button>
				
				
			</div>
		</form>
		

		
	
	</div>
	<!-- 섹션 끝 -->
	
	
	<!-- 후터 -->
	<div class="hooter">
	</div>





	<%@ include file="/WEB-INF/views/include/chat/chat.jsp" %>
</body>
<script type="text/javascript" src="${contextPath}/resources/js/include/chat/chat.js"></script>
</html>