(()=>{
	
	let barText = document.querySelector('#validator_bar_text');
	
	let lowBar = document.querySelector('.low');
	let middleBar = document.querySelector('.middle');
	let highBar = document.querySelector('.high');
	
	let resetNone = ()=>{
		lowBar.style.display = 'none';
		middleBar.style.display = 'none';
		highBar.style.display = 'none';
		barText.style.display = 'none';
	}
	resetNone();
	
	
	
	document.querySelector(".form-control-pw-top").addEventListener('input', e => {
		let passwordInput = document.querySelector('.form-control-pw-top').value;
		resetNone();
		if(passwordInput.length >= 8) {
			lowBar.style.display = 'block';
			barText.style.display = 'block';
			barText.style.color = 'red';
			barText.innerHTML = "낮음";
		}
	
		if(passwordInput.length >= 10) {
			lowBar.style.display = 'block';
			middleBar.style.display = 'block';
			barText.style.display = 'block';
			barText.style.color = '#FBB117';
			barText.innerHTML = "중간";
		}
		
		if(passwordInput.length >= 12) {
			lowBar.style.display = 'block';
			middleBar.style.display = 'block';
			highBar.style.display = 'block';
			barText.style.display = 'block';
			barText.style.color = '#4CC417';
			barText.innerHTML = "높음";
		}
		return;
	})
	
	document.querySelector("#password_check").addEventListener('input', e => {
		
		let passwordInput = document.querySelector('.form-control-pw-top').value;
		let inputMsg = document.querySelector("#pwCheck");
		let confirmInput = document.querySelector('#password_check').value;
		
		
		if (confirmInput.length > 0){
			if (confirmInput == passwordInput) {
				inputMsg.innerHTML = "비밀번호 일치";
			} else {
				inputMsg.innerHTML = "비밀번호 일치하지 않아요";
			}	
		}
		
	})
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	let confirmId = '';
		
		let btnIdxCheck = document.querySelector("#btnIdCheck");
		
			btnIdxCheck.addEventListener('click', e => {
				let userId = id.value;
		
				if(userId) {
					 fetch('/member/id-check?id=' + userId)  	
					.then(response => response.text())
					.then(text => {
						console.dir(text);
						
						if(text == 'available'){
							document.querySelector('#idCheck').innerHTML ='사용 가능한 아이디 입니다.';   	
							confirmId = userId;
						}else if(text == 'disable'){
							document.querySelector('#idCheck').innerHTML ='사용 불가능한 아이디 입니다.';   						
						}else {
							document.querySelector('#idCheck').innerHTML ='시스템 장애 입니다.'; 
						}
					})
					
				}
					
	   		})


})();

