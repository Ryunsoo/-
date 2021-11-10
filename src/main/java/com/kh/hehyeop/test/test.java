package com.kh.hehyeop.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("head")
public class test {

	@GetMapping("head")
	public void index() {
	}
}