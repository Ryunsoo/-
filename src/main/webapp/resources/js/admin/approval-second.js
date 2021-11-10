$('.edit_field>button').click(function(e) {
	if(!$('.edit_field').hasClass('editing')) {
		$('.edit_field').addClass('editing');
		e.target.innerHTML = '완료';
		$('.content_right').css('z-index', '20');
	} else{
		$('.edit_field').removeClass('editing');
		e.target.innerHTML = '수정';
		$('.content_right').css('z-index', '-5');
	}
})
