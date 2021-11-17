<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="../../../resources/css/mypage/modal.css" type="text/css" rel="stylesheet">
<link href="../../../resources/css/include/head/menu_head.css" type="text/css" rel="stylesheet">
<link rel='stylesheet' href="../../../resources/css/include/chat/chat.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

.main{
	margin-top: 40px;
	
}
.form-signin {
	box-shadow: 5px 5px 5px rgb(254, 227, 205);
	border-radius: 20px;
	height: 830px;
	width: 530px;
	padding: 20px 70px 35px;
	margin:auto;
	background-color: #fff;
	border: thin dashed rgba(0, 0, 0, 0.1);
	display: flex;
	flex-direction: column;
}
.title{
	display: flex;
	color: gray;
	font-size: 20px;
	justify-content: space-around;
	
}
.title_line{
	background-color: lightgray;
	width: 200px;
	height: 0.5px;
	margin-top: 11px;
}

input{
	height: 35px;
	width: 300px;
	margin-top: 5px;
	border-radius: 7px;
	border-color: lightgray;
}

.input_wrap{
	display:flex;
	flex-direction:column;
	height: 100%;
	justify-content: space-around;
}

button{
	margin-left: 30px;
	width: 70px;
	height: 35px;
	border: none;
	border-radius: 7px;
	background-color: lightgray;
	color: white;
	cursor: pointer;
}

.modify_btn{
	margin: 0 auto;
	margin-top: 10px;
	width: 550px;
	height: 50px;
	background-color: orange;
	font-size: 22px;
	font-weight: bold;
	box-shadow: 5px 5px 5px rgb(254, 227, 205);
}
.modify_btn:hover{
	background-color: rgb(222, 184, 135);
}

button:hover{
	font-weight: bold;
	background-color: orange;
	box-shadow: 5px 5px 5px rgb(254, 227, 205);

}

.pw_validator_bar{
	width: 130px;
	height: 13px;
	display: flex;
	margin: 0 15px 0 15px;
	align-self: center;
	background-color: transparent;
}

.pw_validator_bar>div{
	width: 33.3%;
}

.low{
	height: 100%;
	background-color: red;
	border-radius: 20px 0 0 20px;
}

.middle{
	height: 100%;
	background-color: #FBB117;
}

.high{
	height: 100%;
	background-color: #4CC417;
	border-radius: 0 20px 20px 0;
}

.level{
	display: flex;
	float: left;
}

.pw_validator_wrap{
	display: flex;
}
</style>
</head>
<body>
<div id='modal'></div>
<div class="wrap">
	<%@ include file="/WEB-INF/views/include/head/menu-head.jsp" %>
	

		<div class="main">
			<form class="form-signin">
				<div class="title">
					<div class="title_line"></div>
					<div class="myInfo">내 정보</div>
					<div class="title_line"></div>
				</div>
				<div class="input_wrap">
					<div>* 아이디 <br><input value="test" readonly="readonly" required autocomplete="off" /></div>
						<div>
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
								<input id="password" class="form-control-pw-top" name="password" type="password"  value="" placeholder="&nbsp 비밀번호(영문 + 숫자 + 특수문자 8자 이상)" required/>
								<input id="password_check" class="form-control-pw-btm" type="password" value="" placeholder="&nbsp 비밀번호 확인" required/>
							</div>
						</div>
					<div>* 이름 <br><input id="name" class="form-control_all" value="" placeholder="&nbsp 이름을 입력해주세요."/></div>
					<div>* 전화번호 <br><input id="tell" class="form-control_all" value="" placeholder="&nbsp 숫자만 입력해주세요." /></div>
					<div>* 이메일 <br><input id="email" value="" placeholder="&nbsp 이메일을 입력하세요."/><button type="button">중복체크</button></div>
					<div>* 닉네임 <br><input id="nickName" value="" placeholder="&nbsp 닉네임을 입력하세요."/><button type="button">중복체크</button></div>
					<div>* 주소찾기 <br>
						<input class="form-control_adress" id="form-address"  value="" placeholder="&nbsp 기본 주소를 입력해주세요."/>
						<input class="form-control_adress_check" id="form-addressNo" style="width: 80px;" value="" placeholder="&nbsp 우편번호"/><button type="button" class="button_adress_check" onclick="searchAddr()">주소찾기</button>
						<input class="form-control_detail_adress" id="form-oldAddress" value="" placeholder="&nbsp 상세 주소를 입력해주세요."/>
					</div>
				</div>
					<button class="modify_btn" type="submit">수정하기</button>
				</div>
				
			
			</form>
		</div>









</div>
<div id="token" style="display:none"></div>
<%@ include file="/WEB-INF/views/include/chat/chat.jsp" %>
<script type="text/javascript" src="../../../resources/js/mypage/modify_info.js"></script>
<script type="text/javascript" src="../../../resources/js/include/chat/chat.js"></script>
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

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('form-addressNo').value = data.zonecode;
            document.getElementById("form-address").value = roadAddr;
            document.getElementById("form-oldAddress").value = jibunAddr;
        }
           
    }).open();
	
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