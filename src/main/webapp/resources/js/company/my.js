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

function viewDetail(reqIdx) {
	fetch('/company/viewDetail?reqIdx='+reqIdx)
	.then(response => response.json())
	.then(Detail => {
		
		modalNone();
		let modal = initModal('modal', 6);
		setButton(modal,'닫 기');
		setContent(modal,false,true);
		
		
		let modalSubCon = $('<div class="modal_subcon"></div>');
		let modalBody = $('<div class="modal_body"></div>');
		modalSubCon.append(modalBody);
		let contentWrapper = $('<div class="content_wrapper"></div>');
		modalBody.append(contentWrapper);
		
		let contentLeft = $('<div class="content_left"></div>');
		contentWrapper.append(contentLeft);
		let reqPhoto = $('<img class="req_photo" src="/file/'+Detail.savePath+'/'+Detail.reName+'">');
		let inpTitle = $('<div><textarea rows="10" cols="50" readonly>'+Detail.reqContent+'</textarea></div>');
		contentLeft.append(reqPhoto);
		contentLeft.append(inpTitle);
		
		let contentRight = $('<div class="content_right"></div>');
		contentWrapper.append(contentRight);
		let reqName = $('<div class="inp_title">* 성 함</div>');
		let inpName = $('<input type="text" value="'+Detail.reqName+'" readonly>');
		let reqTell = $('<div class="inp_title">* 연락처</div>');
		let inpTell = $('<input type="text" value="'+Detail.reqTell+'" readonly>');
		let reqAddress = $('<div class="inp_title">* 주 소</div>');
		let inpAddress = $('<input type="text" value="'+Detail.reqAddress+'" readonly>');
		let reqTime = $('<div class="inp_title">* 원하는 시간</div>');
		let inpTime = $('<input type="text" value="'+Detail.reqTime+'" readonly>');
		let reqPay = $('<div class="inp_title">* 희망금액</div>');
		let inpPay = $('<input type="text" value="'+Detail.reqPay+'" readonly>');
		contentRight.append(reqName);
		contentRight.append(inpName);
		contentRight.append(reqTell);
		contentRight.append(inpTell);
		contentRight.append(reqAddress);
		contentRight.append(inpAddress);
		contentRight.append(reqTime);
		contentRight.append(inpTime);
		contentRight.append(reqPay);
		contentRight.append(inpPay);
		
		
		$('.modal_content').append(modalSubCon);
		modalBlock();
		$('.modal_left_btn').click(function() {
			modalNone();
		})
	})
	
function showResult(msg){
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
	
	
	
	
	
	
	
	
	
}