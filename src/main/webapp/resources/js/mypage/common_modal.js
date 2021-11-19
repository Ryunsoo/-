/* 충전하기 모달 */
let createChargingModal = () => {
	
	let currentCash = document.querySelector(".currentCash").innerText;
	
	let modal = initModal('modal', 1);
	appendTitle(modal, '충전하기');
	setButton(modal, '그만두기', '충전하기');
	setContent(modal, true, true);
	addPiggyBackground(modal);
	
	let modalBody = $('<div class="charging">현재 보유 캐시<br>'+currentCash+' <i class="fas fa-coins"></i><div><div class="chargeMoney">충전할 금액 <input type="number" id="chargeCash" placeholder="&nbsp&nbsp금액을 입력해주세요. (최소 금액 : 천원)"><div>').height('10px')
					.addClass('send_modal_content');
	$('.modal_content').append(modalBody);
	
	
	
	modalBlock();
	
	$('.modal_left_btn').click(function() {
		modalNone();
	})
	
	$('.modal_right_btn').click(function() {
		
		let cash = document.querySelector("#chargeCash").value;
		
		if (cash < 1000){
			alert("최소 충전 금액은 1000원입니다.");
			return;
		}
		
		modalNone();
		
		var IMP = window.IMP;
		IMP.init("imp64410269");
		
		IMP.request_pay({
			pg: "html5_inicis",
			pay_method: "card",
			merchant_uid: 'merchant_' + new Date().getTime(),
			name: "캐쉬 충전",
			amount: parseInt(cash),
			buyer_name: document.querySelector(".userName").innerText,
			buyer_tel: '01041147406'
		}, function(res) {
			if (res.success) {
				jQuery.ajax({
					url: "/mypage/charge",
					type: "POST",
					headers: {"Content-Type":"application/json"},
					data: JSON.stringify({
						imp_uid : res.imp_uid,
						buyer_name : res.buyer_name,
						amount : res.paid_amount
					})
				}).done(function(data) {
					
					console.dir(data);
					
					if(data == "success"){
						alert(cash + "원이 충전되었습니다.");
						location.href = "/mypage/mypage-common";
					} else {
						alert("결제 정보와 맞지 않는 값입니다.");
					}
				})
			} else {
				alert("결제에 실패했습니다.");
			}
		});
		
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
	let currentCash = document.querySelector(".currentCash").innerText;
	
	let modal = initModal('modal', 2);
	appendTitle(modal, '송금하기');
	setButton(modal, '그만두기', '송금하기');
	setContent(modal, true, true);
	addPiggyBackground(modal);
	
	let modalBody = $('<br><div class="send">현재 보유 캐시<br>'+currentCash+' <i class="fas fa-coins"></i><div><br><div class="chargeMoney">인증 계좌 <input id="inputAccount" placeholder="&nbsp&nbsp 등록된 계좌를 입력하세요"> <br><br>송금할 금액<input id="inputCash" placeholder="&nbsp&nbsp금액을 입력해주세요. (최소 금액 : 천원)"><div>').height('10px')
					.addClass('send_modal_content');
	$('.modal_content').append(modalBody);
	
	
	
	modalBlock();
	
	$('.modal_left_btn').click(function() {
		modalNone();
	})
	
	$('.modal_right_btn').click(function() {
		
		let account = document.getElementById("inputAccount").value;
		let cash = document.getElementById("inputCash").value;
		
		
		if(cash < 1000){
			alert("최소 송금 금액은 1000원입니다.");
			return;
		}
		
		modalNone();
		
		
		fetch('/mypage/account-check?account=' + account + '&cash=' + cash)  	
		.then(response => response.text())
		.then(text => {
			
			let msg = "";
			
			if(text == "available"){
				msg = cash + "원이 출금되었습니다.";
			} else if (text == "disable") {
				msg = "잔액이 부족합니다.";
			} else {
				msg = "인증되지 않은 계좌번호입니다.";
			}
			
			let modal = initModal('modal', 3);
			appendTitle(modal, '');
			setButton(modal, '닫기');
			setContent(modal, true, true);
			//addPiggyBackround(sendModal);
			modalBlock();
			
			let modalBody = $('<div class="alertMsg">'+msg+'</div><br>')
			.addClass('send_modal_content');
			
			$('.modal_content').append(modalBody);
			
			$('.modal_left_btn').click(function() {
				location.href = "/mypage/mypage-common";
			})
		
		})
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

