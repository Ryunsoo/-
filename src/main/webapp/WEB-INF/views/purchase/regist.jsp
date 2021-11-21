<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head/menu-head.jsp" %>
<link href="${contextPath}/resources/css/include/head/menu_head.css" type="text/css" rel="stylesheet">
<link rel='stylesheet' href="${contextPath}/resources/css/purchase/purchase-regist.css">
<link rel='stylesheet' href="${contextPath}/resources/css/include/chat/chat.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
		<form:form modelAttribute="registForm" method="post" enctype="multipart/form-data" action="/purchase/register" class="form-wrapper">
			<div class="image-and-appeal-wrapper">
				<div class="uploaded-image">
					<div class='file'></div>
				</div>
				<div class="upload">
					<label class='upload_icon' for="input-file"><img src='../../../resources/image/upload-folder.png'><!-- <i class="fas fa-folder-plus"></i> --></label>
					<label class='upload_label' for="input-file"></label>
				</div>
				<input type="file" name="files" id='input-file' accept="image/*,.pdf" onchange='setPreview(event);' style="visibility: hidden;" multiple>
				<div class="submit-input-title">*어필해협</div>
				<textarea id="appeal-help-content" name="content" placeholder="내용을 입력해주세요 ex)물 3개씩 구매하실 분만 신청해주세요 쌀: 구매개수 1개 = 1kg"></textarea>
			</div>
			
			
			
			<!-- 제품명 ~금액~ 제출까지 -->
			<div class="product-info-submit">
			<br><br>
				<div class="input-content-wrapper">
					<div class="submit-input-title">*제품명</div>
					<input class="text-input" type="text" placeholder="  제품명과 개수를 입력하세요" name="itemName"/>
				</div>
				<br>
				
				<div class="input-content-wrapper">
					<div class="submit-input-title">*제품링크</div>
					<input class="text-input" type="text" placeholder="  제품 링크를 추가해주세요." name="itemLink"/>
				</div>
				<br>
				
				<div class="input-content-wrapper">
					<div class="submit-input-title">*거래위치 <div id="addrBtn" onclick="searchAddr()">주소찾기</div></div>
					<input class="text-input" id="addr" placeholder="버튼을 클릭하세요" name="dealLoc" readonly/>
				</div>
				<br>
				
				
				<div class="half-size-content-wrapper">
					<div class="input-content-wrapper">
						<div class="submit-input-title">*거래시간</div>
						<input class="text-input" type="datetime-local" placeholder="  시간을 입력하세요" name="dealTime"/>
					</div>
					
					<div class="input-content-wrapper">
						<div class="submit-input-title">*마감시간</div>
						<input class="text-input" type="datetime-local" placeholder="  시간을 입력하세요" name="endTime"/>
					</div>
				</div>
				<br>
				
				
				<div class="input-content-wrapper">
					<div class="submit-input-title">*금액</div>
					<input class="text-input" type="number" min="0.00" step="0.01" placeholder="금액을 입력하세요" name="price"/>
				</div>
				<br>
				
				<div class="half-size-content-wrapper">
					<div class="input-content-wrapper">
						<div class="submit-input-title">*총 개수</div>
						<input class="text-input" type="number" min="0" placeholder="  물건의 총 개수를 입력" name="totalNum"/>
					</div>
					
					<div class="input-content-wrapper">
						<div class="submit-input-title">*내가 구매할 개수</div>
						<input class="text-input" type="number" min="0" placeholder="  본인이 구매할 개수를 입력" name="buyNum"/>
					</div>
				</div>
				<br>
				
				
				<button type=submit class="submit-button">
					SUBMIT!
				</button>
				
				
			</div>
		</form:form>

	</div>
	<!-- 섹션 끝 -->
	
	
	<!-- 후터 -->
	<div class="hooter">
	</div>
<%@ include file="/WEB-INF/views/include/chat/chat.jsp" %>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">

function searchAddr(){
	
	new daum.Postcode({
        oncomplete: function(data) {
        	var roadAddr = data.roadAddress; // 도로명 주소 변수
           
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("addr").value = roadAddr;

        }
           
    }).open();
	
}

</script>
<script type="text/javascript" src="${contextPath}/resources/js/include/chat/chat.js"></script>
<script type="text/javascript" src="../../../resources/js/common/file-upload-viewer.js"></script>
</html>