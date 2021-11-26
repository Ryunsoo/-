let fileName = document.querySelector('.fileList').innerText;
console.dir(fileName);
let format = fileName.substring(fileName.lastIndexOf('.') + 1);
let viewer;

$(function() {
	if(format == 'pdf') {
		viewer = $('<iframe></iframe>');
	}else {
		viewer = $('<img>')
	}
	viewer.attr("src", fileName)
			.height('100%').width('100%')
			.css("object-fit", "contain");
	$(".file").append(viewer);	
	
})

$('.expand>i').click(function() {
	viewer.attr("src", fileName);
	$('.content_left').height('680px').width('540px')
	$('.file').height('608px').width('430px')
			.css('margin-top', '0px');
	$('.expand').css('display', 'none');
	$('.reduce').css('display', 'flex');
})

$('.reduce>i').click(function() {
	viewer.attr("src", fileName);
	$('.content_left').height('100%').width('400px');
	$('.file').height('495px').width('350px')
			.css('margin-top', '30px');
	$('.expand').css('display', 'flex');
	$('.reduce').css('display', 'none');
})