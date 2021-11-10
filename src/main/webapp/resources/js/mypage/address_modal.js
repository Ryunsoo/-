let doArr = ['강원', '전북', '서울', '대전', '대구', '부산', '전남', '제주', '충북', '세종', '인천', '충남', '경북', '경기', '경남', '광주', '울산'];
        let guArr = ['강남구', '중구', '관악구', '종로구', '강동구', '중랑구', '강서구', '동작구', '송파구', '구로구', '마포구', '성동구', '영등포구', '양천구', '강북구', '은평구', '성북구', '서초구', '금천구', '노원구', '광진구', '서대문구', '용산구', '동대문구', '도봉구'];
        let dongArr = ['개포1동', '개포2동', '개포4동', '논현1동', '논현2동', '대치1동', '대치2동', '대치4동', '도곡1동', '도곡2동', '삼성1동', '삼성2동', '세곡동', '수서동', '신사동', '압구정동', '역삼1동', '역삼2동', '일원1동', '일원2동', '일원본동', '청담동'];

        doArr.sort();
        guArr.sort();
        dongArr.sort();

        /* 시/도 모달 */
        let createAddressFirstModal = () => {
           let addressModal = initModal('modal', 4);
           appendTitle(addressModal, '시/도');
           setButton(addressModal, '그만두기', '다 음');
           setContent(addressModal, true, true);
           $('.modal_content').removeClass('modal_content').addClass('address_modal_content');
           modalBlock();
           
           /* 구역 나누기 (시/도 -> 시) */
           let doDiv = $('<div>').addClass('do_div');
           $('.address_modal_content').append(doDiv);
           
           for(let i = 0; i < doArr.length; i++) {
        	   doTextDiv = $('<div>').addClass('do_text');
        	   doTextDiv.text(doArr[i]);
        	   doDiv.append(doTextDiv);
           }
          
           let guDiv = $('<div>').addClass('gu_div');
           $('.address_modal_content').append(guDiv);
           
           for(let i = 0; i < guArr.length; i++) {
        	   let guTextDiv = $('<div>').addClass('gu_text');
        	   guTextDiv.text(guArr[i]);
        	   guDiv.append(guTextDiv);
           }
           
           /* 취소 */
           $('.modal_left_btn').click(function() {
              modalNone();
           })
           /* 구까지 결정 */
           $('.modal_right_btn').click(function() {
              modalNone();
              createAddressSecondModal();
           })
        }

        let createAddressSecondModal = () => {
        	let secondModal = initModal('modal', 4);
        	appendTitle(secondModal, '동');
            setButton(secondModal, '이 전', '결정하기');
            setContent(secondModal, true, true);
            $('.modal_content').removeClass('modal_content').addClass('address_modal_content');
            modalBlock();
        	
            let dongDiv = $('<div>').addClass('dong_div');
            $('.address_modal_content').append(dongDiv);
            
            for(let i = 0; i < doArr.length; i++) {
         	   let dongTextDiv = $('<div>').addClass('dong_text');
         	   dongTextDiv.text(dongArr[i]);
         	   dongDiv.append(dongTextDiv);
            }
            
            
            
            $('.modal_left_btn').click(function() {
                modalNone();
                createAddressFirstModal();
             })
             
            $('.modal_right_btn').click(function() {
               modalNone();
            })
            
        }   
        