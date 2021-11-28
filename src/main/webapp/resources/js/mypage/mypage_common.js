let memo = document.querySelectorAll('#input_memo_wrap');
		let memo_btn = document.querySelectorAll("#memo");
		let save_memo_btn = document.querySelectorAll("#confirm");
		let delete_btn = document.querySelectorAll("#delete");
		let neighborname = document.querySelectorAll("#neighborname");
		let chat_btn = document.querySelectorAll("#chat");
		let id = document.querySelectorAll("#friendId");

		
		/* memo */
		console.dir(memo);
		console.dir(memo_btn);
		
		for(let i = 0; i <memo.length; i++){
			let friendId = id[i].innerText;
			
			memo_btn[i].addEventListener("click", () => {
				memo[i].classList.remove("hidden");
			})
			
			delete_btn[i].addEventListener("click", () => {
				
				console.dir("얄루 : " + friendId);
				
				 fetch('/mypage/delete-friend?friendId=' + friendId)
				  .then(res=> res.text())
					.then(text=> {
						if(text) {
							
								let modal = initModal('modal', 3);
								appendTitle(modal, '');
								setButton(modal, '닫기');
								setContent(modal, true, true);
								modalBlock();
								
								let modalBody = $('<div class="alertMessage">삭제 되었습니다.</div><br>')
								.addClass('send_modal_content');
								
								$('.modal_content').append(modalBody);
								
								$('.modal_left_btn').click(function() {
									modalNone();
									location.href='mypage-common';
								})
							}
						})
					})
					
			chat_btn[i].addEventListener("click", () => {
				
				 fetch('/chat/create-chatRoom?friendId=' + friendId)
				  .then(res=> res.text())
					.then(text=> {
						if(text) {
							
								let modal = initModal('modal', 3);
								appendTitle(modal, '');
								setButton(modal, '닫기');
								setContent(modal, true, true);
								modalBlock();
								
								let modalBody = $('<div class="alertMessage">채팅방이 생성 되었습니다.</div><br>')
								.addClass('send_modal_content');
								
								$('.modal_content').append(modalBody);
								
								$('.modal_left_btn').click(function() {
									modalNone();
									location.href='mypage-common';
								})
							}
						})
					})
	
	
			
	
	
}
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
        	location.href='/mypage/modify-info';
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
        			location.href='/member/delete-user';
        			bg.classList.add("hidden");
                	delete_user.classList.add("hidden");
        	    }else{
        	        const alert_check = document.querySelector("#alert_check");
        	        alert_check.classList.remove("hidden");
					console.dir("할루");
        	    }
        });
