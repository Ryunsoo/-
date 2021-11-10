package com.kh.hehyeop.help.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("help")
public class HelpController {
	
	@GetMapping("hehyeop-main")
	public void help1() {
		
	}
	
	@GetMapping("hehyeop-request")
	public void help2() {
		
	}
	
	@GetMapping("my-hehyeop")
	public void help3() {
		
	}
	
	@GetMapping("my-hehyeop-detail")
	public void help4() {
		
	}
	
	@GetMapping("my-hehyeop-estimate")
	public void help5() {
		
	}
	
	@GetMapping("review-hehyeop")
	public void help6() {
		
	}
	

}
