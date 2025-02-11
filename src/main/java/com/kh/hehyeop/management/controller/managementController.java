package com.kh.hehyeop.management.controller;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.bag.SynchronizedSortedBag;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.hehyeop.common.sms.Coolsms;
import com.kh.hehyeop.common.validator.ValidateResult;
import com.kh.hehyeop.management.model.dto.Expense;
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
		selectIceboxBellList(session, model);
		selectBellCnt(session, model);
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
	public void myAccountBookForm(HttpSession session, Model model) {
		User user = (User) session.getAttribute("authentication");
		List<String> todayList = managementService.selectTodayFixedSpend(user.getId());
		model.addAttribute("todayList", todayList);
	}
	
	@GetMapping("personal-spend/{action}")
	public String savePersonalSpend(@Validated PersonalForm form,
						Errors errors,
						@PathVariable(name = "action") String action,
						Model model,
						HttpSession session,
						RedirectAttributes redirect) {
		System.out.println("form : " + form);
		System.out.println("action : " + action);
		
		ValidateResult vr = new ValidateResult();
		model.addAttribute("personalError", vr.getError());
		
		if(errors.hasErrors()) {
			vr.addErrors(errors);
			if(action.equals("save")) {
				model.addAttribute("save", "save");
			}
			return "management/myAccountBook";
		}
		
		User user = (User) session.getAttribute("authentication");
		
		if(action.equals("save")) {
			managementService.insertPersonalSpend(user.getId(), form);
			redirect.addFlashAttribute("message", "개인 지출 내역이 성공적으로 저장되었습니다.");
		}else {
			managementService.updatePersonalSpend(form);
			redirect.addFlashAttribute("message", "개인 지출 내역이 성공적으로 수정되었습니다.");
		}
		
		return "redirect:/management/myAccountBook";
	}
	
	@GetMapping("fixed-spend/{action}")
	public String saveFixedSpend(@Validated FixedForm form,
						Errors errors,
						@PathVariable(name = "action") String action,
						Model model,
						HttpSession session,
						RedirectAttributes redirect) {
		System.out.println("form : " + form);
		System.out.println("action : " + action);
		
		ValidateResult vr = new ValidateResult();
		model.addAttribute("fixedError", vr.getError());
		
		if(errors.hasErrors()) {
			vr.addErrors(errors);
			if(action.equals("save")) {
				model.addAttribute("save", "save");
			}
			return "management/myAccountBook";
		}
		
		User user = (User) session.getAttribute("authentication");
		if(form.getEndDate().equals("")) form.setEndDate(null);
		
		if(action.equals("save")) {
			managementService.insertFixedSpend(user.getId(), form);
			redirect.addFlashAttribute("message", "고정 지출 내역이 성공적으로 저장되었습니다.");
		}else {
			managementService.updateFixedSpend(form);
			redirect.addFlashAttribute("message", "고정 지출 내역이 성공적으로 수정되었습니다.");
		}
		
		return "redirect:/management/myAccountBook";
	}
	
	@GetMapping("get-events")
	@ResponseBody
	public List<Map<String, Object>> getEvents(HttpSession session, String date) {
		System.out.println("date : " + date);
		User user = (User) session.getAttribute("authentication");
		return managementService.selectEvents(user.getId(), date);
	}
	
	@GetMapping("personal-delete")
	public String deletePersonalSpend(HttpSession session, String expIdx,
										RedirectAttributes redirect) {
		managementService.deletePersonalSpend(expIdx);
		redirect.addFlashAttribute("message", "개인 지출 내역이 성공적으로 삭제되었습니다.");
		return "redirect:/management/myAccountBook";
	}
	
	@GetMapping("fixed-delete")
	public String deleteFixedSpend(HttpSession session, String expIdx,
										RedirectAttributes redirect) {
		managementService.deleteFixedSpend(expIdx);
		redirect.addFlashAttribute("message", "고정 지출 내역이 성공적으로 삭제되었습니다.");
		return "redirect:/management/myAccountBook";
	}

	@GetMapping("myAccountList")
	public void myAccountList(HttpSession session, Model model 
			, @RequestParam(value = "cate", required = false) String cate
			, @RequestParam(value = "period", required = false) String period) {
		Member member = (Member) session.getAttribute("authentication");
		
		//상세지출
		Date date = new Date();        
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM")
				.withZone(ZoneId.systemDefault());
		
		if (cate == null) cate = "all";
		if(period == null) period = format.format(date.toInstant());
		System.out.println("period : "+period);
		System.out.println("cate : "+cate);
		List<Expense> expenseList = managementService.selectExpenseList(member.getId(), cate, period);
		int eSumPrice = 0;
		DecimalFormat formatter = new DecimalFormat("###,###");
		for (Expense expense : expenseList) {
			expense.setAccPrice(expense.getPrice()+eSumPrice);
			expense.setComAccPrice(formatter.format(expense.getAccPrice()));
			expense.setComPrice(formatter.format(expense.getPrice()));
			eSumPrice += expense.getPrice();
		}
		
		//합계금액 , 포함
		String eComSumPrice = formatter.format(eSumPrice);
		
		//고정지출
		List<FExpense> fExpenseList = managementService.selectFExpenseList(member.getId());
		int fSumPrice = 0;
		formatter = new DecimalFormat("###,###");
		for (FExpense fExpense : fExpenseList) {
			fExpense.setComPrice(formatter.format(fExpense.getPrice()));
			fSumPrice += fExpense.getPrice();
		}
		
		//합계금액 , 포함
		String fComSumPrice = formatter.format(fSumPrice);
		
		model.addAttribute("ExpenseList", expenseList);
		model.addAttribute("FExpenseList", fExpenseList);
		model.addAttribute("EsumPrice", eComSumPrice);
		model.addAttribute("FsumPrice", fComSumPrice);
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
