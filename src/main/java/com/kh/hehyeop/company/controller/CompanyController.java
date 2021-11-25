package com.kh.hehyeop.company.controller;


import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.hehyeop.common.code.Config;
import com.kh.hehyeop.common.util.paging.Paging;
import com.kh.hehyeop.company.model.dto.CompanyField;
import com.kh.hehyeop.company.model.dto.MyRequest;
import com.kh.hehyeop.common.validator.ValidateResult;
import com.kh.hehyeop.company.model.dto.RequestDetail;
import com.kh.hehyeop.company.model.service.CompanyService;
import com.kh.hehyeop.company.validator.ResponseForm;
import com.kh.hehyeop.company.validator.ResponseFormValidator;
import com.kh.hehyeop.help.model.dto.HelpRequest;
import com.kh.hehyeop.member.model.dto.CMember;
import com.kh.hehyeop.help.model.repositroy.HelpRepository;
import com.kh.hehyeop.mypage.model.dto.MyAddress;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
@RequestMapping("company")
public class CompanyController {
	
	private final CompanyService companyService;
	private final HelpRepository helpRepository;
	private final ResponseFormValidator responseFormValidator;

	@InitBinder(value="responseForm")
	public void initBinder(WebDataBinder webDataBinder) {
		webDataBinder.addValidators(responseFormValidator);
	}
	
	@GetMapping("help-detail")
	public void helpDetailForm(Model model, String reqIdx) {
		RequestDetail detail = companyService.selectRequestDetailByReqIdx(reqIdx);
		//연락처에 - 넣기
		detail.setReqTell(getFormattedTell(detail.getReqTell()));
		
		//금액에 ,넣기
		NumberFormat format = NumberFormat.getInstance();
		detail.setPrice(format.format(detail.getReqPay()));
		
		System.out.println(detail);
		//확장자 알아내기
		String reName = detail.getReName();
		int formatIdx = reName.lastIndexOf(".");
		model.addAttribute("format", reName.substring(formatIdx+1));
		model.addAttribute("detail", detail);
	}
	
	@GetMapping("help-join")
	public void helpJoinFrom(Model model, String reqIdx) {
		System.out.println(reqIdx);
		model.addAttribute("reqIdx", reqIdx);
	}
	
	@PostMapping("upload-estimate")
	public String uploadEstimate(String reqIdx,
						@Validated ResponseForm form,
						Errors errors,
						Model model,
						HttpSession session,
						RedirectAttributes redirectAttr) {
		System.out.println(form);
		
		ValidateResult vr = new ValidateResult();
		model.addAttribute("error", vr.getError());
		
		if(errors.hasErrors()) {
			model.addAttribute("reqIdx", reqIdx);
			vr.addErrors(errors);
			return "company/help-join";
		}
		CMember member = (CMember) session.getAttribute("authentication");
		companyService.insertHelpResponse(form, reqIdx, member.getId());
		redirectAttr.addFlashAttribute("message", "해협 참가 신청이 완료되었습니다.");
		return "redirect:/company/main";
	}
	
	@GetMapping("main")
	public void main(HttpSession session,Model model, Paging paging
						, @RequestParam(value = "nowPage", required = false) String nowPage
						, @RequestParam(value = "cntPerPage", required = false) String cntPerPage
						, @RequestParam(value = "area", required = false) String area) {
				
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "10";
		}
		
		CMember cmember = (CMember) session.getAttribute("authentication");
		
		List<String> addressList = new ArrayList<String>();
		List<HelpRequest> requestList = new ArrayList<HelpRequest>();
		
		MyAddress myAddress = helpRepository.selectMyAreaList(cmember.getId());

		addressList.add(myAddress.getAddress1());
		if(myAddress.getAddress2() != null) addressList.add(myAddress.getAddress2());
		if(myAddress.getAddress3() != null) addressList.add(myAddress.getAddress3());
		
		List<CompanyField> companyFieldList = companyService.selectCompanyFieldListById(cmember.getId());
		
		int total = companyService.countRequest(addressList,companyFieldList,area);
		paging = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		requestList = companyService.selectRequestList(paging, addressList, companyFieldList, area);
		
		model.addAttribute("paging", paging);
		model.addAttribute("requestList", requestList);
		model.addAttribute("area", area);	
		
	}
	
	@GetMapping("ongoing-help")
	public void ongoingHelpForm() {}
	
	@GetMapping("my")
	public void allHelpForm(HttpSession session, Model model
			, Paging paging
			, @RequestParam(value = "nowPage", required = false) String nowPage
			, @RequestParam(value = "cntPerPage", required = false) String cntPerPage
			, @RequestParam(value = "state", required = false) String state) {
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "10";
		}
		if(state == null) state = "0";
		CMember cmember = (CMember) session.getAttribute("authentication");
		int total = companyService.selectRequestListCntById(cmember.getId(),state);
		paging = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		List<MyRequest> requestList = companyService.selectRequestListById(paging, cmember.getId(), state);	
		model.addAttribute("requestList", requestList);
		model.addAttribute("state", state);
		model.addAttribute("paging", paging);
	}

	private String getFormattedTime(String reqTime) {
		String[] dateTimeArr = reqTime.split("T");
		String dateStr = dateTimeArr[0];
		String timeStr = dateTimeArr[1];
		
		String[] timeArr = timeStr.split(":");
		int hour = Integer.parseInt(timeArr[0]);
		int minute = Integer.parseInt(timeArr[1]);
		
		String ampm = hour < 12 ? "오전" : "오후";
		if(hour > 12) {
			hour = hour - 12;
		}else if(hour == 0) {
			hour = 12;
		}
		
		return dateStr + " " + ampm + " " + hour + ":" + minute;
	}

	private String getFormattedTell(String tell) {
		int length = tell.length();
		if(length == 11) {
			return String.format("%s-%s-%s", tell.substring(0, 3), tell.substring(3, 7), tell.substring(7));
		}
		return String.format("%s-%s-%s", tell.substring(0, 3), tell.substring(3, 6), tell.substring(6));
	}
	
	@GetMapping("completeService")
	public String completeService(HttpSession session, String reqIdx, RedirectAttributes redirectAttrs) {
		CMember cmember = (CMember) session.getAttribute("authentication");
		int res = companyService.completeCashByReqIdx(cmember.getId(),reqIdx);
		if(res == 0) {
			//서비스가 완료되었습니다.
			redirectAttrs.addFlashAttribute("message", "서비스가 완료되었습니다.");
		}else if(res == 1) {
			//매칭상태가 올바르지 않습니다. 다시 선택해주세요.
			redirectAttrs.addFlashAttribute("message", "매칭상태가 올바르지 않습니다. 다시 선택해주세요.");
		}else {
			//완료 대기 중입니다.
			redirectAttrs.addFlashAttribute("message", "완료 대기 처리되었습니다.");
		}
		return "redirect:/company/my";
	}
	
	@GetMapping("cancelService")
	public String cancelService(HttpSession session, String reqIdx, RedirectAttributes redirectAttrs) {
		CMember cmember = (CMember) session.getAttribute("authentication");
		int res = companyService.cancelCashByReqIdx(cmember.getId(),reqIdx);
		if(res == 0) {
			//서비스가 취소되었습니다.
			redirectAttrs.addFlashAttribute("message", "서비스가 취소되었습니다.");
		}else if(res == 1) {
			//매칭상태가 올바르지 않습니다. 다시 선택해주세요.
			redirectAttrs.addFlashAttribute("message", "매칭상태가 올바르지 않습니다. 다시 선택해주세요.");
		}else {
			//취소 대기 중입니다.
			redirectAttrs.addFlashAttribute("message", "취소 대기 처리되었습니다..");
		}
		return "redirect:/company/my";
	}
	
	@GetMapping("viewDetail")
	@ResponseBody
	public RequestDetail viewDetail(String reqIdx) {
		RequestDetail detail = companyService.selectRequestDetailByReqIdx(reqIdx);
		//연락처에 - 넣기
		detail.setReqTell(getFormattedTell(detail.getReqTell()));
		//금액에 ,넣기
		NumberFormat format = NumberFormat.getInstance();
		detail.setPrice(format.format(detail.getReqPay()));
		return detail;
	}
	
}
