function clickChatting(){
	document.querySelector(".chatting").style.display = "none";
	document.querySelector(".chatting2").style.display = "flex";
	document.getElementById("frogue-container").style.display = "flex";
} 

function clickChatting2(){
	let viewChat = document.getElementById("chatting_main");
	if(document.querySelector('body').classList.contains('frogue-opened')) {
		return;
	}
	if (viewChat.style.display == "none"){
		viewChat.style.display = "flex";
	}else {
		viewChat.style.display = "none";
	}
}

function closeChat(){
	let viewChat = document.getElementById("chatting_main");
	if (viewChat.style.display == "flex"){
		viewChat.style.display = "none";
	}
}

(function(d, s, id){
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) {return;}
    js = d.createElement(s); js.id = id;
    js.src = "https:\/\/danbee.ai/js/plugins/frogue-embed/frogue-embed.min.js";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'frogue-embed'));