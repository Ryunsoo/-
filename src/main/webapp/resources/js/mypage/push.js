let pcPushOn = () => {
	modalNone();
	let modal = initModal('modal', 1);
	appendTitle(modal, 'PC 푸시알림 설정');
	setButton(modal, '확인');
	setContent(modal, true, true);
	let modalBody = $('<div class="push_text3">푸시알림이 활성화되었습니다.</div>').height('10px')
					.addClass('send_modal_content');
	$('.modal_content').append(modalBody);
	modalBlock();
	$('.modal_left_btn').click(function() {
		modalNone();
	})
}
let pcPushOff = () => {
	modalNone();
	let modal = initModal('modal', 1);
	appendTitle(modal, 'PC 푸시알림 설정');
	setButton(modal, '확인');
	setContent(modal, true, true);
	let modalBody = $('<div class="push_text3">푸시알림이 비활성화되었습니다.</div>').height('10px')
					.addClass('send_modal_content');
	$('.modal_content').append(modalBody);
	modalBlock();
	$('.modal_left_btn').click(function() {
		modalNone();
	})
}
let mobilePushOn = () => {
	modalNone();
	let modal = initModal('modal', 1);
	appendTitle(modal, '모바일 푸시알림 설정');
	setButton(modal, '확인');
	setContent(modal, true, true);
	let modalBody = $('<div class="push_text3">푸시알림이 활성화되었습니다.</div>').height('10px')
					.addClass('send_modal_content');
	$('.modal_content').append(modalBody);
	modalBlock();
	$('.modal_left_btn').click(function() {
		modalNone();
	})
}
let mobilePushOff = () => {
	modalNone();
	let modal = initModal('modal', 1);
	appendTitle(modal, '모바일 푸시알림 설정');
	setButton(modal, '확인');
	setContent(modal, true, true);
	let modalBody = $('<div class="push_text3">푸시알림이 비활성화되었습니다.</div>').height('10px')
					.addClass('send_modal_content');
	$('.modal_content').append(modalBody);
	modalBlock();
	$('.modal_left_btn').click(function() {
		modalNone();
	})
}