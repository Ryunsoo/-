package com.kh.hehyeop.help.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("help")
public class HelpController {
	
	@GetMapping("main")
	public void help1() {
		
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
