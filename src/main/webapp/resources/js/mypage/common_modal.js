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