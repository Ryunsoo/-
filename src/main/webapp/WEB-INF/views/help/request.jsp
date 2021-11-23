<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="../../../resources/css/include/head/menu_head.css" type="text/css" rel="stylesheet">
<link href="../../../resources/css/help/request.css" type="text/css" rel="stylesheet">
<link rel='stylesheet' href="../../../resources/css/include/chat/chat.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<style type="text/css">
#valid-msg {
	color: red;
   	font-size: 15px;
}
</style>
</head>
<body>
<div class="wrap">
<%@ include file="/WEB-INF/views/include/head/menu-head.jsp" %>
		<div class="banner">
			<img src="../../../resources/image/${field}.PNG">
			<div class="banner_title">
				<p class="banner_name">${field}</p>
			</div>
		</div>

		<div class="title">해협 신청서</div>
		<form:form modelAttribute="requestForm" id="frm" action="${contextPath}/help/uploadRequest" method="post" enctype="multipart/form-data">
		<div class="left_page">
			<div class='content_left'>
				<div class='file_img'>
					<div class='file'></div>
				</div>
				<div class='upload'>
					<label class='upload_icon' for="input-file"><img src='../../../resources/image/upload-folder.png'><!-- <i class="fas fa-folder-plus"></i> --></label>
					<label class='upload_label' for="input-file">견적서 업로드</label>
				</div>
					<input type="file" name="files" id='input-file' accept="image/*,.pdf" onchange='setPreview(event);' style="visibility: hidden;" multiple>
			</div>
			<div class="info">
				<img alt="info" src="../../../resources/image/heyeop_info.png">
			</div>
		</div>
		<div class="right_page">
			<div class="text-area">
				<div class="text-title">*성  함</div>
				<div class="text-input">
					<input type="text" name="reqName" required placeholder="이름을 입력해주세요.">
				</div>
			</div>
			<div class="text-area">
				<div class="text-title">*연락처</div>
				<div class="text-input">
					<input type="text" name="reqTell" required placeholder="연락처를 입력해주세요.">
				</div>
				<form:errors path="reqTell" cssClass="valid-msg" id="valid-msg"/>
			</div>	
			<div class="text-area">
				<div id="address_wrap">
					<div class="text-title">*주소</div>
					<div style="cursor: pointer;" class="button_adress_check" onclick="searchAddr()">주소 찾기</div>
				</div>
				<div class="text-input">
					<input type="text" id="form-address" name="reqAddress" 
					placeholder="도로명주소" readonly required autocomplete="off" />
				</div>
				<div class="text-input">
					<input type="text" id="form-detailAddress" name="detailAddress" 
					placeholder="상세주소" required autocomplete="off"/>
					<input type="hidden" id="form-oldAddress" name="oldAddress" 
					placeholder="지번주소" readonly required autocomplete="off"/>
				</div>
			</div>
			<div class="text-area">
				<div class="text-title">*방문시간</div>
				<div class="text-input">
					<input type="datetime-local" id="dateTimeLocal" required name="reqTime" onchange="setMinValue()">
				</div>
			</div>
			<div class="text-area">
				<div class="text-title">*희망금액</div>
				<div class="text-input">
					<input type="number" name="reqPay" required placeholder="희망금액을 입력해주세요.">
				</div>
				<form:errors path="reqPay" cssClass="valid-msg"/>
			</div>
			<div class="text-area">
				<div class="text-title">*요청사항</div>
				<div class="text-input">
					<textarea style="resize: none;" name="reqContent" placeholder="요청사항을 입력해주세요."></textarea>
				</div>
			</div>
			<input type="hidden" name="field" value="${field}">
			<div class="submit">
				<button id="submit-btn">신청서 제출</button>
			</div>
		</div>
		</form:form >
	</div>
	<%@ include file="/WEB-INF/views/include/chat/chat.jsp" %>
	<script>
        let dateElement = document.getElementById('dateTimeLocal');
        let plus3time = new Date(new Date().getTime() - (new Date().getTimezoneOffset() * 60000 * 4/3));
        let date = plus3time.toISOString().slice(0, -8);
        console.dir("plus3time.toISOString() : "+plus3time.toISOString());
        console.dir("date : " + date);
        dateElement.value = date;
        dateElement.setAttribute("min", date);
        function setMinValue() {
            if(dateElement.value < date) {
                alert('현재 시간보다 이전의 날짜는 설정할 수 없습니다.');
                dateElement.value = date;
            }
        }
        
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
                    document.getElementById("form-address").value = roadAddr;
                    document.getElementById("form-oldAddress").value = newJibunAddr;

                }
                   
            }).open();
        	
        }
        
        $("#submit-btn").on("click", function(e){
            e.preventDefault();
            let frm = $("#frm");
            let photo = $("#input-file").val();

            if(photo == '') {
                alert("사진을 첨부해주세요.");
                return;
            } else {
                frm.submit();
            } 
        })
    </script>
</body>

<script type="text/javascript" src="../../../resources/js/include/chat/chat.js"></script>
<script type="text/javascript" src="../../../resources/js/common/file-upload-viewer.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</html>