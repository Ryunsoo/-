let PushOnSuccess = (device) => {
	modalNone();
	let modal = initModal('modal', 1);
	appendTitle(modal, device + ' 푸시알림 설정');
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

let PushOffSuccess = (device) => {
	modalNone();
	let modal = initModal('modal', 1);
	appendTitle(modal, device + ' 푸시알림 설정');
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

let PushFail = (device) => {
	modalNone();
	let modal = initModal('modal', 1);
	appendTitle(modal, device + ' 푸시알림 설정');
	setButton(modal, '확인');
	setContent(modal, true, true);
	let modalBody = $('<div class="push_text3">푸시설정 실패</div>').height('10px')
					.addClass('send_modal_content');
	$('.modal_content').append(modalBody);
	modalBlock();
	$('.modal_left_btn').click(function() {
		modalNone();
	})
}