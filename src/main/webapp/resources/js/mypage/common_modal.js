/* 충전하기 모달 */
let createChargingModal = () => {
	let modal = initModal('modal', 1);
	appendTitle(modal, '충전하기');
	setButton(modal, '그만두기', '충전하기');
	setContent(modal, true, true);
	addPiggyBackground(modal);
	
	let modalBody = $('<div class="charging">현재 보유 캐시<br>25,000 <i class="fas fa-coins"></i><div><div class="chargeMoney">충전할 금액 <input placeholder="&nbsp&nbsp금액을 입력해주세요. (최소 금액 : 천원)"><div>').height('10px')
					.addClass('send_modal_content');
	$('.modal_content').append(modalBody);
	
	
	
	modalBlock();
	
	$('.modal_left_btn').click(function() {
		modalNone();
	})
}


/* 송금하기-인증 전 모달 */
let beforeSendModal = () => {
	let modal = initModal('modal', 1);
	appendTitle(modal, '송금하기');
	setButton(modal, '그만두기', '인증하기');
	setContent(modal, true, true);
	addPiggyBackground(modal);
	
	let modalBody = $('<br><div class="sendBefore">"첫 송금이신가요?<br>계좌 인증을 진행해주세요!"<div>').height('10px')
					.addClass('send_modal_content');
	$('.modal_content').append(modalBody);
	
	
	
	modalBlock();
	
	$('.modal_left_btn').click(function() {
		modalNone();
	})
	
	$('.modal_right_btn').click(function() {
		modalNone();
		
		location.href = "https://testapi.openbanking.or.kr/oauth/2.0/authorize?" +
						"response_type=code&" +
						"client_id=f319e2ed-4cae-4853-a2c4-d17261fc495a&" +
						"redirect_uri=http://localhost:9090/mypage/getAuth&" +
						"scope=login inquiry transfer&" +
						"state=12345678901234567890123456789012&" +
						"auth_type=0";
	})
}

/* 송금하기-인증 후 모달 */
let afterSendModal = () => {
	let modal = initModal('modal', 2);
	appendTitle(modal, '송금하기');
	setButton(modal, '그만두기', '인증하기');
	setContent(modal, true, true);
	addPiggyBackground(modal);
	
	let modalBody = $('<br><div class="send">현재 보유 캐시<br>25,000 <i class="fas fa-coins"></i><div><br><div class="chargeMoney">인증 계좌 <input placeholder="&nbsp&nbsp 123-456789-5463"> <br><br>송금할 금액<input placeholder="&nbsp&nbsp금액을 입력해주세요. (최소 금액 : 천원)"><div>').height('10px')
					.addClass('send_modal_content');
	$('.modal_content').append(modalBody);
	
	
	
	modalBlock();
	
	$('.modal_left_btn').click(function() {
		modalNone();
	})
}

/* 푸시알림 모달 */
let createPushModal = () => {
	let modal = initModal('modal', 1);
	appendTitle(modal, '푸시알림 설정');
	setButton(modal, '설정완료');
	setContent(modal, true, true);
	
	let modalBody = $('<div class="device">*현재 접속한 기기설정만 변경가능</div><br><br><div class="push_wrap"><div class="push_text1">PC 알림허용</div><button id="push_btn1" onclick="pcPushOn()">알림켜기</button><button id="push_btn2" onclick="pcPushOff()">알림끄기</button></div><br><br><div class="push_wrap"><div class="push_text2">모바일 알림허용</div><button id="push_btn1" onclick="mobilePushOn()">알림켜기</button><button id="push_btn2" onclick="mobilePushOff()">알림끄기</button></div>').height('10px')
					.addClass('send_modal_content');
	$('.modal_content').append(modalBody);
	modalBlock();
	$('.modal_left_btn').click(function() {
		modalNone();
	})
}

