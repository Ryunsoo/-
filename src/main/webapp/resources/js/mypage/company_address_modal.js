
   let locationData;
   let majorKey = "";
   let cityKey = "";
   let townKey = "";
   
   let resetKey = () => {
		majorKey="";
		cityKey="";
		townKey="";
	}
   
   let doArr = ['강원', '경기', '경남', '경북', '광주', '대구', '대전', '부산', '서울', '세종', '울산', '인천', '전남', '전북', '충남', '충북'];
   let guArr = [];
   let dongArr = [];
   
   let resetArr = () => {
	guArr = [];
	dongArr = [];
}

/* 시/도 모달 */
let createAddressFirstModal = () => {
      resetArr();
      resetKey();
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
       
       
       locationClick();
       createAddressFirstModalButton();
  }
  
         
         
let createAddressFirstModalGuArr = () => {
   
   if(document.querySelector('.gu_div') !== null){
      $('.gu_div').remove();
   }
    
   let guDiv = $('<div>').addClass('gu_div');
   $('.address_modal_content').append(guDiv);      
   

   
   for(let i = 0; i < guArr.length; i++) {
      let guTextDiv = $('<div>').addClass('gu_text');
      guTextDiv.text(guArr[i]);
      guDiv.append(guTextDiv);
   }
   
   
    locationCityClick();
   
  	createAddressFirstModalButton();
}




let createAddressFirstModalButton = () => {
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
    
    for(let i = 0; i < dongArr.length; i++) {
       let dongTextDiv = $('<div>').addClass('dong_text');
       dongTextDiv.text(dongArr[i]);
       dongDiv.append(dongTextDiv);
    }
    
    $('.modal_right_btn').attr('id','address-submit-button');
    
    
    
    locationTownClick();
    
    $('.modal_left_btn').click(function() {
        modalNone();
        createAddressFirstModal();
        createAddressFirstModalGuArr();
        createAddressFirstModalButton();
     })
    
}   




        
        
let resetbutton = (element) => {
   for(i=0; i<element.length; i++){
      element[i].style.color = '#808080';
   }
   
}


let resetTownbutton = (element) => {
	 for(i=0; i<element.length; i++){
      element[i].style.color = 'white';
   }
}

     

let locationClick = () => {
   document.querySelector(".do_div").addEventListener("click", (e)=>{
      if(e.target!==e.currentTarget) {
         resetbutton(document.querySelectorAll(".do_text"));
         majorKey = e.target.innerHTML;
         e.target.style.color = 'red';
         locationFetchCityList(majorKey);
      }
      e.stopPropagation();
   })
}




let locationFetchCityList = (majorKey) => {
   fetch("http://localhost:9090/mypage/location-list?majorKey=" + majorKey)
     .then((response) => response.json())
     .then((response) => {
        locationData = response;
        guArr=[];
        dongArr=[];
        
        for(let i=0; i<locationData.length; i++){
            guArr.push(locationData[i].city);
         }
         
        createAddressFirstModalGuArr();
           
     });
}



let locationCityClick = () => {
   document.querySelector(".gu_div").addEventListener("click", (e)=>{
      if(e.target!==e.currentTarget) {
         resetbutton(document.querySelectorAll(".gu_text"));
         cityKey = e.target.innerHTML;
         e.target.style.color = 'red';
         locationFetchTownList(cityKey);
      }
   })
}





let locationFetchTownList = (cityKey) => {
   fetch("http://localhost:9090/mypage/location-list?city=" + cityKey)
     .then((response) => response.json())
     .then((response) => {
        locationData = response;
        dongArr=[];
        for(let i=0; i<locationData.length; i++){
            dongArr.push(locationData[i].town);
         }
     });
}




let locationTownClick = () => {
   document.querySelector(".dong_div").addEventListener("click", (e)=>{
      if(e.target!==e.currentTarget) {
         resetTownbutton(document.querySelectorAll(".dong_text"));
         townKey = e.target.innerHTML;
         e.target.style.color = 'red';
         $('.modal_right_btn').click(function() {
		addressSubmit();
    })
      }
   })
}



let addressSubmit = () => {
	fetch("http://localhost:9090/mypage/company-address-update?majorKey=" + majorKey + "&city=" + cityKey + "&town=" + townKey)
	.then(()=>{
		modalNone();
		location.reload();
	})
}





let address2Remove = () => {
	document.querySelector("#address2-remove-button").addEventListener("click", () => {
		fetch("http://localhost:9090/mypage/address-remove?addressNum=2&companymember=y")
		.then(()=>{
			location.reload();
		})
	})
	
}
address2Remove();


let address3Remove = () => {
	document.querySelector("#address3-remove-button").addEventListener("click", () => {
		fetch("http://localhost:9090/mypage/address-remove?addressNum=3&companymember=y")
		.then(()=>{
			location.reload();
		})
	})
	
}
address3Remove();



let resetEvent = () => {
   document.querySelector(".do_text").style.color = "#888888";
}
