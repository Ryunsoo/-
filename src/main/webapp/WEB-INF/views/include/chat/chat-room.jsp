<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>

<script type="text/javascript" src="../../../resources/js/include/modal/init-modal.js"></script>
<link rel='stylesheet' href="../../../resources/css/include/modal/modal.css">
<link rel='stylesheet' href="../../../resources/css/include/chat/chat-room.css">
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<div id='modal'></div>
<div class="room_con">
	<input type="text" id="sender" value="${sessionScope.id}" style="display: none;">
	<div id="back" onclick="closeSocket()"><i class="fas fa-times-circle"></i></div>
	<div id="plusBtn" onclick="openMemberList()"><i class="far fa-bars"></i></div>
	<div id="chatting_menu" style="display:none">

		<div id="memberList"></div>

		<div id="rename" onclick="renameModal()"><div>채팅방 이름변경</div></div>

		<div id="out" onclick="outChatting()"><div>채팅방 나가기</div></div>
	</div>
	<div class="room_wrap">
		<div class="room_head">
			<img id="room_img" src="../../../resources/image/logo-icon.png">
			<div id="room_title"></div>
		</div>
		
		<div class="room_main">
			<div class="chatting_wrap"></div>
			<div class="input_wrap">
				<input type="text" id="input_box" placeholder="내용을 입력하세요" autocomplete="off">
				<div type="button" id="send_btn" onclick="send()"><div><i class="fas fa-paper-plane"></i></div></div>
			</div>
		</div>
	</div>
</div>	   
</body>
<script type="text/javascript" src="../../../resources/js/include/chat/chat-room.js"></script>
</html>