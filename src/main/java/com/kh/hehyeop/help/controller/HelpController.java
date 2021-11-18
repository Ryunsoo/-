package com.kh.hehyeop.help.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.hehyeop.common.util.address.AddressUtil;
import com.kh.hehyeop.member.model.dto.Member;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("help")
public class HelpController {
	
	@GetMapping("main")
	public void help1(HttpSession session) {
		System.out.println("help main 작업 중 ㅎㅎㅎ");
		Map<String, List<String>> categoryMap = new HashMap<String, List<String>>();
		categoryMap.put("category", null);
		
	}
	
	@GetMapping("request")
	public void help2() {
		
	}
	
	@GetMapping("my-hehyeop")
	public void help3(HttpSession session, Model model) {
		AddressUtil util = new AddressUtil();
		Member member = (Member) session.getAttribute("authentication");
		String trimAddress = util.trimOldAddress(member.getOldAddress());
		System.out.println("trimAddress : " + trimAddress);
		model.addAttribute("trimAddress", trimAddress);
	}

	
	@GetMapping("review")
	public void help4() {
		
	}
	

}
