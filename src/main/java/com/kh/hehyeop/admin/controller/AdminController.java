package com.kh.hehyeop.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("admin")
public class AdminController {

	@GetMapping("join-request")
	public void joinRequestForm() {}
	
	@GetMapping("finish-list")
	public void finishListForm() {}
	
	@GetMapping("approval-first")
	public void approvalFirstForm() {}
	
	@GetMapping("approval-second")
	public void approvalSecondForm() {}
}
