package com.kh.hehyeop.member.controller;

import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.hehyeop.common.code.ErrorCode;
import com.kh.hehyeop.common.exception.HandlableException;
import com.kh.hehyeop.common.validator.ValidateResult;
import com.kh.hehyeop.member.model.service.MemberService;
import com.kh.hehyeop.member.validator.JoinForm;
import com.kh.hehyeop.member.validator.JoinFormValidator;

@Controller
@RequestMapping("member")
public class MemberController {
	
	private MemberService memberService;
	private JoinFormValidator joinFormValidator;

	public MemberController(MemberService memberService, JoinFormValidator joinFormValidator) {
		super();
		this.memberService = memberService;
		this.joinFormValidator = joinFormValidator;
	}

	@GetMapping("login-form")
	public void loginTest() {}
	
	@InitBinder(value = "joinForm") // model의 속성 중 속성명이 joinForm인 속성이 있는 경우 initBinder 메서드 실행
	public void initBinder(WebDataBinder webDataBinder) {
		webDataBinder.addValidators(joinFormValidator);
	}
	
	@GetMapping("join-form")
	public void joinMember(Model model) {
		model.addAttribute(new JoinForm()).addAttribute("error", new ValidateResult().getError());
	}

	// error 객체는 반드시 검증될 객체 바로 뒤에 작성
	@PostMapping("join")
	public String join(@Validated JoinForm form, Errors errors, Model model, HttpSession session, RedirectAttributes redirectAttr) {

		ValidateResult vr = new ValidateResult();
		model.addAttribute("error", vr.getError());
		
		if (errors.hasErrors()) {
			vr.addErrors(errors);
			return "member/join";
		}
		
		// token 생성
		String token = UUID.randomUUID().toString();
		session.setAttribute("persistUser", form);
		session.setAttribute("persistToken", token);
		
		// memberService.authenticateByEmail(form, token);
		redirectAttr.addFlashAttribute("message", "이메일이 발송되었습니다.");
		
		return "redirect:/";

	}
	
	@GetMapping("join-impl/{token}")
	public String joinImpl(@PathVariable String token
			, @SessionAttribute(value = "persistToken", required = false) String persistToken
			, @SessionAttribute(value = "persistUser", required = false) JoinForm form
			, HttpSession session
			, RedirectAttributes redirectAttrs) {
		
		if(!persistToken.equals(persistToken)) {
			throw new HandlableException(ErrorCode.AUTHENTICATION_FAILED_ERROR);
		}
		
		memberService.insertMember(form);
		redirectAttrs.addFlashAttribute("message", "회원가입을 환영합니다. 로그인 해주세요");
		session.removeAttribute("persistToken");
		session.removeAttribute("persistUser");
		return "redirect:/member/login";
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
