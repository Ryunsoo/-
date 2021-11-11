package com.kh.hehyeop.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MainController {
	
	@GetMapping("/")
	public String main() {
		
		return "main";
		
	}
	
	@GetMapping("/2")
	public String main2() {
		return "main2";
	}
	
	@GetMapping("/3")
	public String main3() {
		return "main3";
	}
}
