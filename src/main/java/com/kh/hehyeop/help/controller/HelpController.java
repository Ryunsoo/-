 package com.kh.hehyeop.help.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.hehyeop.common.util.address.AddressUtil;
import com.kh.hehyeop.common.validator.ValidateResult;
import com.kh.hehyeop.company.model.dto.ProField;
import com.kh.hehyeop.help.model.dto.HelpRequest;
import com.kh.hehyeop.help.model.dto.MyHehyeop;
import com.kh.hehyeop.help.model.dto.Review;
import com.kh.hehyeop.help.model.service.HelpService;
import com.kh.hehyeop.help.validator.RequestForm;
import com.kh.hehyeop.help.validator.RequestFormValidator;
import com.kh.hehyeop.member.model.dto.Member;
import com.kh.hehyeop.member.model.dto.User;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("help")
public class HelpController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private final HelpService helpService;
	private final RequestFormValidator requestFormValidator;
	
	@GetMapping("main")
	public void help1(HttpSession session) {
		Map<String, List<ProField>> proFiledMap = new HashMap<String, List<ProField>>();
		proFiledMap.put("category", helpService.selectCategoryList());
		proFiledMap.put("proField", helpService.selectFieldList());
		
		session.setAttribute("proFieldMap", proFiledMap);
	}

	
	@GetMapping("request")
	public void help2(HttpSession session, String field) {	
		session.setAttribute("field", field);			
	}
	
	@GetMapping("my-hehyeop")
	public void myHehyeop(HttpSession session, Model model) {
		AddressUtil util = new AddressUtil();
		Member member = (Member) session.getAttribute("authentication");
		//회원가입시 주소가 util 사용으로 바뀌면 그냥 jsp에서 oldAddress 가져오는 걸로 바꾸기
		String trimAddress = util.trimOldAddress(member.getOldAddress());
		System.out.println("trimAddress : " + trimAddress);
		
		List<MyHehyeop> helpList = helpService.getHelpRequestList(member.getId());
		
		
		
		
		model.addAttribute("trimAddress", trimAddress);
	}
	
	@GetMapping("review")
	public void review() {
		List<Review> reviewList = new ArrayList<Review>();
		reviewList = helpService.selectReviewList();
		System.out.println("제발...제발 성공했으면 좋겠다 : " + reviewList);
	}
	
	@InitBinder(value = "requestForm") // model의 속성 중 속성명이 joinForm인 속성이 있는 경우 initBinder 메서드 실행
	public void initBinder(WebDataBinder webDataBinder) {
		webDataBinder.addValidators(requestFormValidator);
	}
	
	@GetMapping("request")
	public String helpRequest(HttpSession session, String field, Model model) {
		if(session.getAttribute("authentication") == null) {
			return "redirect:/help/main";
		}
		session.setAttribute("field", field);
		model.addAttribute(new RequestForm()).addAttribute("error", new ValidateResult().getError());
		return "help/request";
	}
	
	@PostMapping("uploadRequest")
	public String uploadRequset(
			@Validated RequestForm form
			,Errors errors
			,Model model
			,HelpRequest helpRequest
			,String detailAddress
			,@RequestParam List<MultipartFile> files
			,HttpSession session
			) {
		ValidateResult vr = new ValidateResult();
		model.addAttribute("error", vr.getError());
		logger.debug("------------에러야 있니 : " + errors.toString());

		if (errors.hasErrors()) {
			vr.addErrors(errors);
			return "help/request";
		}
		User user = (User) session.getAttribute("authentication");
		String reqIdx = "";
		
		//신주소
		helpRequest.setReqAddress(helpRequest.getReqAddress()+" " + detailAddress);
		System.out.println("옴뇸뇸뇸 : " + helpRequest.getReqAddress());
		//구주소
		AddressUtil convertAddr = new AddressUtil();
		helpRequest.setOldAddress(convertAddr.trimOldAddress(helpRequest.getOldAddress()));
		
		//1. helpRequest 등록하고 req_idx 가져오기
		helpRequest.setId(user.getId());
		int resReq = helpService.insertRequest(helpRequest);
		if(resReq == 1) {
			reqIdx = helpService.selectReqIdx(helpRequest); //아이디, 이름, 시간
		}
		//2. file업로드 하기
		int resFile = helpService.uploadFile(files, reqIdx);  
		if(resFile == 1) {
			System.out.println("신청서 제출 성공");
		}
		return "help/my-hehyeop";
	}

}
