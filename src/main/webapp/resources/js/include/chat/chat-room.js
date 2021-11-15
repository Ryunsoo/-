  var objDiv = document.querySelector(".chatting_wrap"); 
  var ws;
  
  function openSocket(){
      if(ws !== undefined && ws.readyState !== WebSocket.CLOSED ){
          writeResponse("WebSocket is already opened.");
          return;
      }
      //웹소켓 객체 만드는 코드
      ws = new WebSocket("ws://localhost:9090/echo.do");
      
      ws.onopen = function(event){
          if(event.data === undefined){
        		return;
          }
          eventResponse(event.data);
      };
      
      ws.onmessage = function(event){
          console.log('writeResponse');
          console.log(event.data);
          let message = event.data;
          let loc = message.indexOf(':');
          console.dir(typeof(loc));
          if(loc < 0) {
        	  eventResponse(message);
          }else if(!loc) {
        	  myResponse(message.substring(1));
          }else {
        	  senderResponse(message.substring(0, loc-1),message.substring(loc + 1));
          }
      };
      
      ws.onclose = function(event){
    	  eventResponse("대화 종료");
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
	  if(inputText.replace(/\s|　/gi, "").length != 0) {
		  var text = document.getElementById("input_box").value+","+document.getElementById("sender").value; 
	  } else {
		  return;
	  }
      ws.send(text);
      document.getElementById("input_box").value = "";
      text = "";
  }
  
  function closeSocket(){
      ws.close();
  }
  
  function eventResponse(text){
	  let chattingWrap = document.querySelector('.chatting_wrap');
      let eventWrap = document.createElement("div");
      eventWrap.setAttribute("class","event_wrap");
      eventWrap.innerHTML = text+"<br>";
      chattingWrap.appendChild(eventWrap);
      objDiv.scrollTop = objDiv.scrollHeight;
  }
  
  function senderResponse(sender,text){
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
      sendTime.innerHTML = '오후 3:43';
      senderWrap.appendChild(sendTime);
      objDiv.scrollTop = objDiv.scrollHeight;
   }
   
   function myResponse(text){
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
      sendTime.innerHTML = '오후 3:43';
      myWrap.appendChild(sendTime);
      objDiv.scrollTop = objDiv.scrollHeight;
   }
