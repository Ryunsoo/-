<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head/main-head.jsp" %>
<link rel='stylesheet' href="../../../resources/css/member/cojoin-form-next.css">
</head>
<body>
<div class="wrap">
	<div class="topBar">
		<div class="leftBox">
			<div class="MainLogoHelp"></div>
			<div class="login-page-left"></div>
		</div>

		<div class="rightBox">
			<div class="loginTitle">
				<div class="loginTopBlank"></div>
					<div>
						<form:form modelAttribute="joinForm" action="/member/cojoin-form-last" method="post" class="form-signin">
							<div class='progress_wrapper'>
                                <div class='progress_bar'>
                                    <div class='progress'></div>
                                </div>
                            </div>
							<label style="float: right; margin-right: 40px; margin-top: 5px;">66%</label><br>
						<div class="hr-sect">전문 &nbsp해협</div><br>
						
						<div class="idMargin">
							<label>* 이메일</label><br> 								
								<input type="text" class="form-control_all" name="email" placeholder="이메일을 입력하세요." 
									required="" autofocus="" /><br><br>
						</div>
						
						<div class="idMargin">
							<label>* 업체명</label><br> 
								<input type="text" class="form-control_id" name="nickname" 
								placeholder="업체명을 작성해주세요" required="" autofocus="" />
								
								
						</div>
						
						<div class="adressMargin">
							<label>* 주소</label><br> 
								<input type="text" class="form-control_adress" id="form-address" name="address" 
								placeholder="기본 주소를 입력해주세요." readonly required/>
								
								<input type="text" class="form-control_adress_check" id="form-addressNo" name="addressNo" 
								placeholder="우편번호	" readonly required/>
								
								<div class="check">
									<button type="button" class="button_adress_check" onclick="searchAddr()">주소 찾기</button>
								</div>
								
								<input type="text" class="form-control_detail_adress" id="form-oldAddress" name="oldAddress" 
								placeholder="상세 주소를 입력해주세요." readonly required/>
						</div>
						
						<div>
							<!-- <button class="custom-btn btn-1">J O I N &nbsp U S</button> -->
						</div>
						
						
						<div class="before_left">
							<button class="button_next" onclick="backspace()">< 이전</button>
						</div>
						
						<div class="next_right">
							<button class="button_next" type="submit" >다음 ></button>
						</div>
						
				</form:form>
			</div>
		</div>
	</div>
</div>
</div>
</body>
<script type="text/javascript" src="${contextPath}/resources/js/member/joinForm.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

function backspace(){
	history.back();
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
            
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('form-addressNo').value = data.zonecode;
            document.getElementById("form-address").value = roadAddr;
            document.getElementById("form-oldAddress").value = jibunAddr;
            
            
            
            

        }
           
    }).open();
	
}

</script>
</html>