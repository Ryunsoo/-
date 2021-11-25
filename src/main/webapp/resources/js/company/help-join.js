$('input[type=datetime-local]').click(e => {
	let today = new Date();
	
	let year = today.getFullYear();
	let month = getTwoDigitDateData(today.getMonth() + 1);
	let date = getTwoDigitDateData(today.getDate());
	
	let hour = getTwoDigitDateData(today.getHours());
	let minute = getTwoDigitDateData(today.getMinutes());
	
	let todayStr = year + '-' + month + '-' + date + 'T' + hour + ':' + minute;
	$('input[type=datetime-local]').attr('min', todayStr);
});

let getTwoDigitDateData = (data) => {
	data = data < 10 ? '0' + data : data;
	return data;
}
