package com.kh.hehyeop.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.hehyeop.common.code.ErrorCode;
import com.kh.hehyeop.common.exception.HandlableException;
import com.kh.hehyeop.common.validator.ValidateResult;
import com.kh.hehyeop.member.model.dto.CMember;
import com.kh.hehyeop.member.model.dto.Member;
import com.kh.hehyeop.member.model.service.MemberService;
import com.kh.hehyeop.member.validator.CoJoinForm;
import com.kh.hehyeop.member.validator.FieldForm;
import com.kh.hehyeop.member.validator.JoinForm;
import com.kh.hehyeop.member.validator.JoinFormValidator;

@Controller
@RequestMapping("member")
public class MemberController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private MemberService memberService;
	private JoinFormValidator joinFormValidator;

	public MemberController(MemberService memberService, JoinFormValidator joinFormValidator) {
		super();
		this.memberService = memberService;
		this.joinFormValidator = joinFormValidator;
	}

	@GetMapping("login-form")
	public void loginForm() {}
	
	@PostMapping("login")
	public String loginImpl(Member member, CMember cmember, HttpSession session, RedirectAttributes redirectAttr) {
		
		Member certifiedUser = memberService.authenticateUser(member);
		CMember certifiedCUser = memberService.authenticateCUser(cmember);
		
		if(certifiedUser != null) {
			session.setAttribute("authentication", certifiedUser);
			return "redirect:/"; 
		} else if (certifiedCUser != null){
			session.setAttribute("C_authentication", certifiedCUser);
			return "redirect:/company/all-help"; 
		} else {
			redirectAttr.addFlashAttribute("message", "아이디나 비밀번호가 정확하지 않습니다.");
			return "redirect:/member/login-form";
		}
	}
	
	@InitBinder(value = "joinForm") // model의 속성 중 속성명이 joinForm인 속성이 있는 경우 initBinder 메서드 실행
	public void initBinder(WebDataBinder webDataBinder) {
		webDataBinder.addValidators(joinFormValidator);
	}
	
	@GetMapping("join-form")
	public void joinMember(Model model) {
		
		model.addAttribute(new JoinForm()).addAttribute("error", new ValidateResult().getError());
		
	}
	
	// error 객체는 반드시 검증될 객체 바로 뒤에 작성
	@PostMapping("join-form-next")
	public String joinNext(@Validated JoinForm form, Errors errors, Model model, HttpSession session) {
			
		ValidateResult vr = new ValidateResult();
		model.addAttribute("error", vr.getError());
		
		if (errors.hasErrors()) {
			vr.addErrors(errors);
			return "member/join-form";
		}
		
		session.setAttribute("joinInfo", form);
		return "member/join-form-next";

	}
	
	@PostMapping("join")
	public String join(@Validated JoinForm form, Errors errors, Model model, HttpSession session, RedirectAttributes redirectAttr) {
	
		ValidateResult vr = new ValidateResult();
		model.addAttribute("error", vr.getError());
		
		if (errors.hasErrors()) {
			vr.addErrors(errors);
			return "redirect:/member/join-form";
		}
		
		JoinForm infoForm = (JoinForm) session.getAttribute("joinInfo");
		  
		form.setId(infoForm.getId());
		form.setPassword(infoForm.getPassword());
		form.setName(infoForm.getName());
		form.setTell(infoForm.getTell());
		
		String token = UUID.randomUUID().toString();
		session.setAttribute("persistUser", form);
		session.setAttribute("persistToken", token);
		
		memberService.authenticateByEmail(form, token);
		redirectAttr.addFlashAttribute("message", "이메일이 발송되었습니다.");
		 		
		return "redirect:/member/login-form";
	}
	
	
	@GetMapping("cojoin-form-next")
	public void coJoinNextTest() {}
	
	@GetMapping("cojoin-form-last")
	public void coJoinLastTest(HttpSession session) {
		
		ArrayList<FieldForm> fieldList = memberService.selectField();
		
		session.setAttribute("fieldList", fieldList);
		
		logger.debug(fieldList.toString());
		
	}
	
	@GetMapping("id-check")
	@ResponseBody
	public String idCheck(String id) {
		Member member = memberService.selectMemberByUserId(id);
		
		if (member != null) {
			logger.debug(member.toString());
			return "disable";
		} else {
			return "available";
		}
	}
	
	@GetMapping("nick-check")
	@ResponseBody
	public String nickCheck(String nickname) {
		Member member = memberService.selectMemberByNickname(nickname);
		
		if (member != null) {
			logger.debug(member.toString());
			return "disable";
		} else {
			return "available";
		}
	}
	
	@InitBinder(value = "cjoinForm") // model의 속성 중 속성명이 joinForm인 속성이 있는 경우 initBinder 메서드 실행
	public void cinitBinder(WebDataBinder webDataBinder) {
		webDataBinder.addValidators(joinFormValidator);
	}
	
	@GetMapping("cojoin-form")
	public void joinFormNextMember(Model model, HttpSession session) {
		
		model.addAttribute(new CoJoinForm()).addAttribute("error", new ValidateResult().getError());
		
	}
	
	// error 객체는 반드시 검증될 객체 바로 뒤에 작성
	@PostMapping("cojoin-form-next")
	public String coJoinNext(@Validated CoJoinForm form, Errors errors, Model model, HttpSession session) {

		ValidateResult vr = new ValidateResult();
		model.addAttribute("error", vr.getError());

		if (errors.hasErrors()) {
			vr.addErrors(errors);
			return "member/cojoin-form";
		}

		session.setAttribute("CoJoinForm", form);
		logger.debug(form.toString());
		return "member/cojoin-form-next";

	}
	
	// error 객체는 반드시 검증될 객체 바로 뒤에 작성
	@PostMapping("cojoin-form-last")
	public String coJoinLast(@Validated CoJoinForm form, Errors errors, Model model, HttpSession session) {
		
		ValidateResult vr = new ValidateResult();
		model.addAttribute("error", vr.getError());
		
		if (errors.hasErrors()) {
			vr.addErrors(errors);
			return "member/cojoin-form";
		}
		
		CoJoinForm infoForm = (CoJoinForm) session.getAttribute("CoJoinForm");
		  
		form.setId(infoForm.getId());
		form.setPassword(infoForm.getPassword());
		form.setName(infoForm.getName());
		form.setTell(infoForm.getTell());
		
		session.setAttribute("CoJoinLastForm", form);
		logger.debug(form.toString());
		return "member/cojoin-form-last";
		
	}
	
	@PostMapping("cjoin")
	public String cjoin(@Validated CoJoinForm form, Errors errors, Model model, HttpSession session, RedirectAttributes redirectAttr) {
	
		ValidateResult vr = new ValidateResult();
		model.addAttribute("error", vr.getError());
		
		if (errors.hasErrors()) {
			vr.addErrors(errors);
			return "redirect:/member/cojoin-form";
		}
		
		
		String token = UUID.randomUUID().toString();
		session.setAttribute("persistCUser", form);
		session.setAttribute("persistToken", token);
		
		memberService.co_authenticateByEmail(form, token);
		redirectAttr.addFlashAttribute("message", "이메일이 발송되었습니다.");
		 		
		return "redirect:/member/login-form";
	}
	
	@GetMapping("join-impl/{token}")
	public String joinImpl(@PathVariable String token
			, @SessionAttribute(value = "persistToken", required = false) String persistToken
			, @SessionAttribute(value = "persistUser", required = false) JoinForm form
			, @SessionAttribute(value = "persistCUser", required = false) CoJoinForm coForm
			, HttpSession session
			, RedirectAttributes redirectAttrs) {
		
		if(!persistToken.equals(persistToken)) {
			throw new HandlableException(ErrorCode.AUTHENTICATION_FAILED_ERROR);
		}
		
		if(form != null) {
			memberService.insertMember(form);
			session.removeAttribute("persistUser");
		}else if(coForm != null){
			memberService.insertCMember(coForm);
			session.removeAttribute("persistCUser");
		}
		
		redirectAttrs.addFlashAttribute("message", "회원가입을 환영합니다. 로그인 해주세요");
		session.removeAttribute("persistToken");
	
		return "redirect:/member/login-form";
	}
	
}
