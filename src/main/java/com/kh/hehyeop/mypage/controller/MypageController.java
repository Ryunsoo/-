package com.kh.hehyeop.mypage.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.hehyeop.member.model.dto.Member;
import com.kh.hehyeop.member.model.service.MemberService;
import com.kh.hehyeop.mypage.model.service.MypageService;

@Controller
@RequestMapping("mypage")
public class MypageController {
	
	private MypageService mypageService;
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
	
	@GetMapping("delete-user")
	public String deleteUser(HttpSession session, RedirectAttributes redirectAttrs) {
		Member member = (Member) session.getAttribute("memberAllInfo");
		
		mypageService.deleterUser(member);
		redirectAttrs.addFlashAttribute("message", "탈퇴되었습니다.<br><br>그동안 이용해주셔서 감사합니다.");
		return "redirect:/member/login-form";
	}
}
