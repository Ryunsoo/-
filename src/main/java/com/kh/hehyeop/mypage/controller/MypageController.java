package com.kh.hehyeop.mypage.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.hehyeop.common.code.ErrorCode;
import com.kh.hehyeop.common.exception.HandlableException;
import com.kh.hehyeop.common.util.address.AddressUtil;
import com.kh.hehyeop.common.validator.ValidateResult;
import com.kh.hehyeop.member.model.dto.CMember;
import com.kh.hehyeop.member.model.dto.Member;
import com.kh.hehyeop.member.model.service.MemberService;
import com.kh.hehyeop.member.validator.FieldForm;
import com.kh.hehyeop.mypage.model.dto.Friend;
import com.kh.hehyeop.mypage.model.dto.LinkMember;
import com.kh.hehyeop.mypage.model.dto.Location;
import com.kh.hehyeop.mypage.model.dto.MyAddress;
import com.kh.hehyeop.mypage.model.dto.Wallet;
import com.kh.hehyeop.mypage.model.service.MypageService;
import com.kh.hehyeop.mypage.validator.JoinForm;
import com.kh.hehyeop.mypage.validator.ModifyCompany;
import com.kh.hehyeop.mypage.validator.MypageValidator;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("mypage")
@RequiredArgsConstructor
public class MypageController {
	
	private final MypageService mypageService;
	private final MemberService memberService;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private final RestTemplate http;
	private final ObjectMapper mapper;
	private final MypageValidator mypageValidator;
	private final PasswordEncoder passwordEncoder;
	
	@GetMapping("mypage-common")
	public void mypageCommon(HttpSession session) { 
		
		Member authMember = (Member) session.getAttribute("authentication");
		Wallet userWallet = mypageService.selectWallet(authMember.getId());
		MyAddress myAddress = mypageService.getMypageAddressList(authMember.getId());
		Map<String, String> purchaseCount = mypageService.getPurchaseCount(authMember.getId());
		
		String[] splitAddress = authMember.getOldAddress().split(" ");
		authMember.setOldAddress(splitAddress[0] + " " + splitAddress[1] + " " + splitAddress[2]);

		session.removeAttribute("authentication");
		session.setAttribute("authentication", authMember);
		session.setAttribute("walletInfo", userWallet);
		session.setAttribute("myAddress", myAddress);
		session.setAttribute("purchaseCount", purchaseCount);
		
		List<Friend> friendList = mypageService.selectFriend(authMember.getId());
		
		session.setAttribute("friendList", friendList);
		
		logger.debug("------------------친구야 돌고있니 : " + friendList);
		
		
	}
	
	@GetMapping("mypage-company")
	public void mypageCompany(HttpSession session, Model model) { 
		CMember authCMember = (CMember) session.getAttribute("authentication");
		Wallet userWallet = mypageService.selectWallet(authCMember.getId());
		List<String> myField = mypageService.selectField(authCMember.getId());
		MyAddress myAddress = mypageService.getMypageAddressList(authCMember.getId());
		List<Integer> responseCntList = mypageService.selectResponseCnt(authCMember.getId());
		List<Double> scoreList = mypageService.getScore(authCMember.getId());
		Double avgScore = (double) 0;
		if(scoreList.size() > 0) {
			avgScore = avgScore(scoreList);
		}
		List<Map<String, Object>> reviewCountMap = mypageService.getReview(authCMember.getId());
	    System.out.println(reviewCountMap);
	    System.out.println(avgScore);
		model.addAttribute("avgScore",avgScore);
		model.addAttribute("reviewCountMap",reviewCountMap);
		session.setAttribute("walletInfo", userWallet);
		session.setAttribute("myField", myField);
		session.setAttribute("myAddress", myAddress);
		session.setAttribute("responseCntList", responseCntList);
	}
	
	private Double avgScore(List<Double> scoreList) {
		Double sum = (double) 0;
		for (Double score : scoreList) {
			sum += score;
		} 
		Double avg = Math.round((sum / scoreList.size())*100)/100.0;
		return avg;
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
				
				Wallet wallet = new Wallet();
				
				if (session.getAttribute("authentication").getClass().getSimpleName().equals("Member")){
					Member member = (Member) session.getAttribute("authentication");
					wallet.setId(member.getId());
					wallet.setBank(bank);
					wallet.setBankNum(bankNum);
					wallet.setAuthToken(token);
					wallet.setUserSeq(userSeq);
					
					mypageService.updateWalletInfo(wallet);
					
					return "redirect:/mypage/mypage-common";
					
				} else {
					CMember member = (CMember) session.getAttribute("authentication");
					wallet.setId(member.getId());
					wallet.setId(member.getId());
					wallet.setBank(bank);
					wallet.setBankNum(bankNum);
					wallet.setAuthToken(token);
					wallet.setUserSeq(userSeq);
					
					mypageService.updateWalletInfo(wallet);
					
					return "redirect:/mypage/mypage-company";
				}
				
			}
			
		}
		
		return null;
		
	}
	
	@PostMapping("charge")
	@ResponseBody
	public String chargeCash(@RequestBody HashMap<String, Object> map) throws JsonMappingException, JsonProcessingException {
		
		if (map.get("imp_uid") != null) {
			
			String id = (String) map.get("buyer_name");
			int cash = (int) map.get("amount");
			
			MultiValueMap<String, String> body = new LinkedMultiValueMap<String, String>();
			body.add("imp_key", "1368854578238946");
			body.add("imp_secret", "322943757272113175a3993ed6bc22ad61fac5b5ccbad9fb68c0f374ad10422dd3c5a779375816d7");
			
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
			
			HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body, headers);
			
			ResponseEntity<String> response = http.exchange(
						"https://api.iamport.kr/users/getToken",
						HttpMethod.POST,
						entity,
						String.class);
			
			JsonNode root = mapper.readTree(response.getBody());

			String cashToken = root.findValue("access_token").asText();
			
			if (cashToken != null) {
				
				headers.add("Authorization", cashToken);
				
				HttpEntity tokenEntity = new HttpEntity<>(headers);
				
				response = http.exchange(
						"https://api.iamport.kr/payments/" + map.get("imp_uid"),
						HttpMethod.GET,
						tokenEntity,
						String.class);
				
				logger.debug(response.getBody());
				root = mapper.readTree(response.getBody());
				
				logger.debug(root.findValue("amount").asText());
				logger.debug(Integer.toString(cash));
				
				if(root.findValue("amount").asText().equals(Integer.toString(cash))) {
					Wallet chargeWallet = new Wallet();
					chargeWallet.setId(id);
					chargeWallet.setCash(cash);
					mypageService.insertCash(chargeWallet);
					
					return "success";
				}
				
			}
		}
		return "failed";
	}
	


	
	@GetMapping("location-list")
	@ResponseBody
	public List<Location> selectLocationList(Model model
									,@ModelAttribute Location location) {
		List<Location> locationlist = mypageService.selectLocationList(location);
		
		return locationlist;
	}
	
	@GetMapping("account-check")
	@ResponseBody
	public String accountCheck(@RequestParam("account") String account, 
							   @RequestParam("cash") int cash, 
							   HttpSession session) 
							   throws JsonMappingException, JsonProcessingException {
		
		logger.debug(account);
		
		Wallet wallet = (Wallet) session.getAttribute("walletInfo");
		
		String token = wallet.getAuthToken();
		String userSeq = wallet.getUserSeq();
		
		HttpHeaders headers = new HttpHeaders();
		headers.add("Authorization", "Bearer " + token);
		
		HttpEntity entity = new HttpEntity<>(headers);
		
		ResponseEntity<String> response = http.exchange(
				"https://testapi.openbanking.or.kr/v2.0/account/list?user_seq_no="+userSeq+"&include_cancel_yn=Y&sort_order=D",
				HttpMethod.GET,
				entity,
				String.class);
		
		JsonNode root = mapper.readTree(response.getBody());
		
		String bankNum = root.findValue("account_num_masked").asText();
		
		StringBuffer sb = new StringBuffer();
		
		sb.append(account);
		sb.replace(sb.length() - 3, sb.length(), "***");
		
		logger.debug(sb.toString());
		logger.debug(bankNum);
		
		if (bankNum.equals(sb.toString())) {
			
			if (wallet.getCash() < cash) {
				return "disable";
			}
			
			wallet.setCash(wallet.getCash() - cash);
			mypageService.updateCash(wallet);
			return "available";
		}
		
		
		return "failed";
		
	}
	
	@GetMapping("address-update")
	public void updateAddress(@ModelAttribute Location location
							, HttpSession session) {
		Member myInfo = (Member) session.getAttribute("authentication");
		String id = myInfo.getId();
		mypageService.updateAddress(location,id);
	}
	
	@GetMapping("company-address-update")
	public void updateCompanyAddress(@ModelAttribute Location location
							, HttpSession session) {
		CMember myInfo = (CMember) session.getAttribute("authentication");
		String id = myInfo.getId();
		mypageService.updateAddress(location,id);
	}
	
	@GetMapping("address-remove")
	public void removeAddress(HttpSession session
							,@RequestParam String companymember
							,@RequestParam String addressNum) {
		
		if(companymember.equals("y")) {
			CMember cmember = (CMember) session.getAttribute("authentication");
			mypageService.removeAddress(cmember.getId(), addressNum);
		} else {
			Member member = (Member) session.getAttribute("authentication");
			mypageService.removeAddress(member.getId(), addressNum);
		}
		
	}
	
	
	@GetMapping("link")
	public String linkMember(@RequestParam("id") String id, 
							   @RequestParam("password") String password, 
							   @RequestParam("confirmPw") String confirmPw,
							   RedirectAttributes redirectAttr,
							   HttpSession session) {
		
		CMember cmember = (CMember) session.getAttribute("authentication");
		Member member = new Member();
		member.setId(id);
		member.setPassword(password);
		 
		if (!passwordEncoder.matches(confirmPw, cmember.getPassword())) {
			redirectAttr.addFlashAttribute("message", "등록된 업체 비밀번호가 맞지 않습니다.");
		} else if (memberService.authenticateUser(member) == null) {
			redirectAttr.addFlashAttribute("message", "가입되지 않은 정보입니다.");
		} else {
			memberService.linkMember(id, cmember.getId(), password);
			LinkMember linkMember = new LinkMember();
			linkMember.setCId(cmember.getId());
			linkMember.setId(id);
			linkMember.setPassword(password);
			session.setAttribute("linked", linkMember);
			redirectAttr.addFlashAttribute("message", "회원 정보가 연결되었습니다.");
		}
		
		return "redirect:/mypage/mypage-company";
	}
	
	@GetMapping("change")
	public String changeMember(HttpSession session) {
		
		LinkMember lm = (LinkMember) session.getAttribute("linked");
		
		session.removeAttribute("walletInfo");
		session.removeAttribute("myField");
		session.removeAttribute("linked");
		session.removeAttribute("authentication");
		session.removeAttribute("id");
		
		Member authMember = memberService.selectMember(lm.getId());
		
		session.setAttribute("authentication", authMember);
		session.setAttribute("id", authMember.getNickname());
		return "redirect:/"; 
		
	}
	
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
	
	
	@InitBinder(value = "joinForm") 
	public void initBinder(WebDataBinder webDataBinder) {
		webDataBinder.addValidators(mypageValidator);
	}
	
	@GetMapping("modify-info")
	public void modifyInfo(Model model) {
		
		model.addAttribute(new JoinForm()).addAttribute("error", new ValidateResult().getError());
	}
	
	@PostMapping("modify")
	public String insertModifyInfo(@Validated JoinForm form, Errors errors, Model model, Member member, HttpSession session, RedirectAttributes redirectAttr) { 
		
		ValidateResult vr = new ValidateResult();
		model.addAttribute("error", vr.getError());
		logger.debug("------------에러야 있니 : " + errors.toString());
		if (!errors.hasErrors()) {
			AddressUtil autil = new AddressUtil();
			form.setOldAddress(autil.trimOldAddress(form.getOldAddress()));
			mypageService.updateInfo(form);
			System.out.println("member 바꼈냐");
			session.removeAttribute("authentication");
			Member authentication = mypageService.authenticateUser(member);
			session.setAttribute("authentication", authentication);
			redirectAttr.addFlashAttribute("message", "수정이 완료 되었습니다.");
			return "redirect:/mypage/mypage-common";
		}
		
		if (errors.hasErrors()) {
			vr.addErrors(errors);
			return "mypage/modify-info";
		}
		
		return null;
	}
	
	@PostMapping("memo")
	public String updateMemo(Friend friend, HttpSession session, RedirectAttributes redirectAttr) { 
		
		Member member = (Member) session.getAttribute("authentication");
		String id = member.getId();
		String friendId = friend.getFriendId();
		String memo = friend.getMemo();
		System.out.println("---------------메모야 돌고있니 : 아이디 : " + id + " friendId : " + friendId + " memo : " + memo);
		
		mypageService.updateMemo(id, friendId, memo);
		redirectAttr.addFlashAttribute("message", "메모가 저장되었습니다.");
		
		return "redirect:/mypage/mypage-common";
	}
	
	@GetMapping("delete-friend")
	@ResponseBody
	public String deleteFriend(Friend friend, HttpSession session, RedirectAttributes redirectAttr) { 
		
		Member member = (Member) session.getAttribute("authentication");
		String id = member.getId();
		String friendId = friend.getFriendId();
		System.out.println("---------------친구야 안녕... : 아이디 : " + id + " friendId : " + friendId );
		mypageService.deleteFriend(id, friendId);
		redirectAttr.addFlashAttribute("message", "삭제가 완료 되었습니다.");
		
		return "delete";
	}
	
	@GetMapping("company-modifyInfo")
	public void modifyCompanyInfo(HttpSession session, Model model) { 
		
		CMember member = (CMember) session.getAttribute("authentication");
		int status = mypageService.selectStatus(member.getId());
		
		if (status == 2) {
			throw new HandlableException(ErrorCode.MYPAGE_ACCESS_ERROR);
		}
		
		ArrayList<FieldForm> fieldList = mypageService.selectFieldExceptPermit(member.getId());
		ArrayList<String> categoryList = memberService.selectCategory();
		model.addAttribute(new JoinForm()).addAttribute("error", new ValidateResult().getError());

		session.setAttribute("fieldList", fieldList);
		session.setAttribute("categoryList", categoryList);
		
		
		logger.debug("------------에러야 있니 : " + session.getAttribute("authentication"));
	}
	
	@PostMapping("co-modify")
	public String modifyCompay(@Validated JoinForm form, Errors errors, Model model, CMember member, List<MultipartFile> files, HttpSession session,HttpServletRequest request, RedirectAttributes redirectAttr) { 
		
		ValidateResult vr = new ValidateResult();
		model.addAttribute("error", vr.getError());
		logger.debug("------------에러야 있니 : " + errors.toString());
		logger.debug("------------form 있니 : " + form);
		
		List<String> fieldList = new ArrayList<String>();
		String[] fieldParam = request.getParameterValues("fieldName");
		
		if (fieldParam != null) {
			for (String field : fieldParam) {
				fieldList.add(field);
			}
			
			mypageService.updateCompanyField(form.getId(), fieldList);
		}
		
		if (!errors.hasErrors()) {
			AddressUtil autil = new AddressUtil();
			form.setOldAddress(autil.trimOldAddress(form.getOldAddress()));
			mypageService.updateCompanyInfo(form);
			
			member = (CMember) session.getAttribute("authentication");
			mypageService.uploadFile(files, member.getCIdx());
			System.out.println("Company info 바꼈냐");
			 
			
			session.removeAttribute("authentication");
			session.removeAttribute("myField");
			List<String> myField = mypageService.selectField(member.getId());
			CMember authentication = mypageService.authenticateCUser(member);
			session.setAttribute("authentication", authentication);
			session.setAttribute("myField", myField);
			
			
			redirectAttr.addFlashAttribute("message", "수정이 완료 되었습니다.");
			return "redirect:/mypage/mypage-company";
		}
		
			vr.addErrors(errors);
			return "mypage/company-modifyInfo";
			
	}

}
