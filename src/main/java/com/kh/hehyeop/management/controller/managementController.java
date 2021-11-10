package com.kh.hehyeop.management.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("management")
public class managementController {
	@GetMapping("myIcebox")
	public void test() {}
}
