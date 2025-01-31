package com.kh.hehyeop.member.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.hehyeop.common.code.ErrorCode;
import com.kh.hehyeop.common.exception.HandlableException;
import com.kh.hehyeop.common.util.address.AddressUtil;
import com.kh.hehyeop.common.validator.ValidateResult;
import com.kh.hehyeop.member.model.dto.Admin;
import com.kh.hehyeop.member.model.dto.CMember;
import com.kh.hehyeop.member.model.dto.Member;
import com.kh.hehyeop.member.model.service.MemberService;
import com.kh.hehyeop.member.validator.FieldForm;
import com.kh.hehyeop.member.validator.JoinForm;
import com.kh.hehyeop.member.validator.JoinFormValidator;
import com.kh.hehyeop.mypage.model.dto.LinkMember;
import com.kh.hehyeop.mypage.model.service.MypageService;

@Controller
@RequestMapping("member")
public class MemberController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private MemberService memberService;
	private JoinFormValidator joinFormValidator;
	private MypageService mypageService;

	public MemberController(MemberService memberService, JoinFormValidator joinFormValidator, MypageService mypageService) {
		super();
		this.memberService = memberService;
		this.joinFormValidator = joinFormValidator;
		this.mypageService = mypageService;
	}

	@GetMapping("login-form")
	public void loginForm() {}
	
	@PostMapping("login")
	public String loginImpl(Member member, CMember cmember, Admin admin, HttpSession session, RedirectAttributes redirectAttr) {
		
		Member certifiedUser = memberService.authenticateUser(member);
		CMember certifiedCUser = memberService.authenticateCUser(cmember);
		Admin certifiedAdmin = memberService.authenticateAdmin(admin);
		
		if(certifiedUser != null) {
			session.setAttribute("authentication", certifiedUser);
			session.setAttribute("id", certifiedUser.getNickname());
			return "redirect:/"; 
		} else if (certifiedCUser != null){
			int isPermit =  certifiedCUser.getIsPermit();
			if(isPermit == 0) {
				session.setAttribute("authentication", certifiedCUser);
				return "redirect:/mypage/mypage-company"; 
			}
			session.setAttribute("authentication", certifiedCUser);
			LinkMember linkedMember = mypageService.selectLink(certifiedCUser.getId());
			if(linkedMember != null) {
				session.setAttribute("linked", linkedMember);
			}
			session.setAttribute("id", certifiedCUser.getCompany());
			return "redirect:/company/main"; 
		} else if (certifiedAdmin != null) {
			session.setAttribute("authentication", admin);
			return "redirect:/admin/join-request";
		} else {
			redirectAttr.addFlashAttribute("message", "아이디나 비밀번호가 정확하지 않습니다.");
			return "redirect:/member/login-form";
		}
	}
	
	@GetMapping("finding-id")
	@ResponseBody
	public String findingId(String name, String tell, String email, HttpSession session, RedirectAttributes redirectAttr) {
		System.out.println("돌고있냐? : " + name + tell + email);
		String certifiedId = memberService.selectIdByEmail(name, tell, email);

		if (certifiedId != null) {
			session.setAttribute("findingId", certifiedId);
			return certifiedId;
		}
			return null;
	}

	@GetMapping("finding-pw")
	@ResponseBody
	public String findingPw(String name, String id, String email, HttpSession session,RedirectAttributes redirectAttr) {
		System.out.println("돌고있냐? : " + name + id + email);
		
		Member certifiedUser = memberService.changePasswordByEmail(name, id, email);
		CMember certifiedCUser = memberService.C_changePasswordByEmail(name, id, email);
		
		String token = UUID.randomUUID().toString();
		session.setAttribute("persistUser", certifiedUser);
		session.setAttribute("c_persistUser", certifiedCUser);
		session.setAttribute("persistToken", token);
		

		if (certifiedUser != null) {
			memberService.findPasswordByEmail(email, token);
			redirectAttr.addFlashAttribute("message", "이메일이 발송되었습니다.");
			return certifiedUser.getEmail();
		}else if(certifiedCUser != null) {
			memberService.findPasswordByEmail(email, token);
			redirectAttr.addFlashAttribute("message", "이메일이 발송되었습니다.");
			return certifiedCUser.getEmail();
		}
		
		return null;
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
	
	
	
	@GetMapping("social-login")
	public String socialLoginImpl(Member member
								,@RequestParam(value="id", required=false)  String id 
								, HttpSession session
								, RedirectAttributes redirectAttr) {
		member.setId(id);
		member.setPassword(UUID.randomUUID().toString());
		Member certifiedUser = memberService.authenticateSocialUser(member);
		
		if(certifiedUser != null) {
			session.setAttribute("authentication", certifiedUser);
			session.setAttribute("id", certifiedUser.getNickname());
			return "redirect:/"; 
		} else {
			redirectAttr.addFlashAttribute("message", "아이디나 비밀번호가 정확하지 않습니다.");
			return "redirect:/member/login-form";
		}
	}
	
	


	
	@GetMapping("social-join-form")
	public void socialJoinMember(Model model
								,@RequestParam(value="id", required=false)  String id 
								,HttpSession session) {
		session.setAttribute("id", id);
		model.addAttribute(new JoinForm()).addAttribute("error", new ValidateResult().getError());
	}
	
	@PostMapping("social-join")
	public String socialJoin(@Validated JoinForm form
							, Errors errors
							, Model model
							, HttpSession session
							, RedirectAttributes redirectAttr) {
		
		ValidateResult vr = new ValidateResult();
		model.addAttribute("error", vr.getError());
		
		if (errors.hasErrors()) {
			vr.addErrors(errors);
			return "member/social-join-form";
		}
		
		AddressUtil convertAddr = new AddressUtil();
		
		form.setId((String)session.getAttribute("id"));
		form.setPassword(UUID.randomUUID().toString());
		form.setOldAddress(convertAddr.trimOldAddress(form.getOldAddress()));
		
		String token = UUID.randomUUID().toString();
		session.setAttribute("persistUser", form);
		session.setAttribute("persistToken", token);
		
		memberService.authenticateByEmail(form, token);
		redirectAttr.addFlashAttribute("message", "이메일이 발송되었습니다.");
		 		
		return "redirect:/member/login-form";
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
		AddressUtil convertAddr = new AddressUtil();
		
		form.setId(infoForm.getId());
		form.setPassword(infoForm.getPassword());
		form.setName(infoForm.getName());
		form.setTell(infoForm.getTell());
		form.setOldAddress(convertAddr.trimOldAddress(form.getOldAddress()));
		form.setStatus(0);
		
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
	public void coJoinLastTest() {
		
	}
	
	@GetMapping("id-check")
	@ResponseBody
	public String idCheck(String id) {
		Member member = memberService.selectMemberByUserId(id);
		if (member != null || id.equals("admin")) {
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
	
	
	@GetMapping("cojoin-form")
	public void joinFormNextMember(Model model, HttpSession session) {
		
		model.addAttribute(new JoinForm()).addAttribute("error", new ValidateResult().getError());
		
	}
	
	// error 객체는 반드시 검증될 객체 바로 뒤에 작성
	@PostMapping("cojoin-form-next")
	public String coJoinNext(@Validated JoinForm form, Errors errors, Model model, HttpSession session) {

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
	
	@PostMapping("cojoin-form-last")
	public String coJoinLast(@Validated JoinForm form, Errors errors, Model model, HttpSession session) {
		
		ValidateResult vr = new ValidateResult();
		model.addAttribute("error", vr.getError());
		
		if (errors.hasErrors()) {
			vr.addErrors(errors);
			return "member/cojoin-form";
		}
		
		JoinForm infoForm = (JoinForm) session.getAttribute("CoJoinForm");
		AddressUtil convertAddr = new AddressUtil();
		  
		form.setId(infoForm.getId());
		form.setPassword(infoForm.getPassword());
		form.setName(infoForm.getName());
		form.setTell(infoForm.getTell());
		form.setOldAddress(convertAddr.trimOldAddress(form.getOldAddress()));
		form.setStatus(1);
		
		session.setAttribute("CoJoinLastForm", form);
		
		ArrayList<FieldForm> fieldList = memberService.selectField();
		ArrayList<String> categoryList = memberService.selectCategory();
		
		session.setAttribute("fieldList", fieldList);
		session.setAttribute("categoryList", categoryList);
		
		return "member/cojoin-form-last";
		
	}
	
	@PostMapping("cjoin")
	public String cjoin(HttpServletRequest request, HttpSession session, RedirectAttributes redirectAttr, 
						@RequestParam List<MultipartFile> files) {
		
		JoinForm infoForm = (JoinForm) session.getAttribute("CoJoinLastForm");	
		List<String> fieldList = new ArrayList<String>();
		String[] fieldParam = request.getParameterValues("fieldName");
		
		logger.debug(infoForm.toString());
		
		for (String field : fieldParam) {
			fieldList.add(field);
		}
		
		String token = UUID.randomUUID().toString();
		session.setAttribute("persistUser", infoForm);
		session.setAttribute("persistToken", token);
		session.setAttribute("fieldList", fieldList);
		session.setAttribute("fileList", files);
		
		memberService.authenticateByEmail(infoForm, token);
		redirectAttr.addFlashAttribute("message", "이메일이 발송되었습니다.");
		
		return "redirect:/member/login-form";
	}
	
	@GetMapping("findpw-impl/{token}")
	public String findPwImpl(@PathVariable String token
			, @SessionAttribute(value = "persistToken", required = false) String persistToken
			, @SessionAttribute(value = "persistUser", required = false) Member email
			, HttpSession session
			, RedirectAttributes redirectAttrs) {
		
		if(persistToken == null) {
			throw new HandlableException(ErrorCode.AUTHENTICATION_FAILED_ERROR);
		}
		
		if(!token.equals(persistToken)) {
			throw new HandlableException(ErrorCode.AUTHENTICATION_FAILED_ERROR);
		}
		
		session.removeAttribute("persistToken");
	
		return "redirect:/member/login-form?email=1";
	}
	
	@GetMapping("join-impl/{token}")
	public String joinImpl(@PathVariable String token
			, @SessionAttribute(value = "persistToken", required = false) String persistToken
			, @SessionAttribute(value = "persistUser", required = false) JoinForm form
			, HttpSession session
			, RedirectAttributes redirectAttrs) {
		
		if(persistToken == null) {
			throw new HandlableException(ErrorCode.AUTHENTICATION_FAILED_ERROR);
		}
		
		if(!token.equals(persistToken)) {
			throw new HandlableException(ErrorCode.AUTHENTICATION_FAILED_ERROR);
		}
		
		
		if(form.getStatus() == 0) {
			memberService.insertMember(form);
			session.removeAttribute("persistUser");
		}else if(form.getStatus() == 1){
			List<String> fieldList = (List<String>) session.getAttribute("fieldList");
			List<MultipartFile> files = (List<MultipartFile>) session.getAttribute("fileList");
			
			memberService.insertCMember(form);
			memberService.insertFields(form.getId(), fieldList);

			CMember newMember = memberService.selectCMember(form.getId());
			 
			memberService.uploadFile(files, newMember.getCIdx());
			session.removeAttribute("persistCUser");
			session.removeAttribute("fileList");
		}
		
		redirectAttrs.addFlashAttribute("message", "회원가입을 환영합니다. 로그인 해주세요");
		session.removeAttribute("persistToken");
	
		return "redirect:/member/login-form";
	}

	
	@GetMapping("update-pw")
	@ResponseBody
	public String updatePw(String newPw, HttpSession session) {

		boolean valid = Pattern.matches("(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Zㄱ-힣0-9]).{8,}", newPw);

		if (valid) {
			Member member = (Member) session.getAttribute("persistUser");
			CMember cMember = (CMember) session.getAttribute("c_persistUser");

			if (member != null) {
				member.setId(member.getId());
				member.setEmail(member.getEmail());
				memberService.updatePassword(member, newPw);
				System.out.println("member 바꼈냐");
				session.removeAttribute("persistUser");
				return "change";
				
			} else if (cMember != null) {
				cMember.setId(cMember.getId());
				cMember.setEmail(cMember.getEmail());
				memberService.c_updatePassword(cMember, newPw);
				System.out.println("c_member 바꼈냐");
				session.removeAttribute("c_persistUser");
				return "change";
			}
			return null;
		} else {

			return "false";
		}
	}
	
	@GetMapping("delete-user")
	public String deleteUser(HttpSession session, RedirectAttributes redirectAttrs) {
		Member member = (Member) session.getAttribute("authentication");
		
		memberService.deleterUser(member);
		session.removeAttribute("authentication");
		redirectAttrs.addFlashAttribute("message", "그동안 이용해주셔서 감사합니다.");
		return "redirect:/member/login-form";
	}
	
	
	@GetMapping("delete-company-user")
	public String deleteCompanyUser(HttpSession session, RedirectAttributes redirectAttrs) {
		CMember cmember = (CMember) session.getAttribute("authentication");
		
		memberService.deleteCUser(cmember);
		session.removeAttribute("authentication");
		redirectAttrs.addFlashAttribute("message", "그동안 이용해주셔서 감사합니다.");
		return "redirect:/member/login-form";
	}
	
	
	@GetMapping("logout")
	public String logout(HttpSession session, RedirectAttributes redirectAttrs) {
		
		session.removeAttribute("authentication");
		session.removeAttribute("linked");
		redirectAttrs.addFlashAttribute("message", "로그아웃 되었습니다.");
		return "redirect:/member/login-form";
	}

	
	
	
	
	
	
	
	
	
	
}
