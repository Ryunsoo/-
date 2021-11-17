<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="chatting_main" style="display: none;">
	<div id="chatting_title">
		<img src="../../../resources/image/chatting.png">
		<div>채 팅 해 협</div>
	</div>
	<div id="chatting_list">
		<p>채팅방 목록</p>
		<div id="myList">
		</div>
	</div>
</div>
<iframe id="chattingRoom" src="http://localhost:9090/chat/chatting" style="display: none"></iframe>	
<div class='chatting' onclick="clickChatting()"></div>
