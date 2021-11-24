function searchArea(){
	
	let area = $('.area').val();
	if(!area) area = null; 
	
	location.href = '/company/main?area=' + area;	
}