        const go = document.querySelector("#go");
        const bg = document.querySelector("#bg");
        const popup = document.querySelector("#popup");
        const exit = document.querySelector("#exit");
        let prevDate;
     	let nowDate;

        go.addEventListener("mouseover",function(){
            bg.classList.remove("hidden");
            popup.classList.remove("hidden");
        });
        go.addEventListener("mouseout",function(){
            bg.classList.add("hidden");
            popup.classList.add("hidden");
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
	
	console.dir(personal);
	if(personal == true){
		$('#date1').val(date);
		document.getElementById("personal_hidden").style.display ="flex";
		document.getElementById("fixed_hidden").style.display ="none";
	}else{
		$('#date2').val(date);
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
		  
		  
   	    });
   	    calendar.render();	

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
								defaultDate : "+1w",
								numberOfMonths : 1,
								changeMonth : true,
								showMonthAfterYear : true,
								changeYear : true,
								minDate : +1, //캘린더 범위에서 시작 날짜
								maxDate : "+2M +5D"
		
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
								defaultDate : "+1w",
								numberOfMonths : 1,
								changeMonth : true,
								showMonthAfterYear : true,
								changeYear : true,
								minDate : +1, //캘린더 범위에서 시작 날짜
								maxDate : "+2M +5D"
		
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
								defaultDate : "+1w",
								numberOfMonths : 1,
								changeMonth : true,
								showMonthAfterYear : true,
								changeYear : true,
								minDate : +1, //캘린더 범위에서 시작 날짜
								maxDate : "+2M +5D"
		
							});
				});
