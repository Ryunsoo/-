let createReviewModal = (reqIdx) => {
	let score = 2.5;
	let comment = [];
	let sendModal = initModal('modal', 2);
	appendTitle(sendModal, '서비스 후기', true);
	setButton(sendModal, '확인');
	setContent(sendModal, true, true);
	
	let rating = $('<div>').height('80px')
					.addClass('rating');
	
	//별이 그려지는 div
	for(let i = 1; i < 6; i++) {
		let backDiv = $('<div>').addClass('back_star').width('64px').height('100%').attr('data-star', i * 1);
		let star;
		
		if(i <= 2) {
			star = $('<i class="fas fa-star"></i>');
		}else if(i == 3) {
			star = $('<i class="fas fa-star-half-alt"></i>');
		}
		backDiv.append(star);
		rating.append(backDiv);
	}
	
	//미리 보이는 별 테두리
	let middleRating = $('<div>').height('80px')
						.addClass('middle_rating');
	
	for(let i = 1; i < 6; i++) {
		let middleDiv = $('<div>').addClass('front_star').width('64px').height('100%');
		let star = $('<i class="far fa-star"></i>');
		middleDiv.append(star);
		middleRating.append(middleDiv);
	}
	rating.append(middleRating);
	
	let frontRating = $('<div>').height('80px')
						.addClass('front_rating');
	
	for(let i = 1; i < 11; i++) {
		let frontDiv = $('<div>').addClass('click_div').width('32px').height('100%').attr('data-score', i * 0.5);
		frontRating.append(frontDiv);
	}
	
	rating.append(frontRating);
	
	$('.modal_content').append(rating);
	
	let selectWrap = $('<div>').height('240px').addClass('modal_select_wrapper');
	
	selectWrap.append($('<div data-value="친절"><i class="fas fa-check"></i> 친절해요</div>').addClass('select_text'))
				.append($('<div data-value="신속"><i class="fas fa-check"></i> 신속해요</div>').addClass('select_text'))
				.append($('<div data-value="안전"><i class="fas fa-check"></i> 안전해요</div>').addClass('select_text'))
				.append($('<div data-value="전문"><i class="fas fa-check"></i> 전문적이에요</div>').addClass('select_text'))
				.append($('<div data-value="시간"><i class="fas fa-check"></i> 시간을 잘 지켜요</div>').addClass('select_text'))
				.append($('<div data-value="비용"><i class="fas fa-check"></i> 비용이 합리적이에요</div>').addClass('select_text'))
	
	$('.modal_content').append(selectWrap);
	
	
	modalBlock();
	
	$('.click_div').click(function(e) {
		document.querySelectorAll('.back_star').forEach(el => {
			el.innerHTML = '';
		})
		
		score = e.target.dataset.score;
		
		document.querySelectorAll('.back_star').forEach(el => {
			let star = el.dataset.star;
			console.dir('score : ' + score);
			console.dir('star : ' + star);
			
			if(star < score) {
				el.innerHTML = '<i class="fas fa-star"></i>';
			}
			
			if(star == (Number(score) + 0.5)) {
				el.innerHTML = '<i class="fas fa-star-half-alt"></i>';
			}
			
			if(star == score) {
				el.innerHTML = '<i class="fas fa-star"></i>';
			}
		})
	})
	
	$('.select_text').click(function(e) {
		if(!$(this).hasClass('selected_review')) {
			$(this).addClass('selected_review');
		}else if($(this).hasClass('selected_review')) {
			$(this).removeClass('selected_review');
		}
	})
	
	$('.modal_left_btn').click(function() {
		//let score 별점
		//let coment 후기코멘트
		document.querySelectorAll(".selected_review").forEach(e => {
			comment.push(e.dataset.value);
		})
		location.href = '/help/registReview?reqIdx='+reqIdx+'&score='+score+'&comment='+comment;
		modalNone();
	})

	/*let makeArray = (comment) => {
		document.querySelectorAll(".selected_review").forEach(e => {
			comment.push(e.dataset.value);
		})
	}*/
}