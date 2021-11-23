document.querySelector(".myBuyCnt").addEventListener('input', e => {
	
	let price = document.querySelector('#price').value.replace('원','');
	
	if((document.querySelector('#myBuyCnt').value * parseInt(document.querySelector('#price').value)) > parseInt(document.querySelector('#myPoint').value)){
			
		document.querySelector('#submit-button').style.setProperty('background-color', 'lightgray');
		document.querySelector('#submit-button').style.setProperty("pointer-events", "none");
		
		let modal = initModal('modal', 3);
		appendTitle(modal, '');
		setButton(modal, '닫기' , '이동');
		setContent(modal, true, true);
		modalBlock();
		
		let modalBody = $('<div class="alertMessage">포인트가 부족합니다.<br>충전하시겠습니까?</div><br>')
		.addClass('send_modal_content');
		
		$('.modal_content').append(modalBody);
		
		$('.modal_left_btn').click(function() {
			modalNone();
			document.querySelector('#submit-button').style.setProperty('background-color', 'lightgray');
			document.querySelector('#submit-button').style.setProperty("pointer-events", "none");
		})
		$('.modal_right_btn').click(function() {
			modalNone();
			location.href='/mypage/mypage-common';
		})
		}else{
			document.querySelector('#submit-button').style.setProperty('background-color', '#384c60');
			document.querySelector('#submit-button').style.setProperty("pointer-events", "auto");
		}
	
	if(document.querySelector('#restCnt').value<document.querySelector('#myBuyCnt').value){
			
		document.querySelector('#submit-button').style.setProperty('background-color', 'lightgray');
		document.querySelector('#submit-button').style.setProperty("pointer-events", "none");
		
		let modal = initModal('modal', 3);
		appendTitle(modal, '');
		setButton(modal, '닫기');
		setContent(modal, true, true);
		modalBlock();
		
		let modalBody = $('<div class="alertMessage">구매 가능 개수를 초과하였습니다.</div><br>')
		.addClass('send_modal_content');
		
		$('.modal_content').append(modalBody);
		
		$('.modal_left_btn').click(function() {
			modalNone();
			//location.href='mypage-common';
		})
		
		}else{
			document.querySelector('#submit-button').style.setProperty('background-color', '#384c60');
			document.querySelector('#submit-button').style.setProperty("pointer-events", "auto");
		}
})
