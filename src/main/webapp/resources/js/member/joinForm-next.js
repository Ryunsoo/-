(()=>{

let confirmNick = '';
let confirmEmailCheck = false;
let confirmAddressCheck = false;
let confirmNicknameCheck = false;

let btnNickCheck = document.querySelector("#btnNickCheck");

	btnNickCheck.addEventListener('click', e => {
		let userNickname = nickname.value;

		if(userNickname) {
			 fetch('/member/nick-check?nickname=' + userNickname)  	
			.then(response => response.text())
			.then(text => {
				console.dir(text);
				
				if(text == 'available'){
					document.querySelector('#nickCheck').innerHTML ='사용 가능한 닉네임입니다.';   
					document.querySelector('#nickCheck').style.color = 'green';
					document.querySelector('#nickname').style.border = '1px solid green';
					confirmNick = userNickname;
					confirmNicknameCheck = true;
				}else if(text == 'disable'){
					document.querySelector('#nickCheck').innerHTML ='사용 불가능한 닉네임입니다.';   
					document.querySelector('#nickCheck').style.color = 'red';
					document.querySelector('#nickname').style.border = '1px solid red';	
					confirmNicknameCheck = false;					
				}else {
					document.querySelector('#nickCheck').innerHTML ='시스템 장애 입니다.'; 
					document.querySelector('#nickCheck').style.color = 'red';
					document.querySelector('#nickname').style.border = '1px solid red';
					confirmNicknameCheck = false;
				}
			})
			
		}
			
	})
	
	
	/*닉네임 검증이 끝나고 재입력할 때, 검증 초기화 */
	let nicknameReCheck = () => {
		document.querySelector("#id").addEventListener('input', e => {
			document.querySelector('#id').style.border = '1px solid lightgray';	
			document.querySelector('#idCheck').innerHTML =''; 
			confirmNicknameCheck = false;
		})
	}
	
	   		
	document.querySelector("#email").addEventListener('input', e => {
		let emailInput = document.querySelector('#email');
		let emailExpr = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if(emailInput.value == "") {
			emailInput.style.border = '1px solid lightgray';
			confirmEmailCheck = false;
			return;
		}

		if(!emailExpr.test(emailInput.value)) {
			emailInput.style.border = '1px solid red';
			confirmTellCheck = false;
			return;
		}
		
		if(emailExpr.test(emailInput.value)) {
			emailInput.style.border = '1px solid green';
			confirmTellCheck = true;
		}


	})
	
//
//	
//	
//	/*제출버튼 검증*/
//	let allInput = document.querySelectorAll('input');
//	
//	allInput.forEach( item => {
//		
//		let dom = document.querySelector('#next_btn');
//		
//		item.addEventListener('blur', event => {
//			if(confirmPasswordCheck&confirmNameCheck&confirmTellCheck&confirmIdCheck) {
//				dom.style.setProperty('background-color', '#384c60');
//				dom.style.setProperty("pointer-events", "auto");
//			} else {
//				dom.style.backgroundColor = 'lightgray';
//				dom.style.setProperty("pointer-events", "none");
//			}
//		})
//	});
	
	



	

	

	
	
	



})();



