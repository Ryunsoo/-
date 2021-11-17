  var objDiv = document.querySelector(".chatting_wrap"); 
  var ws;
  let room;
  
  function openSocket(roomNo){
      if(ws !== undefined && ws.readyState !== WebSocket.CLOSED ){
          //writeResponse("WebSocket is already opened.");
          return;
      }
      room = roomNo;
      //웹소켓 객체 만드는 코드
      ws = new WebSocket("ws://localhost:9090/chat.echo/" + roomNo);
      
      ws.onopen = function(event){
		  
		  
          if(event.data === undefined){
        		return;
          }
          eventResponse(event.data);
  	  };
  
      
      ws.onmessage = function(event){
		  let now = new Date();
		  let hour = now.getHours();
		  let minute = now.getMinutes();
		  let ampm;
		  if(hour < 12) {
			  ampm = '오전';
		  }else {
			  ampm = '오후';
			  hour = hour == 12 ? hour : hour - 12;
		  }
		  let timeText = ampm + ' ' + hour + ':' + minute;
		  
          let message = event.data;
          let loc = message.indexOf(':');
          if(loc < 0) {
        	  eventResponse(message);
          }else if(!loc) {
        	  myResponse(message.substring(1), timeText);
          }else {
        	  senderResponse(message.substring(0, loc-1), message.substring(loc + 1), timeText);
          }
      };
      
      ws.onclose = function(event){
		//채팅방 나가는 시간 업데이트
		let response = fetch('/chat/update-exit?roomNo=' + room);
		
		//안에 내용을 초기화해주기
		document.querySelector('.chatting_wrap').innerHTML = '';
      }
      
  }
  
  document.getElementById("input_box").addEventListener('keypress', function(event) {
	    console.dir("나 잘 탔어!!");
        if (event.keyCode == 13) {
	    	console.dir("나도 잘 탔어!!");
			send();
	    }
  })
  
  
  function send(){
	  let inputText = document.getElementById("input_box").value;
	  let text;
	  if(inputText.replace(/\s|　/gi, "").length != 0) {
		  let content = document.getElementById("input_box").value;
		  let sender = document.getElementById("sender").value;
		  
		  let json = {
				content: content,
				sender: sender,
				roomNo : room
		  };
		  text = JSON.stringify(json);
	  } else {
		  return;
	  }
      ws.send(text);
      document.getElementById("input_box").value = "";
      text = "";
  }
  
  window.addEventListener('beforeunload', function(event) {
	 closeSocket();
  })
  
  function closeSocket(){
	  document.getElementById('chatting_menu').style.display = "none";
      ws.close();
      parent.closeIframe();
  }
  
  function outChatting(){
	//0. 확인절차
	if(window.confirm("채팅방을 나가시겠습니까?")){
		//1. 채팅방나가기 => fetch 로 방번호 줘서 chat_room 테이블에서 지우기
		fetch('/chat/exit-room?roomNo=' + room)
		.then(response => {
			return response.text();
		}).then(text => {
			if(text == 'success'){
				alert("채팅방나가기를 완료하였습니다.");
			}
		})	
	}
	closeSocket();
  }
  
 async function openMemberList(){
	let memberList = document.getElementById('chatting_menu');
	if(memberList.style.display == "none") {
		let success = await getMemberList();
		if(!success) return;
		memberList.style.display = "block";
	}else {
		memberList.style.display = "none";
		console.dir("왜")
	}
  }
  
  let getMemberList = async () => {
   let success = true;
   try{
      let response = await fetch('/chat/chat-room-member?roomNo=' + room);
      if(!response.ok) throw new Error();
      let datas = await response.json();
      await createMemberList(datas);
      console.log(JSON.stringify(datas));
   } catch(e) {
      success = false;
   }
   return success;
}

let createMemberList = async (data) => {
	let memberList = document.querySelector("#memberList");
	memberList.innerHTML = "";
	for(var i = 0; i < data.length; i++) {
		let memberWrap = document.createElement("div");
		memberWrap.setAttribute('id','member_wrap');
		memberList.appendChild(memberWrap);
		let member = document.createElement("div");
		member.setAttribute('id','member');
		member.innerHTML = data[i];
		memberWrap.appendChild(member);
		let plusFriend = document.createElement("div");
		plusFriend.innerHTML = '<i class="fas fa-user-plus"></i>';
		plusFriend.setAttribute('id', 'plusFriend');
		memberWrap.appendChild(plusFriend);
		plusFriend.addEventListener('click', e => {
			plusFriendModal(member.innerHTML);
		})
	}
}

let plusFriendModal = (friendName) => {
	modalNone();
	let modal = initModal('modal', 5);
	appendTitle(modal,'친구추가');
	
	setButton(modal,'그만두기','친구추가');
	setContent(modal,true,true);
	let modalBody = $('<div>'+friendName+'님을 추가 하시겠습니까?<div>').height('10px').css("margin",'0 20px 0 20px');
	$('.modal_content').append(modalBody);
	modalBlock();
	
	$('.modal_left_btn').click(function() {
		modalNone();
	})
	$('.modal_right_btn').click(async function() {
		let state = await friendFetch(friendName);
		if(state == 'available') {
			modalNone();
			let modal = initModal('modal', 5);
			appendTitle(modal,'친구추가');
			setButton(modal,'확 인');
			setContent(modal,true,true);
			let modalBody = $('<div>친구추가 성공<div>').height('10px').css("margin",'0 20px 0 20px');
			$('.modal_content').append(modalBody);
			modalBlock();
			$('.modal_left_btn').click(function() {
				modalNone();
			})
		}else if(state == "disable") {
			modalNone();
			let modal = initModal('modal', 5);
			appendTitle(modal,'친구추가');
			setButton(modal,'확 인');
			setContent(modal,true,true);
			let modalBody = $('<div>친구추가 실패<div>').height('10px').css("margin",'0 20px 0 20px');
			$('.modal_content').append(modalBody);
			modalBlock();
			$('.modal_left_btn').click(function() {
				modalNone();
			})
		}else if(state == "exist") {
			modalNone();
			let modal = initModal('modal', 5);
			appendTitle(modal,'친구추가');
			setButton(modal,'확 인');
			setContent(modal,true,true);
			let modalBody = $('<div>이미 친구입니다.<div>').height('10px').css("margin",'0 20px 0 20px');
			$('.modal_content').append(modalBody);
			modalBlock();
			$('.modal_left_btn').click(function() {
				modalNone();
			})
		}
	})
	
}

let friendFetch = async (friendName) => {
   let state = 'available';
   try{
      let response = await fetch('/chat/chat-room-addFriend?nickname=' + friendName);
      if(!response.ok) throw new Error();
      let data = await response.text();
      if(data == 'fail') {
		state = 'disable';	
	  } else if(data == "exist") {
		state = 'exist';
	}
   } catch(e) {
      status = 'disable';
   }
   return state;
}

  function eventResponse(text){
	  let chattingWrap = document.querySelector('.chatting_wrap');
      let eventWrap = document.createElement("div");
      eventWrap.setAttribute("class","event_wrap");
      eventWrap.innerHTML = text+"<br>";
      chattingWrap.appendChild(eventWrap);
      objDiv.scrollTop = objDiv.scrollHeight;
      chatSave();
  }
  
  function senderResponse(sender, text, time){
      let chattingWrap = document.querySelector('.chatting_wrap');
      let senderWrap = document.createElement("div");
      senderWrap.setAttribute("class","sender_wrap");
      chattingWrap.appendChild(senderWrap);
      
      let senderName =  document.createElement("div");
      senderName.setAttribute("id","sender_name");
      senderName.innerHTML = sender;
      senderWrap.appendChild(senderName);
      
      let senderMsg =  document.createElement("div");
      senderMsg.setAttribute("id","sender_msg");
      senderMsg.innerHTML = text + '<span id="sender_msg_tail"></span>';
      senderWrap.appendChild(senderMsg);
      
      let sendTime =  document.createElement("div");
      sendTime.setAttribute("id","send_time");
      sendTime.innerHTML = time;
      senderWrap.appendChild(sendTime);
      objDiv.scrollTop = objDiv.scrollHeight;
      chatSave();
   }
   
   function myResponse(text, time){
      let chattingWrap = document.querySelector('.chatting_wrap');
      let myWrap = document.createElement("div");
      myWrap.setAttribute("class","my_wrap");
      chattingWrap.appendChild(myWrap);

      let myMsg =  document.createElement("div");
      myMsg.setAttribute("id","my_msg");
      myMsg.innerHTML = text + '<span id="my_msg_tail"></span>';
      myWrap.appendChild(myMsg);
      
      let sendTime =  document.createElement("div");
      sendTime.setAttribute("id","send_time");
      sendTime.innerHTML = time;
      myWrap.appendChild(sendTime);
      objDiv.scrollTop = objDiv.scrollHeight;
      chatSave();
   }
   
   let chatSave = () => {
		let chatLog = document.querySelector('.chatting_wrap').innerHTML;
		let header = new Headers({
			'Content-Type': 'application/json'
		});
		
		let init = { 
					 method: 'POST',
					 headers: header,
					 body: JSON.stringify({
								room: room,
								chatLog: chatLog
							})
					}
		
		let saveRequest = new Request('/chat/chat-save', init);
		let response = fetch(saveRequest);
   }
   
   let renameModal = () => {
	modalNone();
	let modal = initModal('modal', 5);
	appendTitle(modal,'채팅방 이름변경하기');
	setButton(modal,'그만두기','변경하기');
	setContent(modal,true,true);
	
	let ModalBody = $('<div>');
	$('.modal_content').append(ModalBody); 
	
	let renameBody = $('<div>').addClass('rename_modal_body');
	let renameInput = $('<div>').height('30px').attr('maxlength', '30');
	let renameInputBox = $('<input id="roomName" name="roomName">').attr('placeholder','이름을 입력하세요');
	ModalBody.append(renameBody);
	renameBody.append(renameInput);
	renameInput.append(renameInputBox);
 	modalBlock();
 		
 		$('.modal_right_btn').click(function() {
			let newName = $('#roomName').val();
			
			if(!newName) {
				alert("변경하실 채팅방 이름을 입력해주세요.");
				return;
			}
			
			let header = new Headers({
				'Content-Type': 'application/json'
			});
			
			let init = { 
						 method: 'POST',
						 headers: header,
						 body: newName
						}
			
			let saveRequest = new Request('/chat/rename-room?roomNo=' + room, init);
			fetch(saveRequest).then(response => {
				return response.text();
			}).then(text => {
				if(text == 'success'){
					alert("채팅방 이름이 변경되었습니다.");
				}
			})	
			
			$('#room_title').html(newName);
			modalNone();
		})
 	
	 	$('.modal_left_btn').click(function() {
			modalNone();
		})
	}
