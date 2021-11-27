package com.kh.hehyeop.admin.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.hehyeop.admin.model.dto.CMember;
import com.kh.hehyeop.admin.model.service.AdminService;
import com.kh.hehyeop.common.util.paging.Paging;
import com.kh.hehyeop.member.model.service.MemberService;
import com.kh.hehyeop.member.validator.FieldForm;
import com.kh.hehyeop.mypage.model.service.MypageService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("admin")
@RequiredArgsConstructor
public class AdminController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private final AdminService adminService;
	private final MemberService memberService;
	private final MypageService mypageService;
	
	@GetMapping("join-request")
	public void joinRequestForm(Model model, Paging paging, 
			  @RequestParam(value="nowPage", required = false) String nowPage,
			  @RequestParam(value="cntPerPage", required = false) String cntPerPage) {
		
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "11";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "11";
		}
		
		int total = adminService.selectJoinCount();
		paging = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		List<CMember> joinRequestList = adminService.selectJoinRequest(paging);
		SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd");
	
		for (CMember cMember : joinRequestList) {
			cMember.setParseDate(format.format(cMember.getRegDate()));
		}
		
		model.addAttribute("paging", paging);
		model.addAttribute("joinRequestList", joinRequestList);
		
	}
	
	@GetMapping("modify-request")
	public void modifyRequestForm(Model model, Paging paging, 
								  @RequestParam(value="nowPage", required = false) String nowPage,
								  @RequestParam(value="cntPerPage", required = false) String cntPerPage) {
		
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "11";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "11";
		}
		
		int total = adminService.selectModifyCount();
		paging = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		List<CMember> modifyList = adminService.selectModifyRequest(paging);
		SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd");
		
		for (CMember cMember : modifyList) {
			cMember.setParseDate(format.format(cMember.getPermitDate()));
		}
		
		model.addAttribute("paging", paging);
		model.addAttribute("modifyList", modifyList);
		
	}
	
	@GetMapping("join-finish-list")
	public void finishListForm(Model model, Paging paging,
			  @RequestParam(value="nowPage", required = false) String nowPage,
			  @RequestParam(value="cntPerPage", required = false) String cntPerPage) {
		
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "11";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "11";
		}
		
		int total = adminService.selectJoinFinishListCount();
		paging = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		List<CMember> joinFinishList = adminService.selectJoinFinishList(paging);
		SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd");
	
		for (CMember cMember : joinFinishList) {
			cMember.setParseDate(format.format(cMember.getPermitDate()));
			cMember.setModifyParseDate(format.format(cMember.getModifyDate()));
		}
		
		
		model.addAttribute("paging", paging);
		model.addAttribute("joinFinishList", joinFinishList);
		
		
	}
	
	@GetMapping("modify-finish-list")
	public void modifyFinishListForm(Model model, Paging paging,
			@RequestParam(value="nowPage", required = false) String nowPage,
			@RequestParam(value="cntPerPage", required = false) String cntPerPage) {
		
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "11";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "11";
		}
		
		int modifyTotal = adminService.selectModifyFinishListCount();
		paging = new Paging(modifyTotal, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		List<CMember> modifyFinishList = adminService.selectModifyFinishList(paging);
		SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd");
		
		for (CMember cMember : modifyFinishList) {
			cMember.setParseDate(format.format(cMember.getPermitDate()));
			cMember.setModifyParseDate(format.format(cMember.getModifyDate()));
		}
		
		
		model.addAttribute("paging", paging);
		model.addAttribute("modifyFinishList", modifyFinishList);
		
		
	}
	
	@GetMapping("approval-first")
	public void approvalFirstForm(@RequestParam(value="id") String id, 
								  @RequestParam(value="cate") String category,
								  HttpSession session) {
		
		Map<String, Object> memberInfo = adminService.selectMemberById(id, category);
		session.setAttribute("memberInfo", memberInfo);
		
	}
	
	@GetMapping("approval-second")
	public void approvalSecondForm(@RequestParam(value="id") String id, Model model) {
		
		List<String> myField = adminService.selectFieldListById(id);
		ArrayList<FieldForm> fieldList = memberService.selectField();
		ArrayList<String> categoryList = memberService.selectCategory();
		
		model.addAttribute("myField", myField);
		model.addAttribute("fieldList", fieldList);
		model.addAttribute("categoryList", categoryList);
		
	}
	
	@PostMapping("permit")
	public String permitInfo(@RequestParam(value="field") List<String> fields, 
							 @RequestParam(value="cate") String category,
							 HttpSession session) {
		
		if (category.equals("modify")) {
			Map<String, Object> infoMap = (Map<String, Object>) session.getAttribute("memberInfo");
			String id = ((CMember) infoMap.get("member")).getId();
			mypageService.updateCompanyField(id, fields);
			adminService.updatePermit(id);
			
			return "redirect:/admin/modify-request";
		}
		
		return null;
	}
	
	@GetMapping("reject")
	public void rejectInfo(@RequestParam(value = "id") String id) {
		
//		adminService.rejectPermit(id);
	}
	
	
	@PostMapping("cancel-approval")
	public String cancelApproval(HttpSession session) {
		
		
		
		return "redirect:/admin/join-finish-list";
	}
}
