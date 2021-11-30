let CateName = 'all';
let date = "";

function searchfilter() {
	let cate = $('.personal_category').val();
	CateName = cate;
	
	let yChecked = $('input:radio[name=year]').is(":checked");
	if(yChecked) {
		date = $('.calendar').val();
	}else {
		date = $('.calendar1').val();
	}
	location.href='/management/myAccountList?cate=' + CateName +'&period=' + date;
}

$(document).ready(function() {
	var tdate = new Date();
	var tyear = tdate.getFullYear();
	$('#y1').attr('value',tyear);
	$('#y1').html(tyear);
	$('#y2').attr('value',tyear-1);
	$('#y2').html(tyear-1);
	$('#y3').attr('value',tyear-2);
	$('#y3').html(tyear-2);
	$('#y4').attr('value',tyear-3);
	$('#y4').html(tyear-3);
	
});

$(document).ready(function(){
    $("#thismonth").datepicker({
            closeText : "닫기",
            prevText : "이전달",
            nextText : "다음달",
            currentText : "현재",
            changeMonth: true,
            changeYear: true,
            monthNames : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
            monthNamesShort : [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
            dateFormat: 'yy-mm',
            changeMonth: true,
            changeYear: true,
            showButtonPanel: true,
            maxDate: 0,
            minDate: '-3y',

        onClose: function(dateText, inst) {
            var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
            var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
            $(this).val($.datepicker.formatDate('yy-mm', new Date(year, month, 1)));
        }
    });
    $("#thismonth").focus(function () {
        $(".ui-datepicker-calendar").hide();
        $("#ui-datepicker-div").position({
            my: "center top",
            at: "center bottom",
            of: $(this)
        });
    });
});
//현재 월 기본값으로 표시
document.getElementById('thismonth').value= new Date().toISOString().slice(0, 7)

let showYear = () => {
	$('#thismonth').attr('style','display:none');
	$('#thisyear').attr('style','display:block');
}
let showMonth = () => {
	$('#thisyear').attr('style','display:none');
	$('#thismonth').attr('style','display:block');
}