const go = document.querySelector("#go");
const bg = document.querySelector("#bg");
const popup = document.querySelector("#popup");
const exit = document.querySelector("#exit");

go.addEventListener("click",function(){
    bg.classList.remove("hidden");
    popup.classList.remove("hidden");
});
exit.addEventListener("click",function(){
    bg.classList.add("hidden");
    popup.classList.add("hidden");
});

let deleteItem = (shoppingIdx) => {
   modalNone();
   let modal = initModal('modal', 3);
   appendTitle(modal,'항목 삭제');
   setButton(modal,'그만두기','확 인');
   setContent(modal,true,true);
   let modalBody = $('<div class="alertMessage">정말 삭제하시겠습니까?</div><br>')
   .addClass('send_modal_content');
   $('.modal_content').append(modalBody);
   modalBlock();
   $('.modal_left_btn').click(function() {
      modalNone();
   })
   $('.modal_right_btn').click(function() {
       location.href = "/management/deleteItem?shoppingIdx="+shoppingIdx;
       modalNone();
   })
}

let insertInputItem = () => {
   let item = $('.input').val();
   modalNone();
   let modal = initModal('modal', 3);
   appendTitle(modal,'항목 추가');
   setButton(modal,'그만두기','확 인');
   setContent(modal,true,true);
   let modalBody = $('<div class="alertMessage">해당 항목을 추가하시겠습니까?</div><br>')
   .addClass('send_modal_content');
   $('.modal_content').append(modalBody);
   modalBlock();
   $('.modal_left_btn').click(function() {
      modalNone();
   })
   $('.modal_right_btn').click(function() {
	   if(!item) {
		   modalNone();
		   let modal = initModal('modal', 3);
		   appendTitle(modal,'');
		   setButton(modal,'확 인');
		   setContent(modal,true,true);
		   let modalBody = $('<div class="alertMessage">추가할 항목을 입력해 주세요.</div><br>')
		   .addClass('send_modal_content');
		   $('.modal_content').append(modalBody);
		   modalBlock();
		   $('.modal_left_btn').click(function() {
		      modalNone();
		   })
	   }else {
		  location.href = "/management/insertInputItem?item="+item;
       	  modalNone();
          $('.input').val() = "";
	   }
   })
}

let checkedItem = () => {
    var frm = document.frm;
    var idx_chk = $('.checkbox');
    if(idx_chk.is(':checked')==false){
        modalNone();
	    let modal = initModal('modal', 3);
	    appendTitle(modal,'');
	    setButton(modal,'확 인');
	    setContent(modal,true,true);
	    let modalBody = $('<div class="alertMessage">체크된 값이 없습니다.</div><br>')
	    .addClass('send_modal_content');
	    $('.modal_content').append(modalBody);
	    modalBlock();
	    $('.modal_left_btn').click(function() {
	       modalNone();
	    })
        return false;
    }
}
        
let submitSend = (e) => {
	if($('.tell').val() == null || $('.date').val() == null) {
		$('.sfrm').preventDefault();
	}else {
		document.sfrm.submit();
	}	
}   
       
		
	        
        
        
