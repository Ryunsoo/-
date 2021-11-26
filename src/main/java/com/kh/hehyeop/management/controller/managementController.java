package com.kh.hehyeop.management.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.hehyeop.management.model.service.ManagementService;
import com.kh.hehyeop.management.validator.PersonalForm;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("management")
public class managementController {
	
	private final ManagementService managementService;
	
	@GetMapping("myIcebox")
	public void test() {}
	
	@GetMapping("myIcebox_note")
	public void test2() {}
	
	@GetMapping("myIcebox_modify")
	public void test3() {}
	
	@GetMapping("myIcebox_cart")
	public void test4() {}
	
	@GetMapping("myAccountBook")
	public void myAccountBookForm() {
		
	}
	
	@GetMapping("personal_spend")
	public String savePersonalSpend(PersonalForm form) {
		System.out.println(form);
		
		return "redirect:/management/myAccountBook";
	}
	
	@GetMapping("fixed_spend")
	public void saveFixedSpend() {
		
	}
	
	@GetMapping("myAccountList")
	public void test6() {}
}
