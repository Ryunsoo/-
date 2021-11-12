function clickChatting(){
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
