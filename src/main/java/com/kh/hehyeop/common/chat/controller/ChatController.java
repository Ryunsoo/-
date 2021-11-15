package com.kh.hehyeop.common.chat.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kh.hehyeop.common.chat.model.dto.ChatLog;
import com.kh.hehyeop.common.chat.model.service.ChatService;
import com.kh.hehyeop.member.model.dto.User;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("chat")
@RequiredArgsConstructor
public class ChatController {
	
	private final ChatService chatService;
	
	//세션에 저장되어 있는 로그인 정보를 가지고, 해당 아이디가 보유하고 있는 채팅 목록을 가져와 view 로 넘기는 메서드
	@GetMapping("chat-room")
	@ResponseBody
	public List<ChatLog> chatList(HttpSession session){		
		User user = (User) session.getAttribute("authentication");
		
		List<ChatLog> chatLog = chatService.selectChatListById(user.getId());
		session.setAttribute("chatLog", chatLog);
		return chatLog;
	}
}
