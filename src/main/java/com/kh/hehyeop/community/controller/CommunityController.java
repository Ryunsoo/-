package com.kh.hehyeop.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("community")
public class CommunityController {

	@GetMapping("list")
	public void boardListTest() {}
	
	@GetMapping("view")
	public void boardViewTest() {}
	
	@GetMapping("search")
	public void boardSearchTest() {}
	
	@GetMapping("write")
	public void boardWriteTest() {}
	
	@GetMapping("modify")
	public void boardModifyTest() {}

	
}
