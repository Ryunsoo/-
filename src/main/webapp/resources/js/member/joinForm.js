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

})();

