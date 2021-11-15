<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<link rel='stylesheet' href="../../../resources/css/include/chat/chat-room.css">
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
</head>
<body>

<div class="room_con">
	<input type="text" id="sender" value="${sessionScope.id}" style="display: none;">
	<div id="back" onclick="closeSocket()"><i class="fas fa-times-circle"></i></div>
	<div class="room_wrap">
		<div class="room_head">
			<img id="room_img" src="../../../resources/image/logo-icon.png" onclick="openSocket()">
			<div id="room_title">김현수, 황륜수, 이호준</div>
		</div>
		
		<div class="room_main">
			<div class="chatting_wrap">
				
				
				<div class="input_wrap">
					<input type="text" id="input_box" placeholder="내용을 입력하세요">
					<div type="button" id="send_btn" onclick="send()"><div><i class="fas fa-paper-plane"></i></div></div>
				</div>
			</div>
		</div>
	</div>
</div>	    
    
    
   
   
   
   
   
    
<!-- websocket javascript -->
<script type="text/javascript">
      var ws;
      var eventMsg = document.querySelector(".event_wrap");
      var senderMsg = document.querySelector("#sender_msg");
      var myMsg = document.querySelector("#my_msg");
      
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
              if(!loc) myResponse(message.substring(1));
              if(loc) senderResponse(message.substring(loc + 1));
              
              //누가 보내도 여기로 온닷
              //eventResponse(event.data);
              
          };
          
          ws.onclose = function(event){
        	  eventResponse("대화 종료");
          }
          
      }
      
      function send(){
          var text = document.getElementById("input_box").value+","+document.getElementById("sender").value;
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
          eventMsg.innerHTML += text+"<br/>";
          chattingWrap.appendChild(eventWrap);
      }
      
      function senderResponse(text){
          let chattingWrap = document.querySelector('.chatting_wrap');
          let senderWrap = document.createElement("div");
          senderWrap.setAttribute("class","sender_wrap");
          chattingWrap.appendChild(senderWrap);
          
          let senderName =  document.createElement("div");
          senderName.setAttribute("id","sender_name");
          senderWrap.appendChild(senderName);
          
          let senderMsg =  document.createElement("div");
          senderName.setAttribute("id","sender_msg");
          senderName.innerHTML = text;
          senderWrap.appendChild(senderMsg);
          
          let sendTime =  document.createElement("div");
          sendTime.setAttribute("id","send_time");
          sendTime.innerHTML = '오후 3:43';
          senderWrap.appendChild(sendTime);
       }
       
       function myResponse(text){
          let chattingWrap = document.querySelector('.chatting_wrap');
          let myWrap = document.createElement("div");
          myWrap.setAttribute("class","my_wrap");
          chattingWrap.appendChild(myWrap);

          let myMsg =  document.createElement("div");
          myMsg.setAttribute("id","my_msg");
          myMsg.innerHTML = text;
          myWrap.appendChild(myMsg);
          
          let sendTime =  document.createElement("div");
          sendTime.setAttribute("id","send_time");
          sendTime.innerHTML = '오후 3:43';
          myWrap.appendChild(sendTime);
       }

</script>
</body>
</html>