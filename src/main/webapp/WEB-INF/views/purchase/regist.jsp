<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head/menu-head.jsp" %>
<link href="${contextPath}/resources/css/include/head/menu_head.css" type="text/css" rel="stylesheet">
<link rel='stylesheet' href="${contextPath}/resources/css/purchase/purchase-regist.css">
<link rel='stylesheet' href="${contextPath}/resources/css/chat/chat.css">



</head>






<body>


	
	<!-- 섹션 시작 -->
	<div class="section">
		
		<!-- 작성해협 제목 -->
		<div class="title">
			<div id="this-page-name">&nbsp&nbsp작성해협</div>
			
			<!-- 구분선 -->
			<div id="line-wrapper">
				<hr id="seprate-line">
			</div>
			
		</div>
		
		
		
		<!-- 이미지 & 이미지업로드 & 어필해협 -->
		<form class="form-wrapper">
			<div class="image-and-appeal-wrapper">
				<div id="uploaded-image">
					<img id="product-image" src = "../../../resources/image/product-image.png">
				</div>
				<div id="image-upload-section">
					<input type="file" value="파일 선택" name="file"/>
				</div>
				<div class="submit-input-title">*어필해협</div>
				<textarea id="appeal-help-content" placeholder="내용을 입력해주세요 ex)물 3개씩 구매하실 분만 신청해주세요 쌀: 구매개수 1개 = 1kg"></textarea>
			</div>
			
			
			
			<!-- 제품명 ~금액~ 제출까지 -->
			<div class="product-info-submit">
			<br><br>
				<div class="input-content-wrapper">
					<div class="submit-input-title">*제품명</div>
					<input class="text-input" type="text" placeholder="  제품명과 개수를 입력하세요" name="prodname-and-qty"/>
				</div>
				<br>
				
				<div class="input-content-wrapper">
					<div class="submit-input-title">*제품링크</div>
					<input class="text-input" type="text" placeholder="  제품 링크를 추가해주세요." name="file"/>
				</div>
				<br>
				
				<div class="input-content-wrapper">
					<div class="submit-input-title">*거래위치</div>
					<input class="text-input" type="text" placeholder="  다음 API 추가" name="file"/>
				</div>
				<br>
				
				
				<div class="half-size-content-wrapper">
					<div class="input-content-wrapper">
						<div class="submit-input-title">*거래시간</div>
						<input class="text-input" type="text" placeholder="  시간을 입력하세요" name="file"/>
					</div>
					
					<div class="input-content-wrapper">
						<div class="submit-input-title">*마감시간</div>
						<input class="text-input" type="text" placeholder="  시간을 입력하세요" name="file"/>
					</div>
				</div>
				<br>
				
				
				<div class="input-content-wrapper">
					<div class="submit-input-title">*금액</div>
					<input class="text-input" type="text" placeholder="  금액을 입력하세요" name="file"/>
				</div>
				<br>
				
				<div class="half-size-content-wrapper">
					<div class="input-content-wrapper">
						<div class="submit-input-title">*총 개수</div>
						<input class="text-input" type="text" placeholder="  함께 구매할 인원을 입력" name="file"/>
					</div>
					
					<div class="input-content-wrapper">
						<div class="submit-input-title">*내가 구매할 개수</div>
						<input class="text-input" type="text" placeholder="  함께 구매할 인원을 입력" name="file"/>
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
<script type="text/javascript" src="${contextPath}/resources/js/chat/chat.js"></script>
</html>