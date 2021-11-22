package com.kh.hehyeop.purchase.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.hehyeop.member.model.dto.Member;
import com.kh.hehyeop.purchase.model.dto.MyPurchaseInfo;
import com.kh.hehyeop.purchase.model.service.PurchaseService;
import com.kh.hehyeop.purchase.validator.RegisterForm;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("purchase")
public class PurchaseController {
	private final PurchaseService purchaseService;
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@GetMapping("detail")
	public void purchaseDetailTest() {}
	
	@GetMapping("detail-writer")
	public void purchaseDetailWriterTest() {}
	
	@GetMapping("main")
	public void purchaseMainTest() {}
	
	@GetMapping("my-purchase")
	public void purchaseMypurchaseTest(HttpSession session
										, Model model) {
		Member authMember = (Member) session.getAttribute("authentication");
		List<MyPurchaseInfo> myPurchaseInfo = purchaseService.selectMyPurchaseInfo(authMember.getId());
		model.addAttribute("myPurchaseInfo", myPurchaseInfo);
	}
	
	@GetMapping("regist")
	public void purchaseRegistTest(Model model) {
		model.addAttribute(new RegisterForm());
	}
	
	@GetMapping("request")
	public void purchaseRequestTest() {}
	
	@PostMapping("register")
	public String register(RegisterForm form, Model model, HttpSession session, RedirectAttributes redirectAttr) {
		
		Member member = (Member) session.getAttribute("authentication");
		form.setId(member.getId());
		
		
		return "redirect:/purchase/regist";
		
	}
}
