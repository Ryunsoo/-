
let confirmNick = '';

let btnNickCheck = document.querySelector("#btnNickCheck");

	btnIdxCheck.addEventListener('click', e => {
		let userNickname = nickname.value;

		if(userNickname) {
			 fetch('/member/nick-check?nickname=' + userNickname)  	
			.then(response => response.text())
			.then(text => {
				console.dir(text);
				
				if(text == 'available'){
					document.querySelector('#nickCheck').innerHTML ='사용 가능한 아이디 입니다.';   
					document.querySelector('#nickCheck').style.color = 'green';
					document.querySelector('#nickname').style.border = '1px solid green';
					confirmNick = userNickname;
					btnNickCheck = true;
				}else if(text == 'disable'){
					document.querySelector('#nickCheck').innerHTML ='사용 불가능한 아이디 입니다.';   
					document.querySelector('#nickCheck').style.color = 'red';
					document.querySelector('#nickname').style.border = '1px solid red';	
					btnNickCheck = false;					
				}else {
					document.querySelector('#nickCheck').innerHTML ='시스템 장애 입니다.'; 
					document.querySelector('#nickCheck').style.color = 'red';
					document.querySelector('#nickname').style.border = '1px solid red';
					btnNickCheck = false;
				}
			})
			
		}
			
	})