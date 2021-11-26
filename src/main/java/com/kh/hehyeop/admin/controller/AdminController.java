package com.kh.hehyeop.admin.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.hehyeop.admin.model.dto.CMember;
import com.kh.hehyeop.admin.model.service.AdminService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("admin")
@RequiredArgsConstructor
public class AdminController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private final AdminService adminService;
	
	@GetMapping("join-request")
	public String joinRequestForm(HttpSession session, RedirectAttributes redirectAttr) {
		
		CMember member = adminService.selectJoinRequest();
		session.setAttribute("joinRequestList", member);
		logger.debug(member.toString());
		
		return "admin/join-request";
	}
	
	@GetMapping("finish-list")
	public void finishListForm() {}
	
	@GetMapping("approval-first")
	public void approvalFirstForm() {}
	
	@GetMapping("approval-second")
	public void approvalSecondForm() {}
}
