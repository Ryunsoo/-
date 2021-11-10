package com.kh.hehyeop.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("community")
public class CommunityController {

	@GetMapping("board-list")
	public void boardListTest() {}
	
	@GetMapping("board-view")
	public void boardViewTest() {}
	
	@GetMapping("board-search")
	public void boardSearchTest() {}
	
	@GetMapping("board-write")
	public void boardWriteTest() {}
	
	@GetMapping("board-modify")
	public void boardModifyTest() {}

	
}
