(()=>{
	
	let confirmPasswordCheck = false;
	
	let barText = document.querySelector('#validator_bar_text');
	
	let lowBar = document.querySelector('.low');
	let middleBar = document.querySelector('.middle');
	let highBar = document.querySelector('.high');
	let testExpr = /(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Zㄱ-힣0-9]).{8,}/;
	
	
	let pwInputTopReset = ()=>{
		lowBar.style.display = 'none';
		middleBar.style.display = 'none';
		highBar.style.display = 'none';
		barText.style.display = 'none';
		document.querySelector("#pwCheck").innerHTML = "";
	}
	pwInputTopReset();
	
	
	/*비밀번호 레벨 바*/
	document.querySelector(".form-control-pw-top").addEventListener('input', e => {
		let passwordInput = document.querySelector('.form-control-pw-top').value;
		document.querySelector('.form-control-pw-btm').value = "";
		document.querySelector('.form-control-pw-btm').style.border = '1px solid lightgray';
		confirmPasswordCheck = false;
		pwInputTopReset();
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
		
		if(testExpr.test(passwordInput)) {
			document.querySelector('.form-control-pw-top').style.border = '1px solid green';
		}
		
		if(!testExpr.test(passwordInput)) {
			document.querySelector('.form-control-pw-top').style.border = '1px solid red';
		}
		
		if(passwordInput == "") {
			pwInputTopReset();
		}

	})
	
	
	
		
	/*비밀번호 일치 메시지*/
	document.querySelector("#newPwConfirm").addEventListener('input', e => {
		
		let passwordInput = document.querySelector('.form-control-pw-top').value;
		let inputMsg = document.querySelector("#pwCheck");
		let confirmInput = document.querySelector('#newPwConfirm').value;

		if (passwordInput.length > 0){
			if (confirmInput == passwordInput) {
				inputMsg.innerHTML = "비밀번호 일치";
				inputMsg.style.color = 'green';
			} else {
				inputMsg.innerHTML = "비밀번호 불일치";
				inputMsg.style.color = 'red';
			}	
		}
		
		if(passwordInput.length == 0) {
			inputMsg.innerHTML = "";
		}
		
	})
	
	
	
	
	/*비밀번호 입력창 테두리*/
	document.querySelector(".form-control-pw-btm").addEventListener('input', e => {
		let passwordInputBtm = document.querySelector('.form-control-pw-btm').value;
		let passwordInputTop = document.querySelector('.form-control-pw-top').value;
		let res = document.querySelector('.form-control-pw-btm');
		confirmPasswordCheck = false;
		if(passwordInputBtm == "") {
			res.style.border = '1px solid lightgray';
			confirmPasswordCheck = false;
			return;
		}
		
		if(passwordInputTop!=passwordInputBtm) {
			res.style.border = '1px solid red';
			confirmPasswordCheck = false;
			return;
		}
		
		if(passwordInputTop==passwordInputBtm) {
			res.style.border = '1px solid green';
			confirmPasswordCheck = true;
		}

	})
	
	
	
	

	console.dir(confirmPasswordCheck);
	

	
	

})();

