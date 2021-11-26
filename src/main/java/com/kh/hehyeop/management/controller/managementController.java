package com.kh.hehyeop.management.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.hehyeop.management.model.dto.Icebox;
import com.kh.hehyeop.management.model.service.ManagementService;
import com.kh.hehyeop.management.validator.PersonalForm;
import com.kh.hehyeop.member.model.dto.Member;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("management")
public class managementController {
	
	private final ManagementService managementService;
	
	@GetMapping("myIcebox")
	public void test() {}
	
	@GetMapping("myIcebox_note")
	public void test2(HttpSession session, Model model, 
						@RequestParam(value = "category", required = false) String category) {
		
		if(category == null) category = "0";
		Member member = (Member) session.getAttribute("authentication");
		
		List<Icebox> iceboxUpList = managementService.selectIceboxUpList(member.getId(), category);
		List<Icebox> iceboxDownList = managementService.selectIceboxDownList(member.getId(), category);
		
		System.out.println("sdfsdfsdfsdfsd : " + iceboxUpList);
		System.out.println("sdfsdfsdfsdfsd : " + iceboxDownList);
		
		session.setAttribute("category",category);
		model.addAttribute("iceboxUpList", iceboxUpList);
		model.addAttribute("iceboxDownList", iceboxDownList);
		
	}
	
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
	
	@GetMapping("plusItem")
	@ResponseBody
	public void plusItem(HttpSession session, String item, String date) throws ParseException {
		
		Member member = (Member) session.getAttribute("authentication");
		
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.parse(date);
		
		
	}
}
