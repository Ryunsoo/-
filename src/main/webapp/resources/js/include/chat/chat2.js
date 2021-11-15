function clickChatting(){
	let viewChat = document.getElementById("chatting_main");
	let viewChatRoom = document.querySelector("#chattingRoom");
	if(document.querySelector('body').classList.contains('frogue-opened')) {
		return;
	}
	if (viewChatRoom.style.display == "flex"){
		viewChatRoom.style.display = "none";
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
	if (viewChatRoom.style.display == "flex"){
		viewChatRoom.style.display = "none";
	}
}

function openChattingRoom() {
	document.querySelector("#chattingRoom").style.display = "block";
	document.getElementById("chatting_main").style.display = "none";
}