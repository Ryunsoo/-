<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head/main-head.jsp" %>
<link href="../../../resources/css/all.css" rel="stylesheet">
<link href="../../../resources/css/reset.css" type="text/css" rel="stylesheet">
<link rel='stylesheet' href="../../../resources/css/member/login-form.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">

// 로그인 실패
function failLogin(msg){
	let modal = initModal('modal', 3);
	appendTitle(modal, '');
	setButton(modal, '닫기');
	setContent(modal, true, true);
	//addPiggyBackround(sendModal);
	modalBlock();
	
	let modalBody = $('<div class="loginFail">'+msg+'</div><br>')
	.addClass('send_modal_content');
	
	$('.modal_content').append(modalBody);
	
	$('.modal_left_btn').click(function() {
		modalNone();
	})
}

</script>
</head>
<body>
<div id="modal"></div>
<form class="wrap" action="/member/login" method="post">
		<div class="topBar">
			<div class="leftBox">
				<div class="MainLogoHelp"></div>
				<div class="login-page-left"></div>
			</div>
			<div class="rightBox">
				<div class="loginTitle">
					<div class="login_body">
						<div class="hr-sect">자취해협 로그인</div>
						<input type="text" class="form-control" name="id"
							placeholder="ID" autocomplete="none"> <input type="password"
							class="form-control" name="password" placeholder="Password">
						<c:if test="${not empty message}">
							<script>failLogin('${message}')</script>
						</c:if>
						<button type="submit" class="login_btn">LOGIN</button>
						<div class="txt_find">
							<div class="sign">
								<a href="/member/join-form">회원가입</a>
							</div>
							<div class="find_body">
								<a onclick="createFindPwModal()">비밀번호 찾기</a>
							</div>
							<div class="find_body">
								<a onclick="createFindIdModal()">아이디 / </a>
							</div>
						</div>
						<div class="hr-sect">간편 로그인</div>
						<button class="kakao_btn" onclick="kakaoLogin()">카카오로 로그인/회원가입</button>
						<button class="naver_btn">네이버로 로그인/회원가입</button>
						<div class="txt_find">
							<div class="sign">
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</form>
	
	
<script type="text/javascript">

let createFindIdModal = () => {
	let modal = initModal('modal', 2);
	appendTitle(modal,'아이디 찾기');
	setButton(modal,'그만두기','아이디 찾기');
	setContent(modal,true,true);
	
 	let ModalBody = $('<div>');
	$('.modal_content').append(ModalBody); 
	
	
	let findIdName = $('<div>').addClass('find_modal_body');
	let findIdNametext = $('<div>이름<div>').height('20px').addClass('find_modal_Text');
	let findIdNameInput = $('<div>').height('30px');
	let findIdNameInputBox = $('<input id="name" name="name">').attr('placeholder','이름을 입력하세요');
	ModalBody.append(findIdName);
	findIdName.append(findIdNametext);
	findIdName.append(findIdNameInput);
	findIdNameInput.append(findIdNameInputBox);
	
	
	let findIdTell = $('<div>').addClass('find_modal_body');
	let findIdTelltext = $('<div>전화번호<div>').height('20px').addClass('find_modal_Text');
	let findIdTellInput = $('<div>').height('30px');
	let findIdTellInputBox = $('<input id="tell" name="tell">').attr('placeholder','가입 시 저장한 전화번호를 입력하세요');
	ModalBody.append(findIdTell);
	findIdTell.append(findIdTelltext);
	findIdTell.append(findIdTellInput);
	findIdTellInput.append(findIdTellInputBox);
	
	
	let findIdEmail = $('<div>').addClass('find_modal_body');
	let findIdEmailtext = $('<div>이메일<div>').height('20px').addClass('find_modal_Text');
	let findIdEmailInput = $('<div>').height('30px');
	let findIdEmailInputBox = $('<input id="email" name="email">').attr('placeholder','가입 시 저장한 이메일을 입력하세요');
	ModalBody.append(findIdEmail);
	findIdEmail.append(findIdEmailtext);
	findIdEmail.append(findIdEmailInput);
	findIdEmailInput.append(findIdEmailInputBox); 
	
	modalBlock();
	
	
	$('.modal_right_btn').click(function() {
		
		let name = document.querySelector("#name").value;
		let tell = document.querySelector("#tell").value;
		let email = document.querySelector("#email").value;
		console.dir(name);
		console.dir(tell);
		console.dir(email);
		
		fetch('/member/finding-id?name='+name+'&tell='+tell+'&email='+email)
		.then(res=> res.text())
		.then(text=> {
			
				if(text) {
					modalNone();
					console.dir(text);
					let testId = '<div>' + text + '<div>';
					
					let modal = initModal('modal', 1);
					appendTitle(modal,'아이디 찾기');
					setButton(modal,'비밀번호 찾기','확인');
					setContent(modal,true,true);
					
					let ModalBody = $('<div>').addClass('findIdIsOk_modal');
					$('.modal_content').append(ModalBody); 
					let findIdIsOk1 = $('<div>입력하신 정보로 등록된 아이디는<div>').addClass('findIdIsOk_text1');
					let findIdIsOk2 = $(testId).addClass('findIdIsOk_text2');
					let findIdIsOk3 = $('<div>&nbsp입니다.<div>').addClass('findIdIsOk_text1');
					ModalBody.append(findIdIsOk1);
					ModalBody.append(findIdIsOk2);
					ModalBody.append(findIdIsOk3);
					modalBlock();
					
					$('.modal_left_btn').click(function(){
						modalNone();
						createFindPwModal();
					})
					
					$('.modal_right_btn').click(function(){
						modalNone();
					})
					
				}else {
					setModalTitle('modal2','이메일로 아이디 찾기');
					setModalBody('modal2','<b style="color:red;">입력하신 정보와 일치하는 회원이 없습니다.</b><br>이름과 이메일 정보를 다시 한번 확인해주세요');
					removeModalFnc("okay");
					modal2();
				}
		
		});
		
		
		
		
	})
	
	$('.modal_left_btn').click(function(){
		modalNone();
	})
	
	
	
}

//비밀번호찾기
let createFindPwModal = () => {
	
	let modal = initModal('modal', 2);
	appendTitle(modal,'비밀번호 찾기');
	setButton(modal,'그만두기','비밀번호 찾기');
	setContent(modal,true,true);
	
 	let ModalBody = $('<div>');
	$('.modal_content').append(ModalBody); 
	
	
	let findPwName = $('<div>').addClass('find_modal_body');
	let findPwNametext = $('<div>이름<div>').height('20px').addClass('find_modal_Text');
	let findPwNameInput = $('<div>').height('30px');
	let findPwNameInputBox = $('<input id="name">').attr('placeholder','이름을 입력하세요');
	ModalBody.append(findPwName);
	findPwName.append(findPwNametext);
	findPwName.append(findPwNameInput);
	findPwNameInput.append(findPwNameInputBox);
	
	
	let findPwId = $('<div>').addClass('find_modal_body');
	let findPwIdtext = $('<div>아이디<div>').height('20px').addClass('find_modal_Text');
	let findPwIdInput = $('<div>').height('30px');
	let findPwIdInputBox = $('<input id="id">').attr('placeholder','아이디를 입력하세요');
	ModalBody.append(findPwId);
	findPwId.append(findPwIdtext);
	findPwId.append(findPwIdInput);
	findPwIdInput.append(findPwIdInputBox);
	
	
	let findPwEmail = $('<div>').addClass('find_modal_body');
	let findPwEmailtext = $('<div>이메일<div>').height('20px').addClass('find_modal_Text');
	let findPwEmailInput = $('<div>').height('30px');
	let findPwEmailInputBox = $('<input id="email">').attr('placeholder','가입 시 저장한 이메일을 입력하세요');
	ModalBody.append(findPwEmail);
	findPwEmail.append(findPwEmailtext);
	findPwEmail.append(findPwEmailInput);
	findPwEmailInput.append(findPwEmailInputBox); 
	
	modalBlock();
	
	$('.modal_right_btn').click(function() {
		
		let name = document.querySelector("#name").value;
		let id = document.querySelector("#id").value;
		let email = document.querySelector("#email").value;
		console.dir(name);
		console.dir(id);
		console.dir(email);
		
		modalNone();
		
		let modal = initModal('modal', 1);
		appendTitle(modal,'비밀번호 찾기');
		setButton(modal,'닫기','이메일 확인하기');
		setContent(modal,true,true);
		
		
		fetch('/member/finding-pw?name='+name+'&id='+id+'&email='+email)
		.then(res=> res.text())
		.then(text=> {
			
				if(text) {
					
					let findingEmail = '<div>' + text + '<div>'
					
					let ModalBody = $('<div>').addClass('findIdIsOk_modal');
					$('.modal_content').append(ModalBody); 
					let findIdIsOk1 = $('<div>입력하신<div>').addClass('findIdIsOk_text1');
					let findIdIsOk2 = $(findingEmail).addClass('findIdIsOk_text2');
					let findIdIsOk3 = $('<div>&nbsp로 인증 메일이 발송되었습니다.<div>').addClass('findIdIsOk_text1');
					ModalBody.append(findIdIsOk1);
					ModalBody.append(findIdIsOk2);
					ModalBody.append(findIdIsOk3);
					modalBlock();
				}else {
					setModalTitle('modal2','이메일로 비밀번호 찾기');
					setModalBody('modal2','<b style="color:red;">입력하신 정보와 일치하는 회원이 없습니다.</b><br>이름과 이메일 정보를 다시 한번 확인해주세요');
					removeModalFnc("okay");
					modal2();
				}
		});
		
		$('.modal_right_btn').click(function(){
			window.open("https://www.naver.com");
			modalNone();
		})
		
		$('.modal_left_btn').click(function(){
			modalNone();
		})
		
	})
	
	$('.modal_left_btn').click(function() {
		modalNone();
	})
}


let link = document.location.href.split("?");

if(link[1] != null) {
	let modal = initModal('modal', 1);
	   appendTitle(modal,'비밀번호 변경');
	   setButton(modal,'비밀번호 변경');
	   setContent(modal,true,true);

	   let ModalBody = $('<div>');
	   $('.modal_content').append(ModalBody); 
	   
	   let changePwName = $('<div>').addClass('change_modal_body');
	   let changePwNametext = $('<div>변경할 비밀번호<div>').addClass('change_modal_Text');
	   let changePwNameInput = $('<div>').height('30px');
	   let changePwNameInputBox = $('<input type="password" id="newPw">').attr('placeholder','새로운 비밀번호를 입력하세요');
	   ModalBody.append(changePwName);
	   changePwName.append(changePwNametext);
	   changePwName.append(changePwNameInput);
	   changePwNameInput.append(changePwNameInputBox);
	   
	   let changePwName2 = $('<div>').addClass('change_modal_body');
	   let changePwNametext2 = $('<div>비밀번호 확인<div>').addClass('change_modal_Text');
	   let changePwNameInput2 = $('<div>').height('30px');
	   let changePwNameInputBox2 = $('<input type="password" id="newPwConfirm">').attr('placeholder','비밀번호를 한번 더 입력하세요');
	   ModalBody.append(changePwName2);
	   changePwName2.append(changePwNametext2);
	   changePwName2.append(changePwNameInput2);
	   changePwNameInput2.append(changePwNameInputBox2);
	   
	   modalBlock();
	   console.dir("오ㅐ");
	   $('.modal_left_btn').click(function(){
	    
	      let newPw = document.querySelector("#newPw").value;
	      let newPwConfirm = document.querySelector("#newPwConfirm").value;
	      console.dir("오ㅐ");
	      console.dir(newPw);
	      console.dir(newPwConfirm);
	      
	        modalNone();
	      
	      if(newPw == newPwConfirm){
	         
	         fetch('/member/update-pw?newPw='+newPw)
	         .then(res=> res.text())
	         .then(text=> {
	            if(text) {
	            	alert('비밀번호 변경이 완료되었습니다.');
	            	location.href='/member/login-form';
	            }else {
	               setModalTitle('modal2','이메일로 비밀번호 찾기');
	               setModalBody('modal2','<b style="color:red;">입력하신 정보와 일치하는 회원이 없습니다.</b><br>이름과 이메일 정보를 다시 한번 확인해주세요');
	               removeModalFnc("okay");
	               modal2();
	            }
	         });
	         
	      }
	      
	      
	   })
}


// SDK를 초기화 합니다. 사용할 앱의 JavaScript 키를 설정해 주세요.
Kakao.init('11e9e48ce1a5512abfa0b01c1dbf2cdd');

// SDK 초기화 여부를 판단합니다.
console.log(Kakao.isInitialized());

function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  let kakaoId = response.id;
        	  fetch('/member/id-check?id='+kakaoId)
        	  .then(response=>response.text())
        	  .then(text => {
        		  if(text=="available"){
        			  location.href="/member/social-join-form?id="+kakaoId;
        			  console.log(text);
        		  }else{
        			  location.href="/member/";
        			  console.log(text);
        		  }
        	  })
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
  
  
  
  
  
  
  
  
  
  
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  


</script>
</body>
</html>