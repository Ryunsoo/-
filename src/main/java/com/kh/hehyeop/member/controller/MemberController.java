package com.kh.hehyeop.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("member")
public class MemberController {

	@GetMapping("login-form")
	public void loginTest() {}
	
	@GetMapping("join-form")
	public void JoinTest() {}
	
	@GetMapping("join-form-next")
	public void JoinNextTest() {}
	
	@GetMapping("cojoin-form")
	public void coJoinTest() {}
	
	@GetMapping("cojoin-form-next")
	public void coJoinNextTest() {}
	
	@GetMapping("cojoin-form-last")
	public void coJoinLastTest() {}
	
}
