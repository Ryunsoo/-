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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.hehyeop.common.code.ErrorCode;
import com.kh.hehyeop.common.exception.HandlableException;
import com.kh.hehyeop.member.model.dto.Member;
import com.kh.hehyeop.purchase.model.dto.MyPurchaseInfo;
import com.kh.hehyeop.purchase.model.service.PurchaseService;
import com.kh.hehyeop.purchase.validator.RegisterForm;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("purchase")
@RequiredArgsConstructor
public class PurchaseController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	private final PurchaseService purchaseService;

	@GetMapping("detail")
	public void purchaseDetailTest() {}
	
	@GetMapping("detail-writer")
	public void purchaseDetailWriterTest() {}
	
	@GetMapping("main")
	public void purchaseMainTest() {}
	
	@GetMapping("my-purchase")
	public void purchaseMypurchaseTest() {}
	
	@GetMapping("regist")
	public void purchaseRegistTest(Model model) {
		model.addAttribute(new RegisterForm());
	}
	
	@GetMapping("request")
	public void purchaseRequestTest(Model model, String regIdx) {
		MyPurchaseInfo purchaseInfo = purchaseService.selectPurchaseInfoByIdx(regIdx);
		logger.debug(purchaseInfo.toString());
	}
	
	
	
	@PostMapping("register")
	public String register(RegisterForm form, Model model, @RequestParam List<MultipartFile> files, HttpSession session, RedirectAttributes redirectAttr) {
		
		Member member = (Member) session.getAttribute("authentication");
		form.setId(member.getId());
		
		if (purchaseService.registerInfo(form) < 0) {
			throw new HandlableException(ErrorCode.DATABASE_ACCESS_ERROR);
		}
		
		String typeIdx = purchaseService.selectRegIdx();
		
		if (purchaseService.uploadFile(files, typeIdx) < 0) {
			throw new HandlableException(ErrorCode.FAILED_FILE_UPLOAD_ERROR);
		}
		
		
		return "redirect:/purchase/main";
		
	}
}
