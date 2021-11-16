package com.kh.hehyeop.help.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.hehyeop.member.model.dto.User;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("help")
public class HelpController {
	
	@GetMapping("main")
	public void help1(HttpSession session) {
		User user = (User) session.getAttribute("authentication");
		System.out.println("닉네임 : " + user.getNickname());
	}
	
	@GetMapping("request")
	public void help2() {
		
	}
	
	@GetMapping("my-hehyeop")
	public void help3() {
		
	}

	
	@GetMapping("review")
	public void help4() {
		
	}
	

}
