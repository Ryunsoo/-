package com.kh.hehyeop.common.push;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.hehyeop.member.model.dto.Member;
import com.kh.hehyeop.mypage.model.service.MypageService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("push")
@RequiredArgsConstructor
public class PushHandler {

	private final MypageService mypageService;
	
	@GetMapping("save-token")
	@ResponseBody
	public String saveToken(String token, HttpSession session, String device){
		Member member = new Member();
		member.setId("token");
			
			mypageService.insertToken(token,device,member.getId());

		return "success";
	}
	
	@PostMapping("delete-token")
	@ResponseBody
	public String deleteToken(HttpSession session, String device) {
		Member member = new Member();
		member.setId("tokentest");
		device = "mobile";
		
		if(device == "mobile") {	
			mypageService.deleteMobileToken(member.getId());
		}else {
			mypageService.deletePcToken(member.getId());
		}
		
		return "mypage";
	}
	
	
}
