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
import com.kh.hehyeop.common.util.paging.Paging;
import com.kh.hehyeop.company.model.dto.CompanyField;
import com.kh.hehyeop.company.model.dto.MyRequest;
import com.kh.hehyeop.company.model.dto.RequestDetail;
import com.kh.hehyeop.company.model.service.CompanyService;
import com.kh.hehyeop.help.model.dto.HelpRequest;
import com.kh.hehyeop.member.model.dto.CMember;
import com.kh.hehyeop.help.model.repositroy.HelpRepository;
import com.kh.hehyeop.mypage.model.dto.MyAddress;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
@RequestMapping("company")
public class CompanyController {
	
	private final CompanyService companyService;
	private final HelpRepository helpRepository;

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
	public void main(HttpSession session,Model model, Paging paging
						, @RequestParam(value = "nowPage", required = false) String nowPage
						, @RequestParam(value = "cntPerPage", required = false) String cntPerPage
						, @RequestParam(value = "area", required = false) String area) {
				
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "1";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "1";
		}
		
		CMember cmember = (CMember) session.getAttribute("authentication");
		
		List<String> addressList = new ArrayList<String>();
		List<HelpRequest> requestList = new ArrayList<HelpRequest>();
		
		MyAddress myAddress = helpRepository.selectMyAreaList(cmember.getId());

		addressList.add(myAddress.getAddress1());
		if(myAddress.getAddress2() != null) addressList.add(myAddress.getAddress2());
		if(myAddress.getAddress3() != null) addressList.add(myAddress.getAddress3());
		
		List<CompanyField> companyFieldList = companyService.selectCompanyFieldListById(cmember.getId());
		
		int total = companyService.countRequest(addressList,companyFieldList,area);
		paging = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		requestList = companyService.selectRequestList(paging, addressList, companyFieldList, area);
		
		model.addAttribute("paging", paging);
		model.addAttribute("requestList", requestList);
		model.addAttribute("area", area);	
		
	}
	
	@GetMapping("ongoing-help")
	public void ongoingHelpForm() {}
	
	@GetMapping("my")
	public void allHelpForm(HttpSession session, Model model
			, Paging paging
			, @RequestParam(value = "nowPage", required = false) String nowPage
			, @RequestParam(value = "cntPerPage", required = false) String cntPerPage
			, @RequestParam(value = "state", required = false) String state) {
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "1";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "1";
		}
		if(state == null) state = "0";
		CMember cmember = (CMember) session.getAttribute("authentication");
		int total = companyService.selectRequestListCntById(cmember.getId(),state);
		paging = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		List<MyRequest> requestList = companyService.selectRequestListById(paging, cmember.getId(), state);	
		model.addAttribute("requestList", requestList);
		model.addAttribute("state", state);
		model.addAttribute("paging", paging);
	}
	
}
