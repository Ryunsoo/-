package com.kh.hehyeop.common.push;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.kh.hehyeop.member.model.dto.Member;
import com.kh.hehyeop.mypage.model.service.MypageService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("push")
@RequiredArgsConstructor
public class PushHandler {

	private static MypageService mypageService;
	
	@PostMapping("save-token")
	public String saveToken(String token, HttpSession session, String device){
		Member member = new Member();
		member.setId("tokentest");
		device = "mobile";
		token = "c2A2yT1g5Fw:APA91bG6LmTaiSoHRCvRztpSdUwstgvGMvCr_fkMcpq3IMtdc_dGxhZmUkpZ8J2Ravk0QrTwsBgdrsRbXuYZ1IjaA4R0TPSnS8JDubx3Fc0Ix-MUCPoFSP6ltDe0B1KsD6iwkHVCLopU";
		
		if(device == "mobile") {	
			mypageService.insertMobileToken(token,member.getId());
		}else {
			mypageService.insertPcToken(token,member.getId());
		}
	
		return "mypage";
	}
	
	
}
