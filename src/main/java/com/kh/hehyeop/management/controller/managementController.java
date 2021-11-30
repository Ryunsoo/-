package com.kh.hehyeop.management.controller;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
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

import com.kh.hehyeop.common.sms.Coolsms;
import com.kh.hehyeop.common.validator.ValidateResult;
import com.kh.hehyeop.management.model.dto.FExpense;
import com.kh.hehyeop.management.model.dto.Icebox;
import com.kh.hehyeop.management.model.dto.ShoppingList;
import com.kh.hehyeop.management.model.service.ManagementService;
import com.kh.hehyeop.management.validator.FixedForm;
import com.kh.hehyeop.management.validator.PersonalForm;
import com.kh.hehyeop.management.validator.ScheduleFormValidator;
import com.kh.hehyeop.member.model.dto.Member;
import com.kh.hehyeop.member.model.dto.User;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("management")
public class managementController {

	private final ManagementService managementService;
	private final ScheduleFormValidator scheduleFormValidator;
	
	@GetMapping("myIcebox")
	public void main(HttpSession session, Model model) {
		
		selectIceboxBellList(session, model);
		selectBellCnt(session, model);
	}

	@GetMapping("myIcebox_note")
	public void myIcebox(HttpSession session, Model model, 
						@RequestParam(value = "category" ,required = false) Integer category) {	
		
		selectIceboxList(session,model, category);
		selectIceboxBellList(session, model);
		selectBellCnt(session, model);
	}

	@GetMapping("myIcebox_modify")
	public void modify(HttpSession session, Model model, 
			@RequestParam(value = "category", required = false) Integer category) {
		
		selectIceboxList(session,model, category);
		selectIceboxBellList(session, model);
		selectBellCnt(session, model);
	}
	
	private void selectIceboxList(HttpSession session,Model model,Integer category){
		if(category == null) category = 0;
		Member member = (Member) session.getAttribute("authentication");
		
		List<Icebox> iceboxList = managementService.selectIceboxList(member.getId(), category);
		model.addAttribute("iceboxList", iceboxList);
		session.setAttribute("category",category);
	}
	
	private void selectIceboxBellList(HttpSession session, Model model){
		Member member = (Member) session.getAttribute("authentication");
		List<Icebox> iceboxBellList = managementService.selectIceboxBellList(member.getId());
		model.addAttribute("iceboxBellList", iceboxBellList);
	}
	
	private void selectBellCnt(HttpSession session, Model model) {
		Member member = (Member) session.getAttribute("authentication");
		int bellCnt = managementService.selectBellCnt(member.getId());
		model.addAttribute("bellCnt", bellCnt);
	}

	@GetMapping("myIcebox_cart")
	public void cart(HttpSession session, Model model) {
		Member member = (Member) session.getAttribute("authentication");
		Map<String, List<ShoppingList>> shoppingList = managementService.selectShoppingListById(member.getId());
		model.addAllAttributes(shoppingList);
	}

	@GetMapping("deleteItem")
	public String deleteItem(String shoppingIdx, RedirectAttributes redirectAttr) {
		int res = managementService.deleteItem(shoppingIdx);
		if (res == 1)
			redirectAttr.addFlashAttribute("message", "해당 항목이 삭제되었습니다.");
		return "redirect:/management/myIcebox_cart";
	}

	@GetMapping("insertInputItem")
	public String insertInputItem(HttpSession session, String item, RedirectAttributes redirectAttr) {
		Member member = (Member) session.getAttribute("authentication");
		int res = managementService.insertInputItem(member.getId(), item);
		if (res == 1)
			redirectAttr.addFlashAttribute("message", "해당 항목이 추가되었습니다.");
		return "redirect:/management/myIcebox_cart";
	}

	@PostMapping("moveCheckedItem")
	public String moveCheckedItem(HttpSession session, String[] checkedItemIdx, RedirectAttributes redirectAttr) {
		Member member = (Member) session.getAttribute("authentication");
		// 체트된 항목들 shoppingIdx 배열
		String[] idxArr = checkedItemIdx;
		int res = managementService.moveCheckedItem(member.getId(), idxArr);
		if (res == 1)
			redirectAttr.addFlashAttribute("message", "해당 항목이 이동되었습니다.");
		return "redirect:/management/myIcebox_cart";
	}

	@PostMapping("sendSMS")
	public String sendSMS(HttpServletRequest request, @RequestParam(value = "item", required = false) String[] item, int tell, String date, RedirectAttributes redirectAttr) throws Exception {
		String tellStr = "0"+Integer.toString(tell);
		String text ="";
		for (String itemIdx : item) {
			text += itemIdx+" ";
		}
		date = date.replace("T", ""); 
		date = date.replace(":", ""); 
		date = date.replace("-", ""); 
		System.out.println("date : " + date);
		String api_key = "NCSCLG5MVOMXL3QG"; String api_secret = "Z3FL84I3T3HPYEEXARZJC5CXHWKKJ2OJ"; 
		Coolsms coolsms = new Coolsms(api_key, api_secret);
		HashMap<String, String> set = new HashMap<String, String>(); 
		set.put("to",tellStr); // 수신번호
		  
		set.put("from", "01050211937"); // 발신번호 
		set.put("text", text); // 문자내용
		set.put("type", "sms"); // 문자 타입 
		set.put("datetime", date); //예약전송시 날짜 설정 
		System.out.println(set);
		  
		JSONObject result = coolsms.send(set); // 보내기&전송결과받기
		redirectAttr.addFlashAttribute("message", "문자가 발송되었습니다.");
		return "redirect:/management/myIcebox_cart";
	}
	
	public void test4() {}
	
	@InitBinder(value = { "personalForm", "fixedForm" })
	public void intiBinder(WebDataBinder webDataBinder) {
		webDataBinder.addValidators(scheduleFormValidator);
	}

	@GetMapping("myAccountBook")
	public void myAccountBookForm() {}
	
	@GetMapping("personal-spend")
	public String savePersonalSpend(@Validated PersonalForm form,
						Errors errors,
						Model model,
						HttpSession session,
						RedirectAttributes redirect) {
		System.out.println(form.getContent());
		
		ValidateResult vr = new ValidateResult();
		model.addAttribute("personalError", vr.getError());
		
		if(errors.hasErrors()) {
			vr.addErrors(errors);
			return "management/myAccountBook";
		}
		
		User user = (User) session.getAttribute("authentication");
		managementService.insertPersonalSpend(user.getId(), form);
		
		return "redirect:/management/myAccountBook";
	}
	
	@GetMapping("fixed-spend")
	public String saveFixedSpend(@Validated FixedForm form,
						Errors errors,
						Model model,
						HttpSession session) {
		System.out.println(form.getEndDate());
		
		ValidateResult vr = new ValidateResult();
		model.addAttribute("fixedError", vr.getError());
		
		if(errors.hasErrors()) {
			vr.addErrors(errors);
			return "management/myAccountBook";
		}
		
		User user = (User) session.getAttribute("authentication");
		if(form.getEndDate().equals("")) form.setEndDate(null);
		managementService.insertFixedSpend(user.getId(), form);
		
		return "redirect:/management/myAccountBook";
	}

	@GetMapping("myAccountList")
	public void test6(HttpSession session, Model model) {
		Member member = (Member) session.getAttribute("authentication");
		List<FExpense> fExpenseList = managementService.selectFExpenseList(member.getId());
		int sumPrice = 0;
		DecimalFormat formatter = new DecimalFormat("###,###");
		for (FExpense fExpense : fExpenseList) {
			fExpense.setComPrice(formatter.format(fExpense.getPrice()));
			sumPrice += fExpense.getPrice();
		}
		String comSumPrice = formatter.format(sumPrice);
		model.addAttribute("FExpenseList", fExpenseList);
		model.addAttribute("sumPrice", comSumPrice);
	}
	
	@GetMapping("plusItem")
	@ResponseBody
	public int plusItem(HttpSession session, String item, String date, Integer category) {
		if(category == null) category = 0;
		Member member = (Member) session.getAttribute("authentication");
		int res = managementService.insertIceboxItem(member.getId(),item, date, category);
		
		return res;
	}
	
	@GetMapping("delete-icebox")
	@ResponseBody
	public String deleteIceboxItem(HttpSession session, @RequestParam(value = "iceIdx")String iceIdx
								,@RequestParam(value = "status")int status
								,@RequestParam(value = "item", required = false)String item) {
		Member member = (Member) session.getAttribute("authentication");
		String result = managementService.deleteIceboxItem(iceIdx, status, member.getId(), item);
		return result;
	}
	
	
}
