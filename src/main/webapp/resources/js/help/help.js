//삭제 버튼
let deleteHelp = (reqIdx) => {
	console.dir(reqIdx);
	modalNone();
	let modal = initModal('modal', 1);
	appendTitle(modal,'해협취소');
	setButton(modal,'그만두기','확 인');
	setContent(modal,true,true);
	let modalBody = $('<div>정말 해협을 취소하시겠습니까?<div>').height('10px').css("margin",'0 20px 0 20px');
	$('.modal_content').append(modalBody);
	modalBlock();
	$('.modal_left_btn').click(function() {
		modalNone();
	})
	$('.modal_right_btn').click(function() {
	    location.href = '/help/deleteHelp?reqIdx='+reqIdx;
	    modalNone();
	})
}
//최신화 버튼
let refreshHelp = (reqIdx) => {
	console.dir(reqIdx);
	modalNone();
	let modal = initModal('modal', 1);
	appendTitle(modal,'해협끌올');
	setButton(modal,'그만두기','확 인');
	setContent(modal,true,true);
	let modalBody = $('<div>해협신청을 갱신하시겠습니까?<div>').height('10px').css("margin",'0 20px 0 20px');
	$('.modal_content').append(modalBody);
	modalBlock();
	$('.modal_left_btn').click(function() {
		modalNone();
	})
	$('.modal_right_btn').click(function() {
	    location.href = '/help/refreshHelp?reqIdx='+reqIdx;
	    modalNone();
	})
}
//취소 버튼
let cancelHelp = (reqIdx) => {
	console.dir(reqIdx);
	modalNone();
	let modal = initModal('modal', 1);
	appendTitle(modal,'해협취소');
	setButton(modal,'그만두기','확 인');
	setContent(modal,true,true);
	let modalBody = $('<div>취소요청을 보내시겠습니까?<div>').height('10px').css("margin",'0 20px 0 20px');
	$('.modal_content').append(modalBody);
	modalBlock();
	$('.modal_left_btn').click(function() {
		modalNone();
	})
	$('.modal_right_btn').click(function() {
	    location.href = '/help/cancelHelp?reqIdx='+reqIdx;
	    modalNone();
	})
}
//완료 버튼
let completeHelp = (reqIdx) => {
	console.dir(reqIdx);
	modalNone();
	let modal = initModal('modal', 1);
	appendTitle(modal,'해협완료');
	setButton(modal,'그만두기','확 인');
	setContent(modal,true,true);
	let modalBody = $('<div>해협 완료를 진행하시겠습니까?<div>').height('10px').css("margin",'0 20px 0 20px');
	$('.modal_content').append(modalBody);
	modalBlock();
	$('.modal_left_btn').click(function() {
		modalNone();
	})
	$('.modal_right_btn').click(function() {
	    location.href = '/help/completeHelp?reqIdx='+reqIdx;
	    modalNone();
	})
}







//상태 필터링
let filtering = () => {
	let selectedState = $('.state_filter').val();
	console.dir(selectedState);
	
}





