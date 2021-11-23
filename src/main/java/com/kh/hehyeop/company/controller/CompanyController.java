package com.kh.hehyeop.company.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.hehyeop.company.model.service.CompanyService;
import com.kh.hehyeop.help.model.service.HelpService;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
@RequestMapping("company")
public class CompanyController {
	
	private final CompanyService companyService;

	@GetMapping("help-detail")
	public void helpDetailForm() {}
	
	@GetMapping("help-join")
	public void helpJoinFrom() {}
	
	@GetMapping("main")
	public void helpListForm() {}
	
	@GetMapping("ongoing-help")
	public void ongoingHelpForm() {}
	
	@GetMapping("my")
	public void allHelpForm() {}
	
}
