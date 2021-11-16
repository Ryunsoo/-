package com.kh.hehyeop.mypage.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.hehyeop.member.model.dto.Member;

@Controller
@RequestMapping("mypage")
public class MypageController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@GetMapping("mypage-common")
	public void mypageCommon(HttpSession session) { 
		
		Member authMember = (Member) session.getAttribute("authentication");
		
		String[] splitAddress = authMember.getOldAddress().split(" ");
		authMember.setOldAddress(splitAddress[0] + " " + splitAddress[1] + " " + splitAddress[2]);
		
		logger.debug(authMember.toString());
		session.removeAttribute("authentication");
		session.setAttribute("authentication", authMember);
		
	}
	
	@GetMapping("mypage-company")
	public void mypageCompany() { }
}
