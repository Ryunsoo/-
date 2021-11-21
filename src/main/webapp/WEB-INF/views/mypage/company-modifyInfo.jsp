<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="../../../resources/css/mypage/modal.css" type="text/css" rel="stylesheet">
<link href="../../../resources/css/include/head/menu_head.css" type="text/css" rel="stylesheet">
<link rel='stylesheet' href="../../../resources/css/include/chat/chat.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">

function alert(msg){
	let modal = initModal('modal', 3);
	appendTitle(modal, '');
	setButton(modal, '닫기');
	setContent(modal, true, true);
	modalBlock();
	
	let modalBody = $('<div class="alert">'+msg+'</div><br>')
	.addClass('send_modal_content');
	
	$('.modal_content').append(modalBody);
	
	$('.modal_left_btn').click(function() {
		modalNone();
	})
}

</script>
<style type="text/css">
.modal_left_btn {
	margin-right: 10px;
}

.alert {
	text-align: center;
	font-size: 20px;
	font-weight: bold;
}

.main {
	margin-top: 40px;
	position: relative;
}

.form-signin {
	border-radius: 20px;
	height: 100%;
	width: 530px;
	padding: 20px 70px 35px;
	margin: auto;
	background-color: #fff;
	border: thick dashed rgba(0, 0, 0, 0.1);
	display: flex;
	flex-direction: column;
}

.title {
	display: flex;
	color: gray;
	font-size: 20px;
	justify-content: space-around;
}

.title_line {
	background-color: lightgray;
	width: 200px;
	height: 0.5px;
	margin-top: 11px;
}

input {
	height: 35px;
	width: 300px;
	margin-top: 5px;
	border-radius: 7px;
	border-color: lightgray;
}

.input_wrap {
	display: flex;
	flex-direction: column;
	height: 100%;
	justify-content: space-around;
}

button {
	margin-left: 10px;
	width: 70px;
	height: 35px;
	border: none;
	border-radius: 7px;
	background-color: lightgray;
	color: white;
	cursor: pointer;
}

.modify_btn {
	margin: 0 auto;
	margin-top: 10px;
	width: 550px;
	height: 50px;
	background-color: orange;
	font-size: 22px;
	font-weight: bold;
	box-shadow: 5px 5px 5px rgb(254, 227, 205);
}

.modify_btn:hover {
	background-color: rgb(222, 184, 135);
}

button:hover {
	font-weight: bold;
	background-color: orange;
	box-shadow: 5px 5px 5px rgb(254, 227, 205);
}

.pw_validator_bar {
	width: 130px;
	height: 13px;
	display: flex;
	margin: 0 15px 0 15px;
	align-self: center;
	background-color: transparent;
}

.pw_validator_bar>div {
	width: 33.3%;
}

.low {
	height: 100%;
	background-color: red;
	border-radius: 20px 0 0 20px;
}

.middle {
	height: 100%;
	background-color: #FBB117;
}

.high {
	height: 100%;
	background-color: #4CC417;
	border-radius: 0 20px 20px 0;
}

.level {
	display: flex;
	float: left;
}

.pw_validator_wrap {
	display: flex;
}

.valid-msg {
	font-size: 15px;
	margin-left: 8px;
	color: red;
}

.bee2 {
	left: 660px;
	width: 200px;
	top: 110px;
	position: absolute;
}

.height {
	margin-top: 25px;
}

.select_form {
	display: flex;
	flex-direction: column;
	text-align: left;
	width: 480px;
}

.category {
	margin-bottom: 13px;
	margin-left: 19px;
	margin-top: 15px;
	font-size: 14px;
	color: #FF5500;
}

.interior, .security {
	margin-bottom: 13px;
	margin-left: 20px;
	font-size: 14px;
	color: #FF5500;
}

.bathroom_check, .interior_check, .security_check {
	font-size: 15px;
	color: gray;
	margin-left: 40px;
}

.bathroom_check>label, .interior_check>label, .security_check>label {
	margin-right: 10px;
}

.checkBox {
	width: 16px;
	vertical-align: middle;
	margin-bottom: 11px;
}
</style>
</head>
<body>
<div id='modal'></div>
<div class="wrap">
	<%@ include file="/WEB-INF/views/include/head/menu-head.jsp" %>
	
		<div class="main">
			<img class="bee2" src="../../../resources/image/bee2.png">
			<form:form modelAttribute="joinForm" class="form-signin" action="/mypage/co-modify" method="post" enctype="multipart/form-data">
				<div class="title">
					<div class="title_line"></div>
					<div class="myInfo">내 정보</div>
					<div class="title_line"></div>
				</div>
				<div class="input_wrap">
					<div class="height">* 아이디 <br><input value="${authentication.id}" name="id" readonly="readonly" required autocomplete="off" /></div>
					<div class="height">
						<div class="pw_validator_wrap">
							* 비밀번호
							<div class='pw_validator_bar'>
								<div class='low'></div>
								<div class='middle'></div>
								<div class='high'></div>
							</div>
							<div class="level">
								<label id="validator_bar_text" style="font-weight: 1000"></label>
							</div>
							<span style="font-size: 13px; color: red; margin-top: 2px; margin-left: 10px;" id="pwCheck"></span> 
						</div>
						<div>
							<input id="password" class="form-control-pw-top" name="password" type="password" placeholder="&nbsp 비밀번호(영문 + 숫자 + 특수문자 8자 이상)" required/>
							<input id="password_check" class="form-control-pw-btm" type="password" placeholder="&nbsp 비밀번호 확인" required/>
						</div>
					</div>
					<div class="height">* 대표자명 
						<form:errors path="name" cssClass="valid-msg"/>
					<br><input name="name" id="name" class="form-control_all" value="${authentication.name}" placeholder="&nbsp 이름을 입력해주세요." autocomplete="off" required/></div>
					<div class="height">* 전화번호 
						<form:errors path="tell" cssClass="valid-msg"/>
					<br><input name="tell" id="tell" class="form-control_all" value="${authentication.tell}" placeholder="&nbsp 숫자만 입력해주세요." autocomplete="off" required/></div>
					<div class="height">
						* 이메일 
						<form:errors path="email" cssClass="valid-msg"/>
						<span id="emailCheck" style="font-size: 15px; margin-left:8px; color: red;"></span>
						<br>
						<input id="email" name="email" value="${authentication.email}" placeholder="&nbsp 이메일을 입력하세요." required autocomplete="off"/>
						<button type="button" id="btnEmailCheck" class="button_check">중복체크</button>
					</div>
					<div class="height">
						* 업체명  
						<br>
						<input name="company" id="nickname" value="${authentication.company}" placeholder="&nbsp 업체명을 입력하세요." required autocomplete="off"/>
					</div>
					<div class="height">* 사업장 주소 <br>
						<input class="form-control_adress" name="address"  id="form-address" value="${authentication.address}" placeholder="&nbsp 기본 주소를 입력해주세요." required readonly/>
						<input class="form-control_adress_check" name="addressNo"  id="form-addressNo" style="width: 80px;" value="" placeholder="&nbsp 우편번호" required readonly/><button type="button" class="button_adress_check" onclick="searchAddr()">주소찾기</button>
						<input class="form-control_detail_adress" name="oldAddress" id="form-oldAddress" value="${authentication.oldAddress}" placeholder="&nbsp 상세 주소를 입력해주세요." required autocomplete="off"/>
					</div>
					<div class="height">
						* 전문 분야 <br>
					<div class="select_form">
						<c:forEach items="${categoryList}" var="cl">
							<div class="category">
								<label>${cl}</label>
							</div>
							<div class="bathroom_check">
								<c:forEach items="${fieldList}" var="fl">
									<c:if test="${cl eq fl.fieldCategory}">
										<label><input class="checkBox" id="checkBox" type="checkbox" name="fieldName" value="${fl.field}"> ${fl.field}</label>							
										<input class="myCheckBox"  type="checkbox"  value="${myField}" style="display:none;">
									</c:if>
								</c:forEach>
							</div>
						</c:forEach>
					</div>	
					</div>			
					<div class="height">* 사업자 등록증 및 자격증명서 <br>
						<input type="text" class="form-control_id" id="filename" name="username" placeholder="파일을 첨부해주세요" required readonly />
						<button type="button" id="fileCheck" class="button_adress_check" onclick="document.all.file.click()">파일 첨부</button>
						<input type="file" style="display: none" id='file' name='files' accept="image/*,.pdf" multiple/>
					</div>
				</div>
					<div class="height"></div>
					<button class="modify_btn" id="modify_btn" type="submit">수정하기</button>
					<c:if test="${not empty message}">
						<script>alert('${message}')</script>
					</c:if>
				</form:form>
				</div>
				<div style="height: 60px;"></div>
			
		









</div>
<div id="token" style="display:none"></div>
<%@ include file="/WEB-INF/views/include/chat/chat.jsp" %>
<script type="text/javascript" src="../../../resources/js/mypage/modify_info.js"></script>
<script type="text/javascript" src="../../../resources/js/include/chat/chat.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>


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
            document.getElementById('form-addressNo').value = data.zonecode;
            document.getElementById("form-address").value = roadAddr;
            document.getElementById("form-oldAddress").value = newJibunAddr;

        }
           
    }).open();
	
}

	document.getElementById("file").addEventListener("change", e => {
		document.getElementById("filename").value = e.target.files[0].name;
	});
	
	
	let checkBox = document.querySelectorAll(".checkBox");
	let myCheckBox = document.querySelectorAll(".myCheckBox");
	let checkBoxValue = '';
	let myCheckBoxValue = '';
	
	for(let i = 0; i <checkBox.length; i++){
		checkBoxValue = checkBox[i].defaultValue;
		console.dir('checkBox : '+checkBoxValue);
		
		for(let j = 0; j<myCheckBox.length; j++){
			myCheckBoxValue = myCheckBox[j].value.replace('[', '').replace(']','').split(',')[j];
			console.dir('myCheckBox : ' + myCheckBoxValue);
			
			if(checkBoxValue===myCheckBoxValue){
			console.dir('일치');
			checkBox[j].checked=true;
			
		}
		
			
	}
		
		
		
	}
	
</script>
</body>
<!-- 토큰발급 -->
<script src="https://www.gstatic.com/firebasejs/5.5.9/firebase.js"></script>
<script src="../../../resources/js/include/push/getToken.js"></script>
<script src="../../../resources/js/include/push/tokenFetch.js"></script>
<script src="../../../resources/js/include/push/deleteFetch.js"></script>
<script type="text/javascript" src="../../../resources/js/mypage/resultPush.js"></script>
</html>