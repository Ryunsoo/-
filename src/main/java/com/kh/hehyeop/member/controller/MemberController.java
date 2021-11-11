package com.kh.hehyeop.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.hehyeop.member.model.dto.Member;
import com.kh.hehyeop.common.validator.ValidateResult;

@Controller
@RequestMapping("member")
public class MemberController {

	@GetMapping("login-form")
	public void loginTest() {}
	
	@GetMapping("join-form")
	public void joinMember(Model model) {
		model.addAttribute(new Member()).addAttribute("error", new ValidateResult().getError());
	}
	
	@GetMapping("join-form-next")
	public void JoinNextTest() {}
	
	@GetMapping("cojoin-form")
	public void coJoinTest() {}
	
	@GetMapping("cojoin-form-next")
	public void coJoinNextTest() {}
	
	@GetMapping("cojoin-form-last")
	public void coJoinLastTest() {}
	
}
