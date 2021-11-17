package com.kh.hehyeop.common.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.hehyeop.common.chat.model.dto.ChatLog;
import com.kh.hehyeop.common.chat.model.service.ChatService;
import com.kh.hehyeop.member.model.dto.User;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("chat")
@RequiredArgsConstructor
public class ChatController {
	
	private final ObjectMapper objectMapper;
	private final ChatService chatService;
	
	//세션에 저장되어 있는 로그인 정보를 가지고, 해당 아이디가 보유하고 있는 채팅 목록을 가져와 view 로 넘기는 메서드
	@GetMapping("chat-room")
	@ResponseBody
	public Map<String, List<ChatLog>> chatList(HttpSession session){		
		User user = (User) session.getAttribute("authentication");
		
		if(user == null) {
			return null;
		}
		
		Map<String, List<ChatLog>> chatListMap = new HashMap<String, List<ChatLog>>();
		chatListMap.put("unread", chatService.selectUnReadChatListById(user.getId()));
		chatListMap.put("read", chatService.selectReadChatListById(user.getId()));
		
		//session.setAttribute("chatLog", chatListMap);
		return chatListMap;
	}
	
	@GetMapping("chatting")
	public String chatting(HttpSession session) {
		System.out.println(session.getAttribute("id"));
		return "include/chat/chat-room";
	}
	
	@PostMapping("chat-save")
	@ResponseBody
	public void chatSave(@RequestBody String chatLog, HttpSession session) throws JsonMappingException, JsonProcessingException {
		System.out.println("roomNo : " + chatLog);
		Map<String, String> mapper = objectMapper.readValue(chatLog, Map.class);
		System.out.println("map으로 변환한 chatlog json : " + mapper);
		chatService.updateChatLog(mapper.get("room"), mapper.get("chatLog"));
	}
	
	@GetMapping("update-exit")
	@ResponseBody
	public void updateExit(HttpSession session, String roomNo) {
		User user = (User) session.getAttribute("authentication");
		chatService.updateExitDate(user.getId(), roomNo);
	}
	
	@GetMapping("chat-log")
	@ResponseBody
	public ResponseEntity<String> selectChatLog(HttpSession session, String roomNo) {
		ChatLog chatLog = chatService.selectChatLog(roomNo);
		
		String logData = chatLog.getChatData();
		
		session.setAttribute("roomName", chatLog.getRoomName());
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "application/json; charset=UTF-8");
		
		return (new ResponseEntity<String>(logData, headers, HttpStatus.OK));
	}
	
	@GetMapping("chat-room-member")
	@ResponseBody
	public List<String> chatMemberList(HttpSession session, String roomNo){		
		User user = (User) session.getAttribute("authentication");
		
		if(user == null) {
			return null;
		}
		
		List<String> chatMemberList = new ArrayList<String>();
		chatMemberList = chatService.selectChatMemberListById(user.getId(), roomNo);
		return chatMemberList;
	}

	@GetMapping("exit-room")
	@ResponseBody
	public String exitRoom(HttpSession session, String roomNo) {
		User user = (User) session.getAttribute("authentication");
		
		int res = chatService.deleteIdByRoomNo(roomNo, user.getId());
		if(res == 1) {
			return "success";
		}
		
		return null;
	}

}
