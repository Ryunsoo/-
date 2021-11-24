package com.kh.hehyeop.purchase.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.hehyeop.common.code.ErrorCode;
import com.kh.hehyeop.common.exception.HandlableException;
import com.kh.hehyeop.common.util.paging.Paging;
import com.kh.hehyeop.member.model.dto.Member;
import com.kh.hehyeop.mypage.model.dto.MyAddress;
import com.kh.hehyeop.purchase.model.dto.DetailInfo;
import com.kh.hehyeop.purchase.model.dto.MyPurchaseInfo;
import com.kh.hehyeop.purchase.model.dto.PurchaseMain;
import com.kh.hehyeop.purchase.model.service.PurchaseService;
import com.kh.hehyeop.purchase.validator.RegisterForm;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("purchase")
@RequiredArgsConstructor
public class PurchaseController {
	private final PurchaseService purchaseService;
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@GetMapping("detail")
	public void purchaseDetailTest(HttpSession session, String regIdx) {
		
		MyPurchaseInfo purchaseInfo = purchaseService.selectPurchaseInfoByIdx(regIdx);
		int buyNum = purchaseService.selectBuyNum(regIdx);
		String dealDate = purchaseInfo.getDealTime().replace("T","  ");
		String endDate = purchaseInfo.getEndTime().replace("T","  ");
		purchaseInfo.setDealTime(dealDate);
		purchaseInfo.setEndTime(endDate);
		session.setAttribute("purchaseInfo", purchaseInfo);
		session.setAttribute("buyNum", buyNum);
	}
	
	@GetMapping("detail-writer")
	public void purchaseDetailWriterTest(Model model, HttpSession session, String regIdx) {
		DetailInfo detailInfo = purchaseService.selectPurchaseDetail(regIdx);
		Member member = (Member) session.getAttribute("authentication");
		
		if (!detailInfo.getId().equals(member.getId())) {
			throw new HandlableException(ErrorCode.MATCH_BOARD_ERROR);
		}
		
		int buyNum = purchaseService.selectBuyNum(regIdx);
		String dealDate = detailInfo.getDealTime().replace("T","  ");
		String endDate = detailInfo.getEndTime().replace("T","  ");
		detailInfo.setDealTime(dealDate);
		detailInfo.setEndTime(endDate);
		
		session.setAttribute("detailInfo", detailInfo);
		model.addAttribute("buyNum", buyNum);
	}
	
	@GetMapping("purchase-commit")
	public String purchaseCommit(@RequestParam(value = "id") String id,
			 					 @RequestParam(value = "regIdx") String regIdx,
			 					 HttpSession session) throws ParseException {
		
		DetailInfo detailInfo = (DetailInfo) session.getAttribute("detailInfo");
		SimpleDateFormat fDate = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date test = fDate.parse(detailInfo.getDealTime());
		Date today = new Date();
		
		if (today.compareTo(test) == -1) {
			throw new HandlableException(ErrorCode.MATCH_DATE_ERROR);
		}
		
		List<String> joinIdList = purchaseService.selectJoinId(regIdx);
		List<String> joinIdxList = purchaseService.selectJoinList(regIdx);
		
		if(joinIdList != null && joinIdxList != null) {
			purchaseService.updateJoinPoint(joinIdList, joinIdxList, regIdx);
			purchaseService.updatePoint(id);
		}
		
		return "redirect:/purchase/main";
	}
	
	@GetMapping("main")
	public void purchaseMainTest(HttpSession session,
								 Model model, Paging paging,
								 @RequestParam(value = "nowPage", required = false) String nowPage,
								 @RequestParam(value = "cntPerPage", required = false) String cntPerPage,
								 @RequestParam(value = "grade", required = false) String grade,
								 @RequestParam(value = "area", required = false) boolean myArea,
								 @RequestParam(value = "keyword", required = false) String keyword) {
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "20";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "20";
		}
		
		Member member = (Member) session.getAttribute("authentication");
		List<String> addressList = new ArrayList<String>();
		
		if (grade == null) grade = "all";
		
		if(myArea) {
			MyAddress address = purchaseService.selectAddress("1992554869");
			addressList.add(address.getAddress1());
			if(address.getAddress2() != null) addressList.add(address.getAddress2());
			if(address.getAddress3() != null) addressList.add(address.getAddress3());
			session.setAttribute("btn", "on");
		} else {
			addressList = null;
			session.setAttribute("btn", "off");
		}
		
		int total = purchaseService.countRegister(grade, addressList, keyword);
		paging = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		List<PurchaseMain> registerList = purchaseService.selectRegisterList(grade, addressList, keyword, paging);
		List<Object> joinCount = purchaseService.selectjoinCount(grade, addressList, keyword, paging);
		
		List<Map<String, Object>> registerMap = new ArrayList<Map<String,Object>>();
		
		for (int i=0; i<registerList.size(); i++) {
			registerMap.add(Map.of("registerInfo", registerList.get(i), "count", joinCount.get(i)));
		}
		
		model.addAttribute("registerMap", registerMap);
		model.addAttribute("paging", paging);
		model.addAttribute("keyword", keyword);
		model.addAttribute("grade", grade);
		model.addAttribute("area", myArea);
	}
	
	@GetMapping("my-purchase")
	public void purchaseMypurchase(HttpSession session
										, Model model
										, Paging paging
							, @RequestParam(value="nowPage", required = false) String nowPage
							, @RequestParam(value="cntPerPage", required = false) String cntPerPage
							, @RequestParam(value="ongoing", required = false) String ongoing
							, @RequestParam(value="done", required = false) String done) {
		
		System.out.println("ongoing : " + ongoing);
		System.out.println("done : " + done);
		
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "3";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "3";
		}
		
		Member authMember = (Member) session.getAttribute("authentication");
		String id = authMember.getId();
		int total = purchaseService.countMyPurchase(ongoing, done, id);
		
		System.out.println("total : " + total);
		paging = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		
		List<MyPurchaseInfo> myPurchaseInfo = purchaseService.selectMyPurchaseInfo(paging, ongoing, done, id);
		for (MyPurchaseInfo info : myPurchaseInfo) {
			info.setDealTime(info.getDealTime().replace("T", " "));
			System.out.println("ongoing : " + info.getOngoing());
		}
		model.addAttribute("paging", paging);
		model.addAttribute("myPurchaseInfo", myPurchaseInfo);
	}
	
	@GetMapping("participants-list")
	@ResponseBody
	public List<MyPurchaseInfo> purchaseParticipantsList(Model model 
										,@RequestParam("regIdx") String regIdx) {
		List<MyPurchaseInfo> participantsList = purchaseService.purchaseParticipantsList(regIdx);
		return participantsList;
	}
	
	@GetMapping("regist")
	public void purchaseRegistTest(Model model) {
		model.addAttribute(new RegisterForm());
	}
	
	@GetMapping("request")
	public void purchaseRequestTest(HttpSession session, String regIdx) {
		MyPurchaseInfo purchaseInfo = purchaseService.selectPurchaseInfoByIdx(regIdx);
		Member member = (Member) session.getAttribute("authentication");
		String id = member.getId();
		int cash = purchaseService.getCash(id);
		purchaseInfo.setCash(cash);
		logger.debug(purchaseInfo.toString());
		String dealDate = purchaseInfo.getDealTime().replace("T","  ");
		String endDate = purchaseInfo.getEndTime().replace("T","  ");
		purchaseInfo.setDealTime(dealDate);
		purchaseInfo.setEndTime(endDate);
		session.setAttribute("purchaseInfo", purchaseInfo);
	}
	
	
	@PostMapping("register")
	public String register(RegisterForm form, Model model, @RequestParam List<MultipartFile> files, HttpSession session, RedirectAttributes redirectAttr) {
		
		Member member = (Member) session.getAttribute("authentication");
		form.setId(member.getId());
		form.setRestNum(form.getTotalNum() - form.getBuyNum());
		
		if (purchaseService.registerInfo(form) < 0) {
			throw new HandlableException(ErrorCode.DATABASE_ACCESS_ERROR);
		}
		
		String typeIdx = purchaseService.selectRegIdx();
		
		if (purchaseService.uploadFile(files, typeIdx) < 0) {
			throw new HandlableException(ErrorCode.FAILED_FILE_UPLOAD_ERROR);
		}
		
		
		return "redirect:/purchase/main";
		
	}
	
	@GetMapping("purchase-request")
	public String purchaseRequest(String regIdx, int buyNum, HttpSession session, RedirectAttributes redirectAttr) {
		
		Member member = (Member) session.getAttribute("authentication");
		String id = member.getId();
		
		purchaseService.purchaseRequest(buyNum, id);
		MyPurchaseInfo purchaseInfo = (MyPurchaseInfo) session.getAttribute("purchaseInfo");
		int restNum = purchaseInfo.getRestNum()-buyNum;
		String join_idx = purchaseService.selectJoinIdx();
		purchaseService.purchaseMatch(regIdx, restNum, join_idx);
		int cash = purchaseInfo.getCash()-(purchaseInfo.getPrice()*buyNum);
		purchaseService.usedPoint(id, cash);
		
		return "redirect:/purchase/main";
		
	}
	
	
	
}
