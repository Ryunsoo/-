function clickChatting(){
	document.querySelector(".chatting").style.display = "none";
	document.querySelector(".chatting2").style.display = "flex";
	document.getElementById("frogue-container").style.display = "flex";
} 

let clickChatting2 = async () => {
	await getChattingList();
	
	console.dir('${chatLog.roomNo}');
	
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

let getChattingList = async () => {
	let datas = await 
	fetch('/chat/chat-room')
   		 .then(function(response) {
   		 return response.json();
         })
         .then(function(myJson) {
		 console.log("우와");
 		 console.log(JSON.stringify(myJson));
	     }); 
}

function closeChat(){
	let viewChat = document.getElementById("chatting_main");
	let viewChatRoom = document.querySelector("#chattingRoom");
	if (viewChat.style.display == "flex"){
		viewChat.style.display = "none";
	}
	if (viewChatRoom.style.display == "flex"){
		viewChatRoom.style.display = "none";
	}
}

function openChattingRoom() {
	document.querySelector("#chattingRoom").style.display = "flex";
	document.getElementById("chatting_main").style.display = "none";
}

function closeIframe() {
	document.querySelector("#chattingRoom").style.display = "none";
}

(function(d, s, id){
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) {return;}
    js = d.createElement(s); js.id = id;
    js.src = "https:\/\/danbee.ai/js/plugins/frogue-embed/frogue-embed.min.js";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'frogue-embed'));