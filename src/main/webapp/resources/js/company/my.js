function moveTab(state) {
	location.href='/company/my?state=' + state;
} 

function completeService(reqIdx) {
	modalNone();
	let modal = initModal('modal', 3);
	appendTitle(modal,'해협완료');
	setButton(modal,'그만두기','확 인');
	setContent(modal,true,true);
	let modalBody = $('<div>정말 해협을 완료하시겠습니까?<div>').height('10px').css("margin",'0 20px 0 20px');
	modalBody.css("padding-top",'5px');
	$('.modal_content').append(modalBody);
	modalBlock();
	$('.modal_left_btn').click(function() {
		modalNone();
	})
	$('.modal_right_btn').click(function() {
	    location.href='/company/completeService?reqIdx=' + reqIdx;
	    modalNone();
	})
	
}

function cancelService(reqIdx) {
	modalNone();
	let modal = initModal('modal', 3);
	appendTitle(modal,'해협취소');
	setButton(modal,'그만두기','확 인');
	setContent(modal,true,true);
	let modalBody = $('<div>정말 해협을 취소하시겠습니까?<div>').height('10px').css("margin",'0 20px 0 20px');
	modalBody.css("padding-top",'5px');
	$('.modal_content').append(modalBody);
	modalBlock();
	$('.modal_left_btn').click(function() {
		modalNone();
	})
	$('.modal_right_btn').click(function() {
	    location.href='/company/cancelService?reqIdx=' + reqIdx;
	    modalNone();
	})
}
