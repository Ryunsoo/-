(()=>{
	
	let confirmPasswordCheck = false;
	let confirmNameCheck = false;
	let confirmTellCheck = false;
	let confirmNick = '';
	let confirmEmail = '';
	
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
		document.querySelector('.form-control-pw-top').style.border = '1px solid lightgray';
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
	document.querySelector("#password_check").addEventListener('input', e => {
		
		let passwordInput = document.querySelector('.form-control-pw-top').value;
		let inputMsg = document.querySelector("#pwCheck");
		let confirmInput = document.querySelector('#password_check').value;

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
	
	
	/*이름 입력창 테두리*/
	document.querySelector("#name").addEventListener('input', e => {
		let nameInput = document.querySelector('#name');
		
		if(nameInput.value == "") {
			nameInput.style.border = '1px solid lightgray';
			confirmNameCheck = false;
			return;
		}
		
		if(nameInput.value != "") {
			nameInput.style.border = '1px solid green';
			confirmNameCheck = true;
		}

	})
	
	
	/*전화번호 입력창 테두리*/
	document.querySelector("#tell").addEventListener('input', e => {
		let tellInput = document.querySelector('#tell');
		let tellExpr = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
		
		console.dir(tellInput.value);
		if(!tellExpr.test(tellInput.value)||tellInput.value == "") {
			tellInput.style.border = '1px solid red';
			confirmTellCheck = false;
			return;
		}else {
			tellInput.style.border = '1px solid green';
			confirmTellCheck = true;
		}
		

	})
	

	
	/* 닉네임 */
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
					btnNickCheck = true;
				}else if(text == 'disable'){
					document.querySelector('#nickCheck').innerHTML ='사용 불가능한 닉네임입니다.';   
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
	
	/* 이메일 */
	let btnEmailCheck = document.querySelector("#btnEmailCheck");
	btnEmailCheck.addEventListener('click', e => {
		let userEmail = email.value;
		console.dir(userEmail);
		if(userEmail) {
			 fetch('/mypage/email-check?email=' + userEmail)  	
			.then(response => response.text())
			.then(text => {
				console.dir(text);
				
				if(text == 'available'){
					document.querySelector('#emailCheck').innerHTML ='사용 가능한 이메일 입니다.';   
					document.querySelector('#emailCheck').style.color = 'green';
					document.querySelector('#email').style.border = '1px solid green';
					confirmEmail = userEmail;
					btnEmailCheck = true;
				}else if(text == 'disable'){
					document.querySelector('#emailCheck').innerHTML ='사용 불가능한 이메일 입니다.';   
					document.querySelector('#emailCheck').style.color = 'red';
					document.querySelector('#email').style.border = '1px solid red';	
					btnEmailCheck = false;					
				}else {
					document.querySelector('#emailCheck').innerHTML ='시스템 장애 입니다.'; 
					document.querySelector('#emailCheck').style.color = 'red';
					document.querySelector('#email').style.border = '1px solid red';
					btnEmailCheck = false;
				}
			})
			
		}
			
	})
	

/*제출버튼 검증*/
	/*let allInput = document.querySelectorAll('input');
	
	allInput.forEach( item => {
		
		let dom = document.querySelector('#modify_btn');
		console.dir(item);
		
		if(item.style.color == 'red'){
			dom.style.backgroundColor = 'lightgray';
			dom.style.setProperty("pointer-events", "none");
			return;
		}
			dom.style.setProperty('background-color', '#384c60');
			dom.style.setProperty("pointer-events", "auto");
	});*/
	

	
	
	



})();

