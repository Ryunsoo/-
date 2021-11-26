package com.kh.hehyeop.admin.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.hehyeop.admin.model.dto.CMember;
import com.kh.hehyeop.admin.model.service.AdminService;
import com.kh.hehyeop.common.util.paging.Paging;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("admin")
@RequiredArgsConstructor
public class AdminController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private final AdminService adminService;
	
	@GetMapping("join-request")
	public String joinRequestForm(HttpSession session, RedirectAttributes redirectAttr) {
		
		List<CMember> testList = adminService.selectJoinRequest();
		session.setAttribute("joinRequestList", testList);
		logger.debug(testList.toString());
		
		return "admin/join-request";
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
	
	@GetMapping("finish-list")
	public void finishListForm() {}
	
	@GetMapping("approval-first")
	public void approvalFirstForm() {}
	
	@GetMapping("approval-second")
	public void approvalSecondForm() {}
}
