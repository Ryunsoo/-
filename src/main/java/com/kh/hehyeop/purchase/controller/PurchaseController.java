package com.kh.hehyeop.purchase.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("purchase")
public class PurchaseController {

	@GetMapping("purchase-detail")
	public void purchaseDetailTest() {}
	
	@GetMapping("purchase-detail-writer")
	public void purchaseDetailWriterTest() {}
	
	@GetMapping("purchase-main")
	public void purchaseMainTest() {}
	
	@GetMapping("purchase-mypurchase")
	public void purchaseMypurchaseTest() {}
	
	@GetMapping("purchase-regist")
	public void purchaseRegistTest() {}
	
	@GetMapping("purchase-request")
	public void purchaseRequestTest() {}
	
}
