package com.kh.hehyeop.purchase.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("purchase")
public class PurchaseController {

	@GetMapping("detail")
	public void purchaseDetailTest() {}
	
	@GetMapping("detail-writer")
	public void purchaseDetailWriterTest() {}
	
	@GetMapping("main")
	public void purchaseMainTest() {}
	
	@GetMapping("my-purchase")
	public void purchaseMypurchaseTest() {}
	
	@GetMapping("regist")
	public void purchaseRegistTest() {}
	
	@GetMapping("request")
	public void purchaseRequestTest() {}
	
}
