  var objDiv = document.querySelector(".chatting_wrap"); 
  var ws;
  let room;
  
  function openSocket(roomNo){
      if(ws !== undefined && ws.readyState !== WebSocket.CLOSED ){
          writeResponse("WebSocket is already opened.");
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
		  if(hour < 11) {
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
      ws.close();
      parent.closeIframe();
  }
  
  function outChatting(){
	
  }
  
  function openMemberList(){
	let memberList = document.getElementById('memberList');
	if(memberList.style.display = "none") {
		memberList.style.display = "flex";
	}else {
		memberList.style.display = "none";
		console.dir("왜")
	}
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
