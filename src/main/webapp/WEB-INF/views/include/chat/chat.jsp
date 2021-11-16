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
<div class='chatting2' style="display: none" onclick="clickChatting2()"></div>
<div id="frogue-container" style="display: none" class="position-right-bottom" onclick="closeChat()" data-chatbot="1f5298b0-f1da-4b09-9a3b-f2fa5e500d3e" data-user="lhj132824@gmail.com"></div>