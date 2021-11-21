function setPreview(event) {
	let reader = new FileReader();
	let file = event.target.files[0];
	let fileName = event.target.files[0].name;
	let format = fileName.substring(fileName.lastIndexOf('.') + 1);
	let fileLabel = document.querySelector(".upload_label");
	
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
		console.dir(fileName);
		$(".file").append(preview);
		
		fileLabel.innerText = fileName;
	};
	reader.readAsDataURL(file);
}