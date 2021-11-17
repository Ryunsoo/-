async function clickChatting() {
   let viewChat = document.getElementById("chatting_main");
   let viewChatRoom = document.querySelector("#chattingRoom");
   
   if(viewChat.style.display == "none") {
	  if(viewChatRoom.style.display == 'flex') return;
	  
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
      
      //console.log(JSON.stringify(datas));
   } catch(e) {
      success = false;
      window.alert('로그인 전 채팅 이용이 불가능합니다.');
   }
   return success;
}

let createList = async (data) => {
	document.getElementById('myList').innerHTML = '';
	
	appendList(data.unread, 'unread');
	appendList(data.read, 'read');
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
				let children = objDiv.children;
				console.dir(children);
				
				let myId = document.querySelector('#sender_id').value;
				console.dir(myId);
				
				for(let i = 0; i < children.length; i++) {
					let child = children[i];
					
					if(child.className == 'event_wrap') {
						console.dir('event_wrap');
						continue;
					}
					
					if(child.dataset.senderId == myId) {
						child.className = 'my_wrap';
						child.children[0].id = 'my_name';
						child.children[0].innerHTML = '';
						console.dir(child.children[1]);
						child.children[1].id = 'my_msg';
						child.children[1].children[0].id = 'my_msg_tail';
					}else {
						child.className = 'sender_wrap';
						child.children[0].id = 'sender_name';
						child.children[0].innerHTML = child.dataset.senderNick;
						console.dir(child.children[1]);
						child.children[1].id = 'sender_msg';
						child.children[1].children[0].id = 'sender_msg_tail';
					}
				}
				
				objDiv.scrollTop = objDiv.scrollHeight;
				})
				
				let nameDiv = document.getElementById('chattingRoom').contentWindow.document.querySelector("#room_title");
				let roomName = e.target.parentNode.firstChild.innerHTML;
				nameDiv.innerHTML = roomName;
				
		}) 
		
		let myList = document.getElementById('myList');
		myList.appendChild(chatItem);
	}
}

function openChattingRoom() {
   document.querySelector("#chattingRoom").style.display = "flex";
   document.getElementById("chatting_main").style.display = "none";
}

function closeIframe() {
   document.querySelector("#chattingRoom").style.display = "none";
}