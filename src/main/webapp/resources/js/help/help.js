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





let filter = 'all';

//상태 필터링
let filtering = async () => {
	filter = $('.state_filter').val();
	let datas = await filterFetch();
	console.dir(datas);
	if(datas.noList) {
		$('.help_list').html('');
		let tr = $('<tr>');
		tr.append($("<td colspan = '7'>조회된 해협 내역이 없습니다.</td>"));
		$('.help_list').append(tr);
		return;
	}
	
	renewHelpList(datas.helpList);
	renewPage(datas.paging);
}

let filterFetch = async () => {
	let response = await fetch('/help/help-list?filter=' + filter)
	let datas = await response.json();
	return datas;
}

//페이징 번호나 화살표 눌렀을때
let getList = async (pageUrl) => {
	let url = pageUrl + '&filter=' + filter;
	let datas = await pageFetch(url);
	console.dir(datas);
}

let pageFetch = async (url) => {
	let response = await fetch(url)
	let datas = await response.json();
	return datas;
}

let renewHelpList = (helpList) => {
	$('.help_list').html('');
	
	helpList.forEach(help => {
		let regDate = new Date(help.regDate);
		let company = help.company == null ? '' : help.company;
		let payMeans = help.payMeans == null ? '' : help.payMeans;
		let tr = $('<tr>');
		tr.append($('<td>' + help.field + '</td>')).append($('<td>' + help.area + '</td>'))
			.append($('<td>' + help.regDate + '</td>')).append($('<td>' + help.estimateCnt + '</td>'))
			.append($('<td>' + company + '</td>')).append($('<td>' + payMeans + '</td>'))
			.append(getBtnTd(help))
			.append($('<input>').addClass('reqIdx').attr('type', 'hidden').val(help.reqIdx));
			//.append($('<input>').addClass('state').attr('type', 'hidden').val(help.reqIdx))
			//.append($('<input>').addClass('ongoing').attr('type', 'hidden').val(help.reqIdx))
		$('.help_list').append(tr);
	})
	
}

let getBtnTd = (help) => {
	let td = $('<td>');
	switch(help.state) {
		case 1:
			let deleteBtn = $('<button>삭제</button>').addClass('list_btn_red').attr('id', 'delete').attr('onclick', 'deleteHelp(' + help.reqIdx + ')');
			let refreshBtn = $('<button>끌올</button>').addClass('list_btn_green').attr('id', 'refresh').attr('onclick', 'refreshHelp(' + help.reqIdx + ')');
			return td.append(deleteBtn).append(refreshBtn);
		case 2:
			let finishBtn = $('<button>완료</button>').addClass('list_btn_green').attr('id', 'complete').attr('onclick', 'completeHelp(' + help.reqIdx + ')');
			let cancelBtn = $('<button>취소</button>').addClass('list_btn_red').attr('id', 'cancel').attr('onclick', 'cancleHelp(' + help.reqIdx + ')');
			return td.append(finishBtn).append(cancelBtn);
		case 3:
			return td.html('완료 대기 중');
		case 4:
			let reviewBtn = $('<button>후기</button>').addClass('list_btn').attr('onclick', 'createReviewModal()');
			return td.append(reviewBtn);
		case 5:
			return td.html('★ ' + help.score);
		case 6:
			return td.html('취소 대기 중');
		default:
			return td.html('진행 취소');
	}
	
	
	
}

let renewPage = (paging) => {
	console.dir(paging);
}



