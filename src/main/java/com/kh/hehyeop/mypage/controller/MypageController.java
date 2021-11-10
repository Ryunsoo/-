package com.kh.hehyeop.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("mypage")
public class MypageController {
	
	@GetMapping("mypage-common")
	public void mypageCommon() { }
	
	@GetMapping("mypage-company")
	public void mypageCompany() { }
}
