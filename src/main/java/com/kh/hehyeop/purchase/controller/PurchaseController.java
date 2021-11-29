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

import com.kh.hehyeop.common.chat.model.repository.ChatRepository;
import com.kh.hehyeop.common.chat.model.service.ChatServiceImpl;
import com.kh.hehyeop.common.code.ErrorCode;
import com.kh.hehyeop.common.exception.HandlableException;
import com.kh.hehyeop.common.util.address.AddressUtil;
import com.kh.hehyeop.common.util.paging.Paging;
import com.kh.hehyeop.member.model.dto.Member;
import com.kh.hehyeop.mypage.model.dto.MyAddress;
import com.kh.hehyeop.purchase.model.dto.DetailInfo;
import com.kh.hehyeop.purchase.model.dto.MyPurchaseInfo;
import com.kh.hehyeop.purchase.model.dto.PurchaseMain;
import com.kh.hehyeop.purchase.model.repository.PurchaseRepository;
import com.kh.hehyeop.purchase.model.service.PurchaseService;
import com.kh.hehyeop.purchase.validator.RegisterForm;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("purchase")
@RequiredArgsConstructor
public class PurchaseController {
	private final PurchaseService purchaseService;
	private final ChatRepository chatRepository;
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@GetMapping("detail")
	public void purchaseDetailTest(HttpSession session, String regIdx) throws ParseException  {
		DetailInfo detailInfo = purchaseService.selectPurchaseDetail(regIdx);
		MyPurchaseInfo purchaseInfo = purchaseService.selectPurchaseInfoByIdx(regIdx);
		
		Member member = (Member) session.getAttribute("authentication");
		String id = member.getId();
		int buyNum = purchaseService.selectBuyNum(regIdx);
		Integer ongoing = purchaseService.ongoing(regIdx,id);
		purchaseInfo.setOngoing(ongoing);
		System.out.println(buyNum);
		SimpleDateFormat fDate = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date test = fDate.parse(purchaseInfo.getDealTime());
		Date today = new Date();
		
		if (today.compareTo(test) == 1) {
			session.setAttribute("dealTime", "Y");
		}
		session.setAttribute("detailInfo", detailInfo);
		session.setAttribute("purchaseInfo", purchaseInfo);
		session.setAttribute("buyNum", buyNum);
		logger.debug("test : " + test + " today : " + today + " 비교 : " + today.compareTo(test) + "dealTime : " + today.compareTo(test));
	}
	
	@GetMapping("detail-writer")
	public void purchaseDetailWriterTest(Model model, HttpSession session, String regIdx) {
		DetailInfo detailInfo = purchaseService.selectPurchaseDetail(regIdx);
		Member member = (Member) session.getAttribute("authentication");
		
		if (!detailInfo.getId().equals(member.getId())) {
			throw new HandlableException(ErrorCode.MATCH_BOARD_ERROR);
		}
		MyPurchaseInfo myPurchaseInfo = purchaseService.detailRemoveCheck(regIdx, member.getId());
		
		
		int buyNum = purchaseService.selectBuyNum(regIdx);
		
		List<String> match = purchaseService.findBuyer(regIdx);
		
		session.setAttribute("detailInfo", detailInfo);
		session.setAttribute("myPurchaseInfo", myPurchaseInfo);
		session.setAttribute("match", match);
		model.addAttribute("buyNum", buyNum);
		
		String removeButtonFlg = null;
		if(myPurchaseInfo.getMatchIdx() != null) {
			removeButtonFlg = "on";
			model.addAttribute("removeButtonFlg", removeButtonFlg);
		}
		
		System.out.println("~~~~~match : " + match + "myPurchaseInfo : " + myPurchaseInfo.getDone());
	}
	
	@GetMapping("purchase-commit")
	public String purchaseCommit(@RequestParam(value = "regIdx") String regIdx,
			 					 HttpSession session, RedirectAttributes redirectAttr) throws ParseException {
		
		DetailInfo detailInfo = (DetailInfo) session.getAttribute("detailInfo");
		List<String> joinIdxList = purchaseService.selectJoinList(regIdx);
		
		if (joinIdxList.isEmpty()) {
			throw new HandlableException(ErrorCode.EMPTY_JOIN_ERROR);
		}
		purchaseService.updateDone(regIdx);
		purchaseService.updateJoinStatus(joinIdxList);
		redirectAttr.addFlashAttribute("message", "구매 확정이 완료되었습니다.");
		
		return "redirect:/purchase/detail-writer?regIdx="+regIdx;
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
			MyAddress address = purchaseService.selectAddress(member.getId());
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
										, MyPurchaseInfo field
							, @RequestParam(value="nowPage", required = false) String nowPage
							, @RequestParam(value="cntPerPage", required = false) String cntPerPage
							, @RequestParam(value="ongoing", required = false) String ongoing
							, @RequestParam(value="done", required = false) String done) {
		
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		
		
		if(done!=null && !done.isEmpty()) {
			ongoing = null;
		}
		
		if(ongoing != null && !ongoing.isEmpty()) {
			done = null;
			field.setOngoing(Integer.parseInt(ongoing));
		}
		
		
		
		Member authMember = (Member) session.getAttribute("authentication");
		String id = authMember.getId();
		int total = purchaseService.countMyPurchase(ongoing, done, id);
		
		paging = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		List<MyPurchaseInfo> myPurchaseInfo = purchaseService.selectMyPurchaseInfo(paging, ongoing, done, id);
		
		if(ongoing == null && done==null) {
			ongoing = "4";
			field.setOngoing(Integer.parseInt(ongoing));
		}
		field.setDone(done);
		model.addAttribute("paging", paging);
		model.addAttribute("myPurchaseInfo", myPurchaseInfo);
		session.setAttribute("field", field);
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
		session.setAttribute("purchaseInfo", purchaseInfo);
	}
	
	
	@PostMapping("register")
	public String register(RegisterForm form, Model model, @RequestParam List<MultipartFile> files, HttpSession session, RedirectAttributes redirectAttr) {
		
		Member member = (Member) session.getAttribute("authentication");
		AddressUtil convertAddr = new AddressUtil();
		
		form.setId(member.getId());
		form.setRestNum(form.getTotalNum() - form.getBuyNum());
		String dealDate = form.getDealTime().replace("T"," ");
		String endDate = form.getEndTime().replace("T"," ");
		form.setDealTime(dealDate);
		form.setEndTime(endDate);
		form.setOldAddr(convertAddr.trimOldAddress(form.getOldAddr()));
		
		logger.debug(files.toString());
			
		if (files.get(0).getOriginalFilename().isEmpty()) {
			redirectAttr.addFlashAttribute("message", "파일을 첨부해주세요");
			return "redirect:/purchase/regist";
		}
		
		purchaseService.registerInfo(form);
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
		
		purchaseService.purchaseRequest(buyNum, id); //purchase join 테이블
		
		MyPurchaseInfo purchaseInfo = (MyPurchaseInfo) session.getAttribute("purchaseInfo"); // V_SELECT_PURCHASE_REQUEST를 통해 조회한 값이 들어있는 MypurchaseInfo
		
		int restNum = purchaseInfo.getRestNum()-buyNum; // 판매자의 물건 남은 수량 (register 테이블)
		String join_idx = purchaseService.selectJoinIdx(); // joinIdx 찾기
		int matchLockedCash = purchaseInfo.getPrice()*buyNum; // 내가 산 물건 가격 => match 테이블 cash_lock
		int cash = purchaseInfo.getCash()- matchLockedCash; // wallet에 있는 총 cash - 내가 산 물건 가격
		int WalletLockedCash = matchLockedCash; // 내가 산 물건 가격 + wallet에 있는 lock_cash => 총 lock_cash
		
		
		purchaseService.updateWallet(id, cash, WalletLockedCash); // wallet의 cash 차감, cash_lock 업데이트
		purchaseService.purchaseMatch(regIdx, restNum, join_idx, matchLockedCash); // match 테이블 insert
		
		return "redirect:/purchase/detail?regIdx="+regIdx;
		
	}
	
	
	@GetMapping("deal-done")
	public String dealDone(String regIdx, HttpSession session, RedirectAttributes redirectAttr) {
		
		Member member = (Member) session.getAttribute("authentication");
		String id = member.getId();
		
		MyPurchaseInfo purchaseInfo = (MyPurchaseInfo) session.getAttribute("purchaseInfo"); // V_SELECT_PURCHASE_REQUEST를 통해 조회한 값이 들어있는 MypurchaseInfo
		
		String sellerId = purchaseInfo.getSellerId();
		int LockedCash = purchaseService.selectLockedCash(id ,regIdx); //match
		int totalLockedcash = purchaseService.getTotalLockedCash(id)-LockedCash; //wallet lock cash update
		String joinIdx = purchaseService.selectMyJoinIdx(id, regIdx); //joinIdx
		purchaseService.sendCashtoSeller(sellerId, LockedCash); //seller 에게 lock cash 보내기
		purchaseService.updateMatchLockedCashAndOngoing(joinIdx,regIdx); // match 테이블 해당 regIdx lock cash reset / ongoing 2
		purchaseService.updateWalletLockedCash(id, totalLockedcash); // wallet에서 총 lock cash에서 구매 lock cash 차감
		// purchaseService.dealDone(regIdx); // register 테이블에 done Y <- 참가자 한사람이 거래완료
		purchaseService.purchaseUpdatePoint(id); //구매자 1 포인트 업
		// purchaseService.SellerUpdatePoint(sellerId); //판매자 3 포인트 업
		
		return "redirect:/purchase/main";
		
	}
	
	@GetMapping("buyer-cancel")
	public String buyerCancel(String regIdx, HttpSession session, RedirectAttributes redirectAttr) {
		
		Member member = (Member) session.getAttribute("authentication");
		String id = member.getId();
		
		String joinIdx = purchaseService.selectMyJoinIdx(id, regIdx);
		int cash = purchaseService.selectLockedCash(id ,regIdx); //match lock cash
		int buyNum = purchaseService.selectCancelBuyNum(joinIdx);
		purchaseService.returnLockedCash(id, cash); // wallet에 match에 묶여있던 lock cash 반환
		purchaseService.buyerCancel(joinIdx, regIdx); //match 테이블에 ongoing 3으로 변경 / lock cash 0
		purchaseService.plusRestNum(regIdx, buyNum); //register 테이블에 restNum update
		
		
		
		return "redirect:/purchase/main";
		
	}
	
	@GetMapping("detail-remove")
	public String detailRemoveCheck(String regIdx, HttpSession session) {
		
		Member member = (Member) session.getAttribute("authentication");
		String id = member.getId();
		
		MyPurchaseInfo myPurchaseInfo = purchaseService.detailRemoveCheck(regIdx, id);
		System.out.println(myPurchaseInfo.getMatchIdx());
		if(myPurchaseInfo.getMatchIdx() != null) {
			throw new HandlableException(ErrorCode.DATABASE_ACCESS_ERROR);
		}
		
		purchaseService.detailRemove(regIdx, id);
		
		return "redirect:/purchase/main";
	}
	
	@GetMapping("create-chat")
	public String createChat(String id, String regIdx, HttpSession session, RedirectAttributes redirectAttr) {
		
		List<String> idList = purchaseService.findChatList(regIdx);
		idList.add(id);
		
		chatRepository.insertChatRoom(idList);
		
		redirectAttr.addFlashAttribute("message", "단톡방 개설이 완료되었습니다.");
		
		return "redirect:/purchase/detail-writer?regIdx="+regIdx;
	}
	
}
