package com.kh.hehyeop.management.model.service;

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
}
