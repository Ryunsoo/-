$(function() {
	$("#date2").datepicker({
		dateFormat : "yy-mm-dd",
		dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
		monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월",
						"7월", "8월", "9월", "10월", "11월", "12월" ],
		monthNamesShort : [ "1월", "2월", "3월", "4월", "5월", "6월",
							"7월", "8월", "9월", "10월", "11월", "12월" ],
		defaultDate : "+1w",
		numberOfMonths : 1,
		changeMonth : true,
		showMonthAfterYear : true,
		changeYear : true,
		minDate : +1, //캘린더 범위에서 시작 날짜
		maxDate : "+2M +5D"
	});
});
	
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
             
$('.cancel').click(function() {
	let sendModal = initModal('modal', 3);
	appendTitle(sendModal, '');
	setButton(sendModal, '삭제', '추가');
	setContent(sendModal, true, true);
	//addPiggyBackground(sendModal);
	modalBlock();
        	
	let modalBody = $('<div class="add">최근 소진 목록에 추가하시겠습니까?<div><br>')
		.addClass('send_modal_content');
	$('.modal_content').append(modalBody);
        	
	$('.modal_left_btn').click(function() {
		modalNone();
	})
})
        
function plusItem(){
	let item = $('#item').val();
	let date = $('#date2').val();
	
	fetch("/management/plusItem?item="+item + "&date=" + date);
}

function IceBoxCategory(category){
	location.href='/management/my?state=' + state;
}
