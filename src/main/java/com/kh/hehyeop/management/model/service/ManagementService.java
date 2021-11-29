package com.kh.hehyeop.management.model.service;

import java.util.List;
import com.kh.hehyeop.management.model.dto.Icebox;
import java.util.Map;

import com.kh.hehyeop.management.model.dto.ShoppingList;
import com.kh.hehyeop.management.validator.FixedForm;
import com.kh.hehyeop.management.validator.PersonalForm;

public interface ManagementService {

	List<Icebox> selectIceboxUpList(String id, String category);

	List<Icebox> selectIceboxDownList(String id, String category);

	Map<String, List<ShoppingList>> selectShoppingListById(String id);

	int deleteItem(String shoppingIdx);

	int insertInputItem(String id, String item);

	int moveCheckedItem(String id, String[] idxArr);

	void insertPersonalSpend(String id, PersonalForm form);

	void insertFixedSpend(String id, FixedForm form);

}
