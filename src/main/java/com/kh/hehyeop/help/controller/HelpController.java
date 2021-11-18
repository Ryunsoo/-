package com.kh.hehyeop.help.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	public void help3() {
		
	}

	
	@GetMapping("review")
	public void help4() {
		
	}
	

}
