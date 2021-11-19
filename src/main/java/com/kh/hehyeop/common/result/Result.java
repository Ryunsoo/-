package com.kh.hehyeop.common.result;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("error")
public class Result {

	@GetMapping("result")
	public void result() {
		
	}
}
