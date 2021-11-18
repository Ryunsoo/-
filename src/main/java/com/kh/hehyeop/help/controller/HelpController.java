 package com.kh.hehyeop.help.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.kh.hehyeop.common.util.address.AddressUtil;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.kh.hehyeop.help.model.dto.HelpRequest;
import com.kh.hehyeop.help.model.service.HelpService;
import com.kh.hehyeop.member.model.dto.Member;
import com.kh.hehyeop.member.model.dto.User;


import com.kh.hehyeop.company.model.dto.ProField;
import com.kh.hehyeop.help.model.service.HelpService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("help")
public class HelpController {
	
	private final HelpService helpService;
	
	@GetMapping("main")
	public void help1(HttpSession session) {
		System.out.println("help main 작업 중 ㅎㅎㅎ");
		
		Map<String, List<ProField>> proFiledMap = new HashMap<String, List<ProField>>();
		proFiledMap.put("category", helpService.selectCategoryList());
		proFiledMap.put("proField", helpService.selectFieldList());
		
		System.out.println("맵! : " + proFiledMap);
		
		System.out.println("카테고리! : " + proFiledMap.get("category").get(0).getFieldCategory());
		System.out.println("필드! : " + proFiledMap.get("proField").get(0).getFieldCategory());
		
		session.setAttribute("proFieldMap", proFiledMap);
	}
	
	@GetMapping("request")
	public String help2(HttpSession session, String field) {
		
		if(session.getAttribute("authentication") == null) {
			return "redirect:/help/main";
		}
		
		session.setAttribute("field", field);
		
		return "help/request";
	}
	
	@GetMapping("my-hehyeop")
	public void help3(HttpSession session, Model model) {
		AddressUtil util = new AddressUtil();
		Member member = (Member) session.getAttribute("authentication");
		String trimAddress = util.trimOldAddress(member.getOldAddress());
		System.out.println("trimAddress : " + trimAddress);
		model.addAttribute("trimAddress", trimAddress);
	}

	
	@GetMapping("review")
	public void help4() {
		
	}

	@PostMapping("uploadRequest")
	public String uploadRequset(
			HelpRequest helpRequest
			,@RequestParam List<MultipartFile> files
			,HttpSession session
			) {
		User user = (User) session.getAttribute("authentication");
		String reqIdx = "";
		//1. 아이디 가지고 주소 가져와서 helpRequest에 담아주기
		helpRequest.setReqAddress(user.getAddress());
		helpRequest.setOldAddress(user.getOldAddress());
		
		//2. helpRequest 등록하고 req_idx 가져오기
		helpRequest.setId(user.getId());
		int resReq = helpService.insertRequest(helpRequest);
		if(resReq == 1) {
			reqIdx = helpService.selectReqIdx(helpRequest.getId());
		}
		//3. file업로드 하기
		int resFile = helpService.uploadFile(files, reqIdx);  
		if(resFile == 1) {
			System.out.println("신청서 제출 성공");
		}
		return "redirect:/";
	}

}
