/* 탈퇴 완료 확인 모달 */
        let real_delete_confirm = () => {
    		let modal = initModal('modal', 3);
    		appendTitle(modal, '회원탈퇴');
    		setButton(modal, '확인');
    		setContent(modal,true,true);
    		
    		
    		let modalBody = $('<div class="bye">탈퇴되었습니다.<div><br>')
    						.addClass('send_modal_content');
    		$('.modal_content').append(modalBody);
    		
    		
    		modalBlock();
    		
    		$('.modal_left_btn').click(function() {
    			modalNone();
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