        const go = document.querySelector("#go");
        const bg = document.querySelector("#bg");
        const popup = document.querySelector("#popup");
        const exit = document.querySelector("#exit");
        let prevDate;
     	let nowDate;

        go.addEventListener("mouseover",function(){
            bg.classList.remove("hidden");
            popup.style.display = 'flex';
        });
        go.addEventListener("mouseout",function(){
            bg.classList.add("hidden");
            popup.style.display = 'none';
        });
        
function choice() {

	const choiceList = document.getElementsByName('choice');
	const personal = document.querySelector("#personal").checked;
	const fixed = document.querySelector("#fixed").checked;
	
	if(!personal && !fixed) return;
	
	let date = '';
	if(nowDate) {
		date = nowDate.dataset.date;
	}
	
	if(personal == true){
		$('.personal_category').each(function() {
			if(this.localName != 'select') {
				$(this).val('');
			}
			$(this).css('border', 'solid thin lightgray');
		})
		
		$('option').each(function(e) {
			if(this.disabled != true) {
				$(this).prop('selected', false);
			}else{
				$(this).prop('selected', true);
			}
		})
		
		$('#date1').val(date);
		document.querySelector('.personal_btn').style.display = "flex";
		document.querySelector('.personal_btn_modify').style.display = "none";
		document.getElementById("personal_hidden").style.display ="flex";
		document.getElementById("fixed_hidden").style.display ="none";
	}else{
		$('.fixed_category').each(function() {
			$(this).val('').css('border', 'solid thin lightgray');
		})
		$('#date2').val(date);
		document.querySelector('.fixed_btn').style.display = "flex";
		document.querySelector('.fixed_btn_modify').style.display = "none";
		document.getElementById("fixed_hidden").style.display ="flex";
		document.getElementById("personal_hidden").style.display ="none";
	}

}
     
     var calendarEl = document.getElementById('calendar');
   	 var calendar = new FullCalendar.Calendar(calendarEl, {
   			
   		  initialDate: new Date(),
   		  
   		  
   		  headerToolbar: {
   	        left: 'prevYear,prev',
   	        right: 'next,nextYear',
   	        center: 'title'
   	      },
   	      titleFormat: {
   	    	year: 'numeric',
   	    	month: 'long',
   	      },
   	      buttonText: {
   	    	today: 'today'  
   	      },
   	     /*  locale:'ko', */
   	      dayMaxEvents: true, // allow "more" link when too many events
   	      
   	      dateClick: function(info) {
			console.dir(info.date);
			console.dir(info.dateStr);
			console.dir(info.dayEl);
			nowDate = info.dayEl;
			if(prevDate) {
				prevDate.style.backgroundColor = '';
			}
			
			nowDate.style.backgroundColor = '#ffcc99';
			prevDate = nowDate;
		  },
		  
		  eventClick: function(info) {
			let event = info.event;
			let category = event.extendedProps.category;
			console.dir(event.startStr);
			if(category == 'FIXED') {
				document.getElementById("fixed_hidden").style.display ="flex";
				document.getElementById("personal_hidden").style.display ="none";
				document.querySelector('.fixed_btn').style.display = "none";
				document.querySelector('.fixed_btn_modify').style.display = "flex";
				
				$('.fixed_category').each(function() {
					$(this).css('border', 'solid thin lightgray');
				})
				
				$('.fixed_content').val(event.title);
				$('.fixed_fixedDate').val(event.extendedProps.fixedDate);
				$('.fixed_startDate').val(event.extendedProps.fixedStart);
				$('.fixed_endDate').val(event.extendedProps.fixedEnd);
				$('.fixed_price').val(event.extendedProps.price);
				$('.fixed_expIdx').val(event.extendedProps.expIdx);
				
			}else {
				document.getElementById("personal_hidden").style.display ="flex";
				document.getElementById("fixed_hidden").style.display ="none";
				document.querySelector('.personal_btn').style.display = "none";
				document.querySelector('.personal_btn_modify').style.display = "flex";
				
				$('option').each(function(e) {
					if(this.value == category) {
						$(this).prop('selected', true);
					}else if(this.disabled != true) {
						$(this).prop('selected', false);
					}
				})
				
				$('.personal_category').each(function() {
					$(this).css('border', 'solid thin lightgray');
				})
				
				$('.personal_content').val(event.title);
				$('.personal_expDate').val(event.startStr);
				$('.personal_price').val(event.extendedProps.price);
				$('.personal_expIdx').val(event.extendedProps.expIdx);
			}
			
		  }
		  
   	    });
   	    calendar.render();	

let getHehyeopEvents = async (date) => {
	console.dir(date);
	let response = await fetch('/management/get-events?date=' + date);
	let datas = await response.json();
	
	let event = calendar.getEvents();
	event.forEach(function(e) {
		e.remove();
	});
	
	calendar.addEventSource({
		events: datas
	})
}

//new Date() 년/월 기준으로 fetch보내기
(async function() {
	
	let today = new Date();
	let month = today.getFullYear() + '-' + (today.getMonth()+1);
	
	await getHehyeopEvents(month);
})();

let modifyPersonal = () => {
	let expIdx = $('.personal_expIdx').val();
	$('.personal_form').attr('action', "/management/personal-spend/modify");
	$('.personal_form').submit();
}

let deletePersonal = () => {
	let expIdx = $('.personal_expIdx').val();
	location.href = '/management/personal-delete?expIdx=' + expIdx;
}

let modifyFixed = () => {
	let expIdx = $('.fixed_expIdx').val();
	$('.fixed_form').attr('action', "/management/fixed-spend/modify");
	$('.fixed_form').submit();
}

let deleteFixed = () => {
	let expIdx = $('.fixed_expIdx').val();
	location.href = "/management/fixed-delete?expIdx=" + expIdx;
}

		$('.date').keydown(function(e) {
			if(e.originalEvent.code != 'Tab') e.preventDefault();
		})


		$(function() {
					$("#date1").datepicker(
							{
								dateFormat : "yy-mm-dd",
								dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
								monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월",
										"7월", "8월", "9월", "10월", "11월", "12월" ],
								monthNamesShort : [ "1월", "2월", "3월", "4월", "5월", "6월",
										"7월", "8월", "9월", "10월", "11월", "12월" ],
								numberOfMonths : 1,
								changeMonth : true,
								showMonthAfterYear : true,
								changeYear : true,
							});
				});

		$(function() {
					$("#date2").datepicker(
							{
								dateFormat : "yy-mm-dd",
								dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
								monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월",
										"7월", "8월", "9월", "10월", "11월", "12월" ],
								monthNamesShort : [ "1월", "2월", "3월", "4월", "5월", "6월",
										"7월", "8월", "9월", "10월", "11월", "12월" ],
								numberOfMonths : 1,
								changeMonth : true,
								showMonthAfterYear : true,
								changeYear : true,
							});
				});

		$(function() {
					$("#date3").datepicker(
							{
								dateFormat : "yy-mm-dd",
								dayNamesMin : [ "일", "월", "화", "수", "목", "금", "토" ],
								monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월",
										"7월", "8월", "9월", "10월", "11월", "12월" ],
								monthNamesShort : [ "1월", "2월", "3월", "4월", "5월", "6월",
										"7월", "8월", "9월", "10월", "11월", "12월" ],
								numberOfMonths : 1,
								changeMonth : true,
								showMonthAfterYear : true,
								changeYear : true,
							});
				});
				
		$(function() {
					let firstDate = new Date();
					firstDate.setDate(1);
					let lastDate = new Date();
					lastDate.setDate(28);
					
					$("#date4").datepicker(
							{
								dateFormat : "dd",
								changeMonth : false,
								showMonthAfterYear : false,
								changeYear : false,
								minDate : firstDate, //캘린더 범위에서 시작 날짜
								maxDate : lastDate
					});
					
					$('#date4').datepicker($.datepicker.regional["ko"]);
					
		});
