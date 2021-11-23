package com.kh.hehyeop.company.controller;


import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.hehyeop.common.code.Config;
import com.kh.hehyeop.company.model.dto.RequestDetail;
import com.kh.hehyeop.company.model.service.CompanyService;
import com.kh.hehyeop.help.model.dto.HelpRequest;
import com.kh.hehyeop.member.model.dto.CMember;
import com.kh.hehyeop.help.model.dto.HelpResponse;
import com.kh.hehyeop.help.model.service.HelpService;
import com.kh.hehyeop.member.model.dto.Member;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
@RequestMapping("company")
public class CompanyController {
	
	private final CompanyService companyService;

	@GetMapping("help-detail")
	public void helpDetailForm(Model model, String reqIdx) {
		RequestDetail detail = companyService.selectRequestDetailByReqIdx(reqIdx);
		String reName = detail.getReName();
		int formatIdx = reName.lastIndexOf(".");
		System.out.println(reName.substring(formatIdx+1));
		System.out.println(detail);
		System.out.println(Config.UPLOAD_PATH.DESC);
		model.addAttribute("format", reName.substring(formatIdx+1));
		model.addAttribute("requestDetail", detail);
		model.addAttribute("uploadPath", Config.UPLOAD_PATH.DESC);
	}
	
	@GetMapping("help-join")
	public void helpJoinFrom() {}
	
	@GetMapping("main")
	public void main(HttpSession session,Model model) {
		CMember cmember = (CMember) session.getAttribute("authentication");
		
		List<HelpRequest> requestList = new ArrayList<HelpRequest>();
		
		requestList = companyService.selectRequestList(cmember.getId());
		
		model.addAttribute("requestList", requestList);
		
	}
	
	@GetMapping("ongoing-help")
	public void ongoingHelpForm() {}
	
	@GetMapping("my")
	public void allHelpForm(HttpSession session, @RequestParam(value = "state", required = false) String state) {
		Member member = (Member) session.getAttribute("authentication");
		if(state == null) state = "0";
		List<HelpRequest> requestList = companyService.selectRequestListById(member.getId(), state);
	}
	
}
