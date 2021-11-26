/* 재미로 만든 별점 올리기 */
document.querySelector(".temp_btn").addEventListener('click', e => {
	let scoreNum = parseFloat(document.querySelector("#score_num").innerHTML);
	if(scoreNum < 5) {
		document.querySelector("#score_num").innerHTML = scoreNum + 0.5;
		let widthValue = parseInt(document.querySelector("#contorl_star").style.width.substring(0,2));
		document.querySelector("#contorl_star").style.width = (widthValue + 10) + "%";
	}
});
        
  
                                       
$(function(){
    var chartData=[];

    for(var i=0; i<$('.rmap').length; i++){
        chartData.push([$('.rmap').eq(i).val(),$('.rcnt').eq(i).val()]);
    }
	
	    
    console.dir(chartData);    
    var chart = c3.generate({
    	bindto:'.score_chart',
    	data: {
    	columns: chartData,
    	type : 'pie',
		}
	});
});

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
				location.href = "/mypage/mypage-company";
			})
		
		})
	})
}

/* 일반전환 */
let changeNomal = () => {
	let modal = initModal('modal', 2);
	appendTitle(modal, '일반계정 등록');
	setButton(modal, '그만두기', '연결하기');
	setContent(modal, true, true);
	
	let modalBody = $('<div class="registration"><br>아이디 <input id="changeId" placeholder="&nbsp&nbsp연결할 일반회원 계정의 아이디를 입력하세요."><br> 비밀번호<input id="changePw" type="password" placeholder="&nbsp&nbsp연결할 일반회원 계정의 비밀번호를 입력하세요."> <br><br> 현재 계정 비밀번호 확인<input id="confirmPw" type="password" placeholder="&nbsp&nbsp현재 로그인된 업체 비밀번호를 입력하세요."><div>').height('100px')
					.addClass('send_modal_content');
	$('.modal_content').append(modalBody);
	
	modalBlock();
	
	$('.modal_left_btn').click(function() {
		modalNone();
	})
	
	$('.modal_right_btn').click(function() {
		
		let changeId = document.getElementById("changeId").value;
		let changePw = document.getElementById("changePw").value;
		let confirmPw = document.getElementById("confirmPw").value;
		
		location.href = '/mypage/link?id='+changeId+'&password='+changePw+'&confirmPw='+confirmPw;
	})
}

function goMember(){
	location.href = '/mypage/change';
}

/* 내정보 하위 버튼 */
     	const myInfo_btn = document.querySelector("#myInfo_btn");
        const modifyInfo_btn = document.querySelector("#modifyInfo_btn");
        const delete_user_btn = document.querySelector("#delete_user_btn");
        const bg = document.querySelector("#bg");
        const delete_user = document.querySelector(".delete_user");
		const cancel = document.querySelector(".cancel");
        const confirm = document.querySelector(".confirm");
        const wrap = document.querySelector(".wrap");
        
        /* 내정보 하위 버튼 */
        myInfo_btn.addEventListener("mouseover",function(){
        	modifyInfo_btn.classList.remove("hidden");
        	delete_user_btn.classList.remove("hidden");
        });
        
        /* 정보 수정 버튼 */
        modifyInfo_btn.addEventListener("click",function(){
        	location.href = '/mypage/company-modifyInfo'
        });
        
        /* div class wrap부분 누르면 하위 버튼들 사라짐 */
        wrap.addEventListener("click",function(){
        	modifyInfo_btn.classList.add("hidden");
        	delete_user_btn.classList.add("hidden");
        });
        
        /* 탈퇴 버튼 */
        delete_user_btn.addEventListener("click",function(){
        	bg.classList.remove("hidden");
        	modifyInfo_btn.classList.add("hidden");
        	delete_user_btn.classList.add("hidden");
        	delete_user.classList.remove("hidden");
        });	
        
        /* 탈퇴취소 */
        cancel.addEventListener("click",function(){
        	bg.classList.add("hidden");
        	delete_user.classList.add("hidden");
        });	
        
        /* 탈퇴 가즈아 */
        confirm.addEventListener("click",function(){
        	const isChecked = document.querySelector("#check").checked;
        	const isChecked2 = document.querySelector("#check2").checked;
        	const isChecked3 = document.querySelector("#check3").checked;
        	const alert_check = document.querySelector("#alert_check");	
        	
        	/* 3가지 항목이 모두 체크되었을 때 탈퇴진행 */
  			console.dir(isChecked);
        		if(isChecked == true & isChecked2 == true & isChecked3 == true){
        			location.href='/member/delete-company-user';
        			bg.classList.add("hidden");
                	delete_user.classList.add("hidden");
        	    }else{
        	        const alert_check = document.querySelector("#alert_check");
        	        alert_check.classList.remove("hidden");
					console.dir("할루");
        	    }
        });	
       