package com.kh.hehyeop.main.controller;

import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MainController {
	
	@GetMapping("/")
	public String main(Model model) {
		
		String[] dateArr = {"일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"};
		String[] parseArr = new String[7];
		Date date = new Date();
		parseArr[0] = "오늘";
		parseArr[1] = "내일";
		
		for (int i=1; i<7; i++) {
			date.setDate(date.getDate() + 1);
			
			if (i > 1) {
				parseArr[i] = dateArr[date.getDay()];
			}
		}
		
		model.addAttribute("weekList", parseArr); 		
		return "main";
	}

}
