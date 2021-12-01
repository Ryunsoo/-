<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head/main-head.jsp" %>
<link rel='stylesheet' href="../../../resources/css/member/social-join-form.css">

<style type="text/css">

.valid-msg {
	font-size: 13px;
	color: red;
	margin-left: 10px;
}

input:focus {
	outline: none;
}
</style>

</head>



<body>
<div class="wrap">
	<div class="topBar">
		<div class="leftBox">
			<div class="MainLogoHelp" style="cursor: pointer;" onclick="location.href='/'"></div>
			<div class="login-page-left"></div>
		</div>

		<div class="rightBox">
			<div class="loginTitle">
				<div class="loginTopBlank"></div>
					<div>
						<form:form modelAttribute="joinForm"
						class="form-signin" action="/member/social-join" method="post">
							<div class='progress_wrapper'>
								<div class='progress_bar'>
									<div class='progress'></div>
								</div>
							</div>
						<label style="float: right; margin-right: 40px; margin-top: 5px;">100%</label><br>
						<div class="hr-sect">함께 &nbsp해협</div>
						<div class='input_wrapper'>
							
							<div class=nameMargin>
								<label>* 이름</label><br>
									<input type="text" id="name" class="form-control_all" name="name" placeholder="이름을 입력해주세요." required autocomplete="off"/><br><br>
							</div>
							
							<div class=tellMargin>
								<label>* 전화번호<form:errors path="tell" cssClass="valid-msg"/></label><br>
									<input type="text" id="tell" class="form-control_all" name="tell" placeholder="숫자만 입력해주세요." required autocomplete="off"/><br>
							</div>
						</div>
						<div class="idMargin">
							<label>* 이메일<form:errors path="email" cssClass="valid-msg"/></label><br>								
								<input type="text" class="form-control_all" name="email" placeholder="이메일을 입력하세요." 
									<c:if test="${empty error.email}">
										value = "${joinForm.email}"
									</c:if>
									required autofocus autocomplete="off"/><br><br>
						</div>
						
						<div class="idMargin">
							<label>* 닉네임</label> &nbsp&nbsp
							<span style="font-size: 13px; color: red;" id="nickCheck"></span><br> 
								<input type="text" class="form-control_id" name="nickname" 
								id="nickname" placeholder="닉네임을 입력해주세요." 
								<c:if test="${empty error.nickname}">
									value="${joinForm.nickname}"
								</c:if>
								required="" autofocus="" />
								
								<div class="check">
									<button id="btnNickCheck" class="button_check">중복확인</button>
									<c:if test="${empty error.nickname}">
										<span id="nicknameCheck" class="valid-msg" cssClass="valid-msg"></span>
									</c:if>
									<form:errors path="nickname"/>
								</div>
						</div>
						
						<div class="adressMargin">
							<label>* 주소</label><br> 
								<input type="text" class="form-control_adress" id="form-address" name="address" 
								placeholder="도로명주소" required autocomplete="off" />
								
								<input type="text" class="form-control_adress_check" id="form-addressNo" name="addressNo" 
								placeholder="우편번호	" required autocomplete="off" />
								
								<div class="check">
									<button class="button_adress_check" onclick="searchAddr()">주소 찾기</button>
								</div>
								
								<input type="text" class="form-control_detail_adress" id="form-oldAddress" name="oldAddress" 
								placeholder="지번주소" required autocomplete="off"/>
						</div>
						
						<div>
							<button type="submit" class="custom-btn btn-1">J O I N &nbsp U S</button>
						</div>
						
					</form:form>
				</div>
			</div>
		</div>
	</div>
</div>



<script type="text/javascript" src="${contextPath}/resources/js/member/socialJoinForm.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
function backspace(){
	history.back();
}

function searchAddr(){
	
	new daum.Postcode({
        oncomplete: function(data) {
        	var roadAddr = data.roadAddress; // 도로명 주소 변수
            var jibunAddr = data.jibunAddress; // 참고 항목 변수

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('form-addressNo').value = data.zonecode;
            document.getElementById("form-address").value = roadAddr;
            document.getElementById("form-oldAddress").value = jibunAddr;
        }
           
    }).open();
	
}
</script>

</body>


</html>