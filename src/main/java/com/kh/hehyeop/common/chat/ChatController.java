package com.kh.hehyeop.common.chat;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("chat")
@RequiredArgsConstructor
public class ChatController {
	
	//세션에 저장되어 있는 로그인 정보를 가지고, 해당 아이디가 보유하고 있는 채팅 목록을 가져와 view 로 넘기는 메서드 (륜수)

}
