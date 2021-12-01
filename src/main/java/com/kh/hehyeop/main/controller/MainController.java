package com.kh.hehyeop.main.controller;

import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.hehyeop.community.model.dto.Community;
import com.kh.hehyeop.help.model.dto.HelpRequest;
import com.kh.hehyeop.help.model.dto.Review;
import com.kh.hehyeop.main.model.dto.Purchase;
import com.kh.hehyeop.main.model.service.MainService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class MainController {
	
	private final MainService mainService;
	
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
		
		List<Purchase> purchaseList = mainService.selectPurchaseList();
		model.addAttribute("purchaseList", purchaseList);
		
		List<Community> boardList = mainService.selectBoardList();
		model.addAttribute("boardList", boardList);
		
		List<HelpRequest> requestList = mainService.selectRequestList();
		model.addAttribute("requestList", requestList);
		
		List<Review> reviewList = mainService.selectReviewList();
		model.addAttribute("reviewList", reviewList);
		
		return "main";
	}

}
