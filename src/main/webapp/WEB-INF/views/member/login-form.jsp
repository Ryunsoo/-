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
</head>
<body>
<div id="modal"></div>
<div class="wrap">
		<div class="topBar">
			<div class="leftBox">
				<div class="MainLogoHelp"></div>
				<div class="login-page-left"></div>
			</div>
			<div class="rightBox">
				<div class="loginTitle">
					<div class="login_body">
						<div class="hr-sect">자취해협 로그인</div>
						<input type="text" class="form-control" name="username"
							placeholder="ID"> <input type="password"
							class="form-control" name="password" placeholder="Password">
						<button class="login_btn">LOGIN</button>
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
						<button class="kakao_btn">카카오로 로그인</button>
						<button class="naver_btn">네이버로 로그인</button>

					</div>

				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">

//아이디 찾기
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
	let findIdNameInputBox = $('<input>').attr('placeholder','이름을 입력하세요');
	ModalBody.append(findIdName);
	findIdName.append(findIdNametext);
	findIdName.append(findIdNameInput);
	findIdNameInput.append(findIdNameInputBox);
	
	
	let findIdTell = $('<div>').addClass('find_modal_body');
	let findIdTelltext = $('<div>전화번호<div>').height('20px').addClass('find_modal_Text');
	let findIdTellInput = $('<div>').height('30px');
	let findIdTellInputBox = $('<input>').attr('placeholder','가입 시 저장한 전화번호를 입력하세요');
	ModalBody.append(findIdTell);
	findIdTell.append(findIdTelltext);
	findIdTell.append(findIdTellInput);
	findIdTellInput.append(findIdTellInputBox);
	
	
	let findIdEmail = $('<div>').addClass('find_modal_body');
	let findIdEmailtext = $('<div>이메일<div>').height('20px').addClass('find_modal_Text');
	let findIdEmailInput = $('<div>').height('30px');
	let findIdEmailInputBox = $('<input>').attr('placeholder','가입 시 저장한 이메일을 입력하세요');
	ModalBody.append(findIdEmail);
	findIdEmail.append(findIdEmailtext);
	findIdEmail.append(findIdEmailInput);
	findIdEmailInput.append(findIdEmailInputBox); 
	
	modalBlock();
	
	$('.modal_right_btn').click(function() {
		modalNone();
		let modal = initModal('modal', 1);
		appendTitle(modal,'아이디 찾기');
		setButton(modal,'비밀번호 찾기','확인');
		setContent(modal,true,true);
		
		let ModalBody = $('<div>').addClass('findIdIsOk_modal');
		$('.modal_content').append(ModalBody); 
		let findIdIsOk1 = $('<div>입력하신 정보로 등록된 아이디는<div>').addClass('findIdIsOk_text1');
		let findIdIsOk2 = $('<div>babyfox2**<div>').addClass('findIdIsOk_text2');
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
	let findPwNameInputBox = $('<input>').attr('placeholder','이름을 입력하세요');
	ModalBody.append(findPwName);
	findPwName.append(findPwNametext);
	findPwName.append(findPwNameInput);
	findPwNameInput.append(findPwNameInputBox);
	
	
	let findPwId = $('<div>').addClass('find_modal_body');
	let findPwIdtext = $('<div>아이디<div>').height('20px').addClass('find_modal_Text');
	let findPwIdInput = $('<div>').height('30px');
	let findPwIdInputBox = $('<input>').attr('placeholder','아이디를 입력하세요');
	ModalBody.append(findPwId);
	findPwId.append(findPwIdtext);
	findPwId.append(findPwIdInput);
	findPwIdInput.append(findPwIdInputBox);
	
	
	let findPwEmail = $('<div>').addClass('find_modal_body');
	let findPwEmailtext = $('<div>이메일<div>').height('20px').addClass('find_modal_Text');
	let findPwEmailInput = $('<div>').height('30px');
	let findPwEmailInputBox = $('<input>').attr('placeholder','가입 시 저장한 이메일을 입력하세요');
	ModalBody.append(findPwEmail);
	findPwEmail.append(findPwEmailtext);
	findPwEmail.append(findPwEmailInput);
	findPwEmailInput.append(findPwEmailInputBox); 
	
	modalBlock();
	
	$('.modal_right_btn').click(function() {
		modalNone();
		let modal = initModal('modal', 1);
		appendTitle(modal,'비밀번호 찾기');
		setButton(modal,'닫기','이메일 확인하기');
		setContent(modal,true,true);
		
		let ModalBody = $('<div>').addClass('findIdIsOk_modal');
		$('.modal_content').append(ModalBody); 
		let findIdIsOk1 = $('<div>입력하신<div>').addClass('findIdIsOk_text1');
		let findIdIsOk2 = $('<div>babyfox225@naver.com<div>').addClass('findIdIsOk_text2');
		let findIdIsOk3 = $('<div>&nbsp로 인증 메일이 발송되었습니다.<div>').addClass('findIdIsOk_text1');
		ModalBody.append(findIdIsOk1);
		ModalBody.append(findIdIsOk2);
		ModalBody.append(findIdIsOk3);
		modalBlock();
		
		$('.modal_right_btn').click(function(){
			window.open("https://www.naver.com");
			modalNone();
			let modal = initModal('modal', 1);
			appendTitle(modal,'비밀번호 변경');
			setButton(modal,'비밀번호 변경');
			setContent(modal,true,true);

			let ModalBody = $('<div>');
			$('.modal_content').append(ModalBody); 
			
			let changePwName = $('<div>').addClass('change_modal_body');
			let changePwNametext = $('<div>변경할 비밀번호<div>').addClass('change_modal_Text');
			let changePwNameInput = $('<div>').height('30px');
			let changePwNameInputBox = $('<input>').attr('placeholder','새로운 비밀번호를 입력하세요');
			ModalBody.append(changePwName);
			changePwName.append(changePwNametext);
			changePwName.append(changePwNameInput);
			changePwNameInput.append(changePwNameInputBox);
			
			let changePwName2 = $('<div>').addClass('change_modal_body');
			let changePwNametext2 = $('<div>비밀번호 확인<div>').addClass('change_modal_Text');
			let changePwNameInput2 = $('<div>').height('30px');
			let changePwNameInputBox2 = $('<input>').attr('placeholder','비밀번호를 한번 더 입력하세요');
			ModalBody.append(changePwName2);
			changePwName2.append(changePwNametext2);
			changePwName2.append(changePwNameInput2);
			changePwNameInput2.append(changePwNameInputBox2);
			
			modalBlock();
			
			$('.modal_left_btn').click(function(){
				modalNone();
				alert('비밀번호가 변경되었습니다.');
			})
			
		})
		
		$('.modal_left_btn').click(function(){
			modalNone();
		})
		
	})
	
	$('.modal_left_btn').click(function() {
		modalNone();
	})
}



</script>
</body>
</html>