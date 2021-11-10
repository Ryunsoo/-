function setPreview(event) {
	let reader = new FileReader();
	let file = event.target.files[0];
	let fileName = event.target.value;
	let format = fileName.substring(fileName.lastIndexOf('.') + 1);
	$('.file').html('');
	
	reader.onload = function(e) {
		let preview;
		if(format == 'pdf') {
			preview = $('<iframe></iframe>');
		}else {
			preview = $('<img>')
		}
		
		preview.attr("src", e.target.result)
				.height('100%').width('100%')
				.css("object-fit", "contain");
		console.dir(preview);
		$(".file").append(preview);
	};
	reader.readAsDataURL(file);
}