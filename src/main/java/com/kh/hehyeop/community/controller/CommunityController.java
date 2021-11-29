package com.kh.hehyeop.community.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.hehyeop.community.model.dto.Community;
import com.kh.hehyeop.community.model.service.CommunityService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("community")
@RequiredArgsConstructor
public class CommunityController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private final CommunityService communityService;

	@GetMapping("list")
	public void boardListTest() {}
	
	@GetMapping("view")
	public void boardViewTest() {}
	
	@GetMapping("search")
	public void boardSearchTest() {}
	
	@GetMapping("write")
	public void boardWriteTest(Model model) {
		model.addAttribute(new Community());
	}
	
	@GetMapping("modify")
	public void boardModifyTest() {}
	
	@PostMapping("write-board")
	public String write(Community community, Model model) {
		
		communityService.insertBoard(community);
		
		return "redirect:/community/list";
	}

	
}
