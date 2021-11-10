package com.kh.hehyeop.index;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.hehyeop.main.model.service.MainService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class IndexController {

	private final MainService mainService;
	
	@GetMapping("/")
	public String index() {
		System.out.println(mainService.test());
		return "index";
	}
}
