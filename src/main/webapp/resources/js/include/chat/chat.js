function clickChatting(){
   document.querySelector(".chatting").style.display = "none";
   document.querySelector(".chatting2").style.display = "flex";
   document.getElementById("frogue-container").style.display = "flex";
} 

async function clickChatting2() {
   let viewChat = document.getElementById("chatting_main");
   let viewChatRoom = document.querySelector("#chattingRoom");
   
   if(viewChat.style.display == "none") {
      let success = await getChattingList();
      if(!success) return;
      
      viewChat.style.display = "flex";
   }else {
      viewChat.style.display = "none";
   }
   
   if(document.querySelector('body').classList.contains('frogue-opened')) {
      return;
   }
   if (viewChatRoom.style.display == "flex"){
      return;
   }
   
}

let getChattingList = async () => {
   let success = true;
   try{
      let response = await fetch('/chat/chat-room');
      if(!response.ok) throw new Error();
      let datas = await response.json();
      
      await createList(datas);
      
      console.log(JSON.stringify(datas));
   } catch(e) {
      success = false;
      window.alert('로그인 전 채팅 이용이 불가능합니다.');
   }
   return success;
}

let createList = async (data) => {
   document.getElementById('myList').innerHTML = '';
   
   //let unreadList = data.unread;
   //let readList = data.read;
   
   appendList(data.unread, 'unread');
   appendList(data.read, 'read');
   
   /*for (var i = 0; i < data.length; i++) {
      let chatItem = document.createElement("div");
      chatItem.setAttribute('id','chatItem');
      let chatItemTitle = document.createElement("div");
      chatItemTitle.setAttribute('id','chatItemTitle');
      chatItem.appendChild(chatItemTitle);
      let chatAlarm = documnet.createElement("div");
      chatAlarm.setAttribute
      let chatItemBtn = document.createElement("div");
      chatItemBtn.setAttribute('id','chatItemBtn');
      chatItemBtn.innerHTML = '입장';
      chatItem.appendChild(chatItemBtn);
      
      chatItemBtn.setAttribute('data-room-no', data[i].roomNo);
      chatItemTitle.innerHTML = data[i].roomName;
      
      chatItemBtn.addEventListener('click', function(e) {
         document.getElementById("chatting_main").style.display = "none";
         document.querySelector("#chattingRoom").style.display = "flex";
         document.getElementById('chattingRoom').contentWindow.openSocket(e.target.dataset.roomNo);
      }) 
      
      let myList = document.getElementById('myList');
      myList.appendChild(chatItem);
   }*/
}

let appendList = async (data, status) => {

	console.dir(data);
	console.dir(status);
	for (var i = 0; i < data.length; i++) {
		let chatItem = document.createElement("div");
		chatItem.setAttribute('id','chatItem');
		let chatItemTitle = document.createElement("div");
		chatItemTitle.setAttribute('id','chatItemTitle');
		chatItem.appendChild(chatItemTitle);
		let chatAlarm = document.createElement("div");
		chatAlarm.innerHTML = 'new';
		chatAlarm.setAttribute('id', 'chatAlarm');
		chatAlarm.setAttribute('class', status);
		chatItem.appendChild(chatAlarm);
		let chatItemBtn = document.createElement("div");
		chatItemBtn.setAttribute('id','chatItemBtn');
		chatItemBtn.innerHTML = '입장';
		chatItem.appendChild(chatItemBtn);
		
		chatItemBtn.setAttribute('data-room-no', data[i].roomNo);
		chatItemTitle.innerHTML = data[i].roomName;
		
		chatItemBtn.addEventListener('click', function(e) {
			document.getElementById("chatting_main").style.display = "none";
			document.querySelector("#chattingRoom").style.display = "flex";
			document.getElementById('chattingRoom').contentWindow.openSocket(e.target.dataset.roomNo);
			
			 fetch('/chat/chat-log?roomNo=' + e.target.dataset.roomNo)
	         .then(response => response.text())
			 .then(text => {
				let logData = text;
				let objDiv = document.getElementById('chattingRoom').contentWindow.document.querySelector(".chatting_wrap");
				objDiv.innerHTML = logData;
				objDiv.scrollTop = objDiv.scrollHeight;
				})
				
				
		}) 
		
		let myList = document.getElementById('myList');
		myList.appendChild(chatItem);
	}
}

function closeChat(){
   let viewChat = document.getElementById("chatting_main");
   if (viewChat.style.display == "flex"){
      viewChat.style.display = "none";
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