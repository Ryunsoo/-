package com.kh.hehyeop.mypage.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.hehyeop.common.validator.ValidateResult;
import com.kh.hehyeop.member.model.dto.Member;
import com.kh.hehyeop.member.validator.JoinForm;
import com.kh.hehyeop.mypage.model.dto.Wallet;
import com.kh.hehyeop.mypage.model.service.MypageService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("mypage")
@RequiredArgsConstructor
public class MypageController {
	
	private final MypageService mypageService;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private final RestTemplate http;
	private final ObjectMapper mapper;
	
	@GetMapping("mypage-common")
	public void mypageCommon(HttpSession session) { 
		
		Member authMember = (Member) session.getAttribute("authentication");
		Wallet userWallet = mypageService.selectWallet(authMember.getId());
		
		String[] splitAddress = authMember.getOldAddress().split(" ");
		authMember.setOldAddress(splitAddress[0] + " " + splitAddress[1] + " " + splitAddress[2]);

		session.removeAttribute("authentication");
		session.setAttribute("authentication", authMember);
		session.setAttribute("walletInfo", userWallet);
		
	}
	
	@GetMapping("getAuth")
	public String getAuth(HttpSession session, @RequestParam("code") String code) throws JsonMappingException, JsonProcessingException, RestClientException { 
		
		if (code != null) {
			MultiValueMap<String, String> body = new LinkedMultiValueMap<String, String>();
			body.add("code", code);
			body.add("client_id", "f319e2ed-4cae-4853-a2c4-d17261fc495a");
			body.add("client_secret", "dc6faf75-4cfc-499a-afff-ad1232a69246");
			body.add("redirect_uri", "http://localhost:9090/mypage/getAuth");
			body.add("grant_type", "authorization_code");
			
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", "application/x-www-form-urlencoded");
			
			HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body, headers);
			
			ResponseEntity<String> response = http.exchange(
						"https://testapi.openbanking.or.kr/oauth/2.0/token",
						HttpMethod.POST,
						entity,
						String.class);
			
			JsonNode root = mapper.readTree(response.getBody());
			String token = root.findValue("access_token").asText();
			String userSeq = root.findValue("user_seq_no").asText();
			
			if (token != null) {
				headers = new HttpHeaders();
				headers.add("Authorization", "Bearer " + token);
				
				HttpEntity tokenEntity = new HttpEntity<>(headers);
				
				response = http.exchange("https://testapi.openbanking.or.kr/v2.0/account/list?user_seq_no=" + userSeq,
						HttpMethod.GET,
						tokenEntity,
						String.class);
				
				root = mapper.readTree(response.getBody());
				
				String bank = root.findValue("bank_name").asText();
				String bankNum = root.findValue("account_num_masked").asText();
				
				Member member = (Member) session.getAttribute("authentication");
				
				mypageService.updateWalletInfo(member.getId(), bank, bankNum);
				
			}
			
		}
		
		return "redirect:/mypage/mypage-common";
		
	}
	
	@PostMapping("charge")
	public void chargeCash(@RequestBody HashMap<String, Object> map) {
		
		logger.debug(map.toString());
		
	}
	
	
	
	@GetMapping("mypage-company")
	public void mypageCompany() { }
	
	@GetMapping("email-check")
	@ResponseBody
	public String emailCheck(String email) {
		Member member = mypageService.selectMemberByEmail(email);
		 
		if (member != null) {
			logger.debug(member.toString());
			return "disable";
		} else {
			return "available";
		}
	}
	
	
	@GetMapping("modify-info")
	public void modifyInfo() { }
	
	@GetMapping("modify")
	public String insertModifyInfo(@Validated JoinForm form, Errors errors, Model model, HttpSession session, RedirectAttributes redirectAttr) { 
		
		ValidateResult vr = new ValidateResult();
		model.addAttribute("error", vr.getError());

		if (errors.hasErrors()) {
			vr.addErrors(errors);
			return "redirect:/mypage/modify-info";
		}
		else {
		mypageService.updateInfo(form);
		System.out.println("member 바꼈냐");
		session.removeAttribute("persistUser");
		return "redirect:/mypage/modify-info";
		}
	}
}
