package com.kh.hehyeop.company.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("company")
public class CompanyController {

	@GetMapping("help-detail")
	public void helpDetailForm() {}
	
	@GetMapping("help-join")
	public void helpJoinFrom() {}
	
	@GetMapping("help-list")
	public void helpListForm() {}
	
	@GetMapping("ongoing-help")
	public void ongoingHelpForm() {}
	
	@GetMapping("all-help")
	public void allHelpForm() {}
	
}
