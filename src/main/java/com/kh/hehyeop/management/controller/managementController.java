package com.kh.hehyeop.management.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("management")
public class managementController {
	
	@GetMapping("myIcebox")
	public void test() {}
	
	@GetMapping("myIcebox_note")
	public void test2() {}
	
	@GetMapping("myIcebox_modify")
	public void test3() {}
	
	@GetMapping("myIcebox_cart")
	public void test4() {}
	
	@GetMapping("myAccountBook")
	public void test5() {}
	
	@GetMapping("myAccountList")
	public void test6() {}
}
