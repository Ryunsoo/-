package com.kh.hehyeop.help.controller;

import java.nio.file.spi.FileSystemProvider;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.hehyeop.common.code.Field;
import com.kh.hehyeop.common.push.PushSender;
import com.kh.hehyeop.common.util.address.AddressUtil;
import com.kh.hehyeop.common.util.file.FileDTO;
import com.kh.hehyeop.common.util.page.Page;
import com.kh.hehyeop.common.util.paging.Paging;
import com.kh.hehyeop.common.validator.ValidateResult;
import com.kh.hehyeop.company.model.dto.ProField;
import com.kh.hehyeop.help.model.dto.EstimateList;
import com.kh.hehyeop.help.model.dto.HelpRequest;
import com.kh.hehyeop.help.model.dto.HelpResponse;
import com.kh.hehyeop.help.model.dto.MyHehyeop;
import com.kh.hehyeop.help.model.dto.Review;
import com.kh.hehyeop.help.model.service.HelpService;
import com.kh.hehyeop.help.validator.RequestForm;
import com.kh.hehyeop.help.validator.RequestFormValidator;
import com.kh.hehyeop.member.model.dto.CMember;
import com.kh.hehyeop.member.model.dto.Member;
import com.kh.hehyeop.member.model.dto.User;
import com.kh.hehyeop.mypage.model.dto.MyAddress;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("help")
public class HelpController {

	Logger logger = LoggerFactory.getLogger(this.getClass());

	private final HelpService helpService;
	private final RequestFormValidator requestFormValidator;
	private final PushSender pushSender;

	@GetMapping("main")
	public void help1(HttpSession session) {
		Map<String, List<ProField>> proFiledMap = new HashMap<String, List<ProField>>();
		proFiledMap.put("category", helpService.selectCategoryList());
		proFiledMap.put("proField", helpService.selectProFieldList());

		session.setAttribute("proFieldMap", proFiledMap);
	}

	@GetMapping("my-hehyeop")
	public void myHehyeop(HttpSession session, Model model) {
		Member member = (Member) session.getAttribute("authentication");
		List<MyHehyeop> helpList = helpService.getHelpRequestList(member.getId());
		System.out.println(helpList);
		//전체 리스트
		session.setAttribute("helpListAll", helpList);
		
		//페이지 객체 생성
		Page page = Page.builder()
				.url("/help/help-list")
				.blockCnt(5)
				.cntPerPage(5)
				.currentPage(1)
				.total(helpList.size())
				.build();
		
		model.addAttribute("helpList", helpList.subList(0, page.getSubListToIdx()));
		model.addAttribute("paging", page);
	}
	
	@GetMapping("help-list")
	@ResponseBody
	public Map<String, Object> helpList(HttpSession session
										, @RequestParam(required = false, defaultValue = "1") int page
										, @RequestParam(required = false, defaultValue = "all")	String filter) {
		Map<String, Object> commandMap = new HashMap<String, Object>();
		List<MyHehyeop> helpList = (List<MyHehyeop>) session.getAttribute("helpListAll");
		List<MyHehyeop> filterList = new ArrayList<MyHehyeop>();
		System.out.println("필터링 : " + filter);
		System.out.println("페이지 : " + page);
		
		if(!filter.equals("all")) {
			helpList.forEach(e -> {
				if(e.getOngoing().equals(filter)) {
					filterList.add(e);
				}
			});
			helpList = filterList;
		}
		
		if(helpList.size() == 0) {
			Page paging = Page.builder()
					.url("/help/help-list")
					.blockCnt(5)
					.cntPerPage(5)
					.currentPage(page)
					.total(1)
					.build();
			commandMap.put("noList", "noList");
			commandMap.put("paging", paging);
			return commandMap;
		}
		
		System.out.println("필터링된 리스트 : " + helpList);
		Page paging = Page.builder()
				.url("/help/help-list")
				.blockCnt(5)
				.cntPerPage(5)
				.currentPage(page)
				.total(helpList.size())
				.build();
		
		commandMap.put("helpList", helpList.subList((page-1)*5, paging.getSubListToIdx()));
		commandMap.put("paging", paging);
		
		return commandMap;
	}

	@GetMapping("review")
	public void review(HttpSession session, Model model, Paging paging
			, @RequestParam(value = "nowPage", required = false) String nowPage
			, @RequestParam(value = "cntPerPage", required = false) String cntPerPage
			, @RequestParam(value = "field", required = false) String field
			, @RequestParam(value = "myArea", required = false) boolean myArea) {
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "10";
		}
		
		if (field == null)
			field = "all";
		
		List<Review> reviewList = new ArrayList<Review>();
		List<String> addressList = new ArrayList<String>();
		
		if(myArea) {
			session.setAttribute("myArea", "on");
			Member member = (Member) session.getAttribute("authentication");
			MyAddress myAddress = helpService.selectMyAreaList(member.getId());
			
			addressList.add(myAddress.getAddress1());
			if(myAddress.getAddress2() != null) addressList.add(myAddress.getAddress2());
			if(myAddress.getAddress3() != null) addressList.add(myAddress.getAddress3());	
			
			int total = helpService.countReview(field, addressList);
			paging = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			
			reviewList = helpService.selectReviewList(paging, field, addressList);
		}else {
			session.setAttribute("myArea", "off");
			MyAddress myAddress = null;
			int total = helpService.countReview(field, null);
			paging = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			
			reviewList = helpService.selectReviewList(paging, field, null);
		}
		
		model.addAttribute("paging", paging);
		model.addAttribute("reviewList", reviewList);
		model.addAttribute("fieldList", Field.getFieldList());

		session.setAttribute("filter", field);
		
	}

	@InitBinder(value = "requestForm") // model의 속성 중 속성명이 joinForm인 속성이 있는 경우 initBinder 메서드 실행
	public void initBinder(WebDataBinder webDataBinder) {
		webDataBinder.addValidators(requestFormValidator);
	}

	@GetMapping("request")
	public String helpRequest(HttpSession session, String field, Model model) {
		Member member = (Member) session.getAttribute("authentication");
		session.setAttribute("field", field);
		model.addAttribute(new RequestForm()).addAttribute("error", new ValidateResult().getError());
		return "help/request";
	}

	@PostMapping("uploadRequest")
	public String uploadRequset(@Validated RequestForm form, Errors errors, Model model, HelpRequest helpRequest,
			String detailAddress, @RequestParam List<MultipartFile> files, HttpSession session) {
		ValidateResult vr = new ValidateResult();
		model.addAttribute("error", vr.getError());
		logger.debug("------------에러야 있니 : " + errors.toString());

		if (errors.hasErrors()) {
			vr.addErrors(errors);
			return "help/request";
		}
		User user = (User) session.getAttribute("authentication");
		String reqIdx = "";

		//신주소
		helpRequest.setReqAddress(helpRequest.getReqAddress() + " " + detailAddress);
		System.out.println("옴뇸뇸뇸 : " + helpRequest.getReqAddress());
		//구주소
		AddressUtil convertAddr = new AddressUtil();
		helpRequest.setOldAddress(convertAddr.trimOldAddress(helpRequest.getOldAddress()));

		//1. helpRequest 등록하고 req_idx 가져오기
		helpRequest.setId(user.getId());
		int resReq = helpService.insertRequest(helpRequest);
		if (resReq == 1) {
			reqIdx = helpService.selectReqIdx(helpRequest); //아이디, 이름, 시간
		}
		//2. file업로드 하기
		int resFile = helpService.uploadFile(files, reqIdx);
		if (resFile == 1) {
			System.out.println("신청서 제출 성공");
		}
		return "redirect:/help/my-hehyeop";
	}

	//해협 삭제 
	@GetMapping("deleteHelp")
	public String deleteHelp(String reqIdx, RedirectAttributes redirectAttr) {
		int res = helpService.deleteRequest(reqIdx);
		redirectAttr.addFlashAttribute("message","해협 삭제가 완료 되었습니다.");
		return "redirect:/help/my-hehyeop";
	}

	//해협 끌올
	@GetMapping("refreshHelp")
	public String refreshHelp(String reqIdx, RedirectAttributes redirectAttr) {
		int res = helpService.refreshRequest(reqIdx);
		redirectAttr.addFlashAttribute("message","해협 순서 끝어올리기가 완료되었습니다.");
		return "redirect:/help/my-hehyeop";
	}
	//해협 취소
	@GetMapping("cancelHelp")
	public String cancelHelp(String reqIdx, RedirectAttributes redirectAttr) {
		int res = helpService.cancelRequest(reqIdx);
		if(res == 0) {
			redirectAttr.addFlashAttribute("message","해협 취소 요청이 완료되었습니다.");
		}else if(res == 1) {
			redirectAttr.addFlashAttribute("message","해협이 취소 처리되었습니다.");
		}else {
			redirectAttr.addFlashAttribute("message","매칭상태가 올바르지 않습니다. 다시 선택해주세요.");
		}
		return "redirect:/help/my-hehyeop";
	}
	//해협 완료
	@GetMapping("completeHelp")
	public String completeHelp(String reqIdx, RedirectAttributes redirectAttr) {
		int res = helpService.completeRequest(reqIdx);
		if(res == 0) {
			redirectAttr.addFlashAttribute("message","해협 완료 요청이 완료되었습니다.");
		}else if(res == 1) {
			redirectAttr.addFlashAttribute("message","해협이 완료 처리되었습니다.");
		}else {
			redirectAttr.addFlashAttribute("message","매칭상태가 올바르지 않습니다. 다시 선택해주세요.");
		}
		return "redirect:/help/my-hehyeop";
	}
	//리뷰 등록
	@GetMapping("registReview")
	public String registReview(String reqIdx, double score, String comment, RedirectAttributes redirectAttr) {
		System.out.println("score : " + comment);
		String[] tempArr = comment.split(",");
		System.out.println("score : " + Arrays.toString(tempArr));
		helpService.registReview(reqIdx, score, tempArr); 
		redirectAttr.addFlashAttribute("message","리뷰등록이 완료되었습니다."); 
		return "redirect:/help/my-hehyeop";
	}
	
	@GetMapping("my-hehyeop-detail")
	@ResponseBody
	public Map<String, Object> myHehyeopDetail(String reqIdx) {
		Map<String, Object> commandMap = helpService.selectHehyeopDetail(reqIdx);
		return commandMap;
	}
	
	@GetMapping("my-hehyeop-estimate")
	@ResponseBody
	public List<EstimateList> myHehyeopEstimate(String reqIdx) {
		List<EstimateList> estimateList = helpService.selectHehyeopResponse(reqIdx);
		System.out.println(estimateList);
		return estimateList;
	}
	
	@GetMapping("my-hehyeop-estimateFile")
	@ResponseBody
	public List<FileDTO> myHehyeopEstimateFile(String resIdx) {
		List<FileDTO> estimateFile = helpService.selectEstimateFile(resIdx);
		System.out.println(estimateFile);
		return estimateFile;
	}
	
	@GetMapping("review-comments")
	@ResponseBody
	public List<String> comments(String helpIdx) {
		List<String> commentsList = helpService.selectCommentsList(helpIdx);
		return commentsList;
	}
	
	@GetMapping("choice-company")
	public String choiceCompany(HttpSession session, RedirectAttributes redirectAttr
								,String cid, String resIdx
								,int resPay, String reqIdx ,String payWay) {
		
		Member member = (Member) session.getAttribute("authentication");
		String id = member.getId();
		CMember cmember = new CMember();
		cmember.setId(cid);
		
		String res = helpService.choiceCompany(Map.of("id",id,"cid",cid,"resIdx",resIdx,"resPay",resPay,"reqIdx",reqIdx,"payWay",payWay));
		
		if(res.equals("success")) {
			redirectAttr.addFlashAttribute("message","업체 선택이 완료되었습니다.");
			String reqName = helpService.selectReqNameByReqIdx(reqIdx);
			pushSender.send(cmember, "자취해협", reqName + "님과 매칭되었습니다. 거래를 진행해주세요.");
			return "redirect:/help/my-hehyeop";
		}else {
			redirectAttr.addFlashAttribute("message","현재 보유 캐시가 부족해 마이페이지로 이동합니다.");
			return "redirect:/mypage/mypage-common";
		}
	}
	
	@GetMapping("chat-push")
	@ResponseBody
	public void chatPush(String friendId, String reqIdx) {
		User user = new User();
		user.setId(friendId);
		helpService.chatPush(user, reqIdx);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
