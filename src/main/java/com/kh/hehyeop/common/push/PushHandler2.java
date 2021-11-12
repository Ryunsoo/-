package com.kh.hehyeop.common.push;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.hehyeop.mypage.model.service.MypageService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("push")
@RequiredArgsConstructor
public class PushHandler2 {

	private static MypageService mypageService;
	
	@PostMapping("save-token")
	public String saveToken(String token, HttpSession session) {
		
		
		
		
		if(session.getAttribute("authenticate").equals("normal")) {}
		
		return "mypage";
	}
	
	
}
