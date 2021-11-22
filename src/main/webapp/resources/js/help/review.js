let fieldName = 'all';

function reviewFiltering() {
	let field = $('.filter').val();
	fieldName = field;
	let AreaOn = document.querySelector('.toggle').checked;
	location.href='/help/review?field=' + fieldName +'&myArea=' + AreaOn;
} 


function recomment(e,helpIdx) {
	fetch("/help/review-comments?helpIdx="+helpIdx)
	 .then(response => response.json())
	 .then(commentsList => {
		e.childNodes[1].innerHTML = '';
		
		for(let i=0; i < commentsList.length; i++){
			e.childNodes[1].innerHTML += '<i class="fas fa-check"></i> ' + commentsList[i];
			if(i != commentsList.length-1) e.childNodes[1].innerHTML += '<br>';	
		}
				
		e.childNodes[1].style.display = 'block';
	});
}

function recommentOut(e){
	e.childNodes[1].style.display = 'none'; 
}