<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<link rel='stylesheet' href="../../../resources/css/include/chat/chat-room.css">
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
</head>
<body>
<%--     <div>
        <button type="button" onclick="openSocket();">대화방 참여</button>
        <button type="button" onclick="closeSocket();">대회방 나가기</button>
    	<br/><br/><br/>
  		메세지 입력 : 
        <input type="text" id="sender" value="${sessionScope.id}" style="display: none;">
        <input type="text" id="messageinput">
        <button type="button" onclick="send();">메세지 전송</button>
    </div>
    <!-- Server responses get written here -->
    <div id="messages">
    </div>
--%>

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
				
				<!-- 이벤트 발생 채팅 -->
				<div class="event_wrap"></div>
			
				<!-- 상대방 채팅 -->
				<div class="sender_wrap">
					<div id="sender_name">홍길동</div>
					<div id="sender_msg">
						
						반가워요!!!!!!!
						
						<span id="sender_msg_tail"></span>
					</div>
					<div id="send_time">오후 3:43</div>
				</div>	
				
				<!-- 내 채팅 -->
				<div class="my_wrap">
					<div id="my_msg">
						
						길게쓰면 어떻게 될까요오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오
						
						<span id="my_msg_tail"></span>
					</div>
					<div id="send_time">오후 3:43</div>
				</div>		
				<!-- 내 채팅 -->
				<div class="my_wrap">
					<div id="my_msg">
						
						길게쓰면 어떻게 될까요오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오
						
						<span id="my_msg_tail"></span>
					</div>
					<div id="send_time">오후 3:43</div>
				</div>		
				<!-- 내 채팅 -->
				<div class="my_wrap">
					<div id="my_msg">
						
						길게쓰면 어떻게 될까요오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오
						
						<span id="my_msg_tail"></span>
					</div>
					<div id="send_time">오후 3:43</div>
				</div>		
				<!-- 내 채팅 -->
				<div class="my_wrap">
					<div id="my_msg">
						
						길게쓰면 어떻게 될까요오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오
						
						<span id="my_msg_tail"></span>
					</div>
					<div id="send_time">오후 3:43</div>
				</div>		
				<!-- 내 채팅 -->
				<div class="my_wrap">
					<div id="my_msg">
						
						길게쓰면 어떻게 될까요오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오
						
						<span id="my_msg_tail"></span>
					</div>
					<div id="send_time">오후 3:43</div>
				</div>		
				<!-- 내 채팅 -->
				<div class="my_wrap">
					<div id="my_msg">
						
						길게쓰면 어떻게 될까요오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오오
						
						<span id="my_msg_tail"></span>
					</div>
					<div id="send_time">오후 3:43</div>
				</div>		
				
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
              eventResponse(event.data);
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
          eventMsg.innerHTML += text+"<br/>";
      }
      
      function senderResponse(text){
          senderMsg.innerHTML += text;
      }
      
      function myResponse(text){
          myMsg.innerHTML += text;
      }

</script>
</body>
</html>