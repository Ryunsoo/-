package com.kh.hehyeop.management.model.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kh.hehyeop.common.code.ExpenseCate;
import com.kh.hehyeop.common.code.Field;
import com.kh.hehyeop.management.model.dto.Expense;
import com.kh.hehyeop.management.model.dto.FExpense;
import com.kh.hehyeop.management.model.dto.Icebox;
import com.kh.hehyeop.management.model.dto.ShoppingList;
import com.kh.hehyeop.management.model.repository.ManagementRepository;
import com.kh.hehyeop.management.validator.FixedForm;
import com.kh.hehyeop.management.validator.PersonalForm;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ManagementServiceImpl implements ManagementService{

	private final ManagementRepository managementRepository;

	@Override
	public List<Icebox> selectIceboxList(String id, int category) {
		return managementRepository.selectIceboxList(id, category);
	}
	
	@Override
	public Map<String, List<ShoppingList>> selectShoppingListById(String id) {
		List<ShoppingList> purchaseList = managementRepository.selectPurchaseListById(id);
		List<ShoppingList> exhaustList = managementRepository.selectExhaustListById(id);
		
		return Map.of("purchaseList", purchaseList, "exhaustList", exhaustList);
	}

	@Override
	public int deleteItem(String shoppingIdx) {
		return managementRepository.deleteItemByShoppingIdx(shoppingIdx);
	}

	@Override
	public int insertInputItem(String id, String item) {
		return managementRepository.insertInputItem(id,item);
	}

	@Override
	public int moveCheckedItem(String id, String[] idxArr) {
		int res = 0;
		for (String shoppingIdx : idxArr) {
			res += managementRepository.updateItemStatus(id,shoppingIdx);
		}
		if (res == idxArr.length) {
			return 1;
		}
		return 0;
	}

	@Override
	public void insertPersonalSpend(String id, PersonalForm form) {
		managementRepository.insertPersonalSpend(id, form);
	}

	@Override
	public void insertFixedSpend(String id, FixedForm form) {
		managementRepository.insertFixedSpend(id, form);
	}
	
	@Override
	public List<FExpense> selectFExpenseList(String id) {
		return managementRepository.selectFExpenseList(id);
	}

	public int insertIceboxItem(String id,String item, String date, int category) {
		return managementRepository.insertIceboxItem(id, item, date, category);
	}

	@Override
	public String deleteIceboxItem(String iceIdx, int status, String id, String item) {
		
		if(status == 1) {
			managementRepository.insertShoppingItem(id,item);
			managementRepository.deletedeleteIceboxItem(iceIdx);
			return "insert";
		}else {
			managementRepository.deletedeleteIceboxItem(iceIdx);
			return "delete";
		}	
	}

	@Override
	public List<Icebox> selectIceboxBellList(String id) {
		return managementRepository.selectIceboxBellList(id);
	}

	@Override
	public int selectBellCnt(String id) {
		return managementRepository.selectBellCnt(id);
	}
	
	public List<Expense> selectExpenseList(String id, String cate, String period) {
		System.out.println("imple cate: " + cate);
		List<Expense> expenseList = managementRepository.selectExpenseList(id, cate, period);
		for (Expense expense : expenseList) {
			expense.setCategory(ExpenseCate.valueOf(expense.getCategory()).DESC);
		}
		return expenseList;
	}

	@Override
	public List<Map<String, Object>> selectEvents(String id, String date) {
		List<Map<String, Object>> eventList = new ArrayList<Map<String,Object>>();
		
		//개인지출 가져오기
		List<Expense> personalList = managementRepository.selectPersonalExpense(id, date);
		
		if(!personalList.isEmpty()) {
			eventList.addAll(getPersonalList(personalList));
		}
		
		//고정지출 가져오기
		List<FExpense> fixedList = managementRepository.selectFixedExpense(id, date);
		System.out.println("FixedList : " + fixedList);
		
		if(!fixedList.isEmpty()) {
			eventList.addAll(getFixedList(fixedList));
		}
		
		System.out.println("eventList : " + eventList);
		return eventList;
	}
	
	private List<Map<String, Object>> getFixedList(List<FExpense> expenseList) {
		List<Map<String, Object>> eventList = new ArrayList<Map<String,Object>>();
		for (FExpense expense : expenseList) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", expense.getExpDate());
			map.put("title", expense.getContent());
			map.put("category", expense.getCategory());
			map.put("price", expense.getPrice());
			map.put("expIdx", expense.getFExpIdx());
			map.put("fixedDate", expense.getFixedDate());
			map.put("fixedStart", expense.getStartDate());
			map.put("fixedEnd", expense.getEndDate());
			map.put("color", "white");
			map.put("backgroundColor", "#ff5050");
			eventList.add(map);
		}
		return eventList;
	}
	
	private List<Map<String, Object>> getPersonalList(List<Expense> expenseList) {
		List<Map<String, Object>> eventList = new ArrayList<Map<String,Object>>();
		for (Expense expense : expenseList) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", expense.getExpDate());
			map.put("title", expense.getContent());
			map.put("category", expense.getCategory());
			map.put("price", expense.getPrice());
			map.put("expIdx", expense.getExpIdx());
			map.put("color", "white");
			map.put("backgroundColor", "#009999");
			eventList.add(map);
		}
		return eventList;
	}

	@Override
	public void updatePersonalSpend(PersonalForm form) {
		managementRepository.updatePersonalExpense(form);
	}

	@Override
	public void updateFixedSpend(FixedForm form) {
		managementRepository.updateFixedExpense(form);
	}

	@Override
	public void deletePersonalSpend(String expIdx) {
		managementRepository.deletePersonalExpense(expIdx);
	}

	@Override
	public void deleteFixedSpend(String expIdx) {
		managementRepository.deleteFixedExpense(expIdx);
	}

	@Override
	public List<String> selectTodayFixedSpend(String id) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-");
		String monthStr = format.format(new Date());
		
		return managementRepository.selectTodayFixedExpense(id, monthStr);
	}

}
