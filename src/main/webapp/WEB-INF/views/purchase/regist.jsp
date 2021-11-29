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
					<input style="display:none;" id="oldAddr" name="oldAddr"/>
				</div>
				<br>
				
				
				<div class="half-size-content-wrapper">
					<div class="input-content-wrapper">
						<div class="submit-input-title">*거래시간</div>

						<input class="text-input" id="startTime" type="datetime-local" placeholder="  시간을 입력하세요" name="dealTime"/>

					</div>
					
					<div class="input-content-wrapper">
						<div class="submit-input-title">*마감시간</div>
						<input class="text-input" id="endTime" type="datetime-local" placeholder="  시간을 입력하세요" name="endTime"/>
					</div>
				</div>
				<br>
				
				
				<div class="input-content-wrapper">
					<div class="submit-input-title">*금액</div>
					<input class="text-input" type="number" min="0.00" placeholder="금액을 입력하세요" name="price"/>
				</div>
				<br>
				
				<div class="half-size-content-wrapper">
					<div class="input-content-wrapper">
						<div class="submit-input-title">*총 개수</div>
						<input class="text-input" id="totalItem" type="number" placeholder="  물건의 총 개수를 입력" name="totalNum"/>
					</div>
					
					<div class="input-content-wrapper">
						<div class="submit-input-title">*내가 구매할 개수</div>
						<input class="text-input" id="myItem" type="number" min="0" placeholder="  본인이 구매할 개수를 입력" name="buyNum"/>
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
	<c:if test="${not empty message}">
		<script>alert("${message}")</script>
	</c:if>
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
            var jibunAddr = data.jibunAddress; // 참고 항목 변수
			
            if (jibunAddr == ""){
            	alert("(구)주소를 다시 선택해주세요");
            	return;
            }
            
			let newJibunAddr;
            
            //시도가 세종특별자치시 이거나 제주특별자치도일 경우 '세종', '제주' 로 바꿔준다.
            if(data.sido == '세종특별자치시') {
            	newJibunAddr = jibunAddr.replace('세종특별자치시', '세종');
            }else if(data.sido == '제주특별자치도') {
            	newJibunAddr = jibunAddr.replace('제주특별자치도', '제주');
            }else {
            	newJibunAddr = jibunAddr;
            }  

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("addr").value = roadAddr;
            document.getElementById("oldAddr").value = newJibunAddr;

        }
           
    }).open();
	
}

let today = new Date(new Date().getTime() - new Date().getTimezoneOffset() * 60000).toISOString().slice(0, -8);
document.getElementById("startTime").setAttribute("min", today);
document.getElementById("endTime").setAttribute("min", today);
		
document.getElementById("startTime").addEventListener("input", e => {
	
	document.getElementById("endTime").setAttribute("max", e.target.value);
	
	if(e.target.value < today){
		alert("현재 시간보다 이전의 날짜는 설정할 수 없습니다.");
		e.target.value = today;
	}

})

document.getElementById("endTime").addEventListener("input", e => {
	
	let dealDate = document.getElementById("startTime").value;
	let parseDate = new Date(dealDate);
	parseDate.setHours(parseDate.getHours() - 1);
	let limitDate = new Date(parseDate.getTime() - parseDate.getTimezoneOffset() * 60000).toISOString().slice(0, -8);
	
	if(e.target.value < today){
		alert("현재 시간보다 이전의 날짜는 설정할 수 없습니다.");
		e.target.value = today;
	}
	
	if(e.target.value >= limitDate){
		alert("마감은 거래시간 한시간 전까지 가능합니다.");
		e.target.value = limitDate;
	}
	
})

document.getElementById("myItem").addEventListener("input", e => {
	
	let totalItem = document.getElementById("totalItem").value;
	console.dir(e.target.value);
	
	if (Number(e.target.value) >= Number(totalItem)) {
		alert("총 개수보다 낮게 입력해주세요.");
		e.target.value = 0;
	}
	
})

document.addEventListener('keydown', function(event) {
  if (event.keyCode === 13) {
    event.preventDefault();
  };
}, true);

</script>
<script type="text/javascript" src="${contextPath}/resources/js/include/chat/chat.js"></script>
<script type="text/javascript" src="../../../resources/js/common/file-upload-viewer.js"></script>
</html>