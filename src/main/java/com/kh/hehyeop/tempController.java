package com.kh.hehyeop;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("include")
public class tempController {

	@GetMapping("head/menu-head")
	public void menuHead() { }
}
