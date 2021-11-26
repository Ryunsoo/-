package com.kh.hehyeop.common.code;

import java.util.EnumSet;
import java.util.HashSet;
import java.util.Set;

public enum ExpenseCate {

	FOOD("식비", "food"),
	TRAFFIC("교통비", "traffic"),
	MEDICAL("의료", "medical"),
	FINANCE("금융", "finance"),
	SHOPPING("쇼핑", "shopping"),
	LESISURE("여가", "leisure"),
	LIVING("생활", "living"),
	EVENT("경조사비", "event"),
	OTHERS("기타", "others");
	
	public final String DESC;
	public final String CATEGORY;
	
	ExpenseCate(String desc, String category) {
		this.DESC = desc;
		this.CATEGORY = category;
	}
	
	public static Set<String> getCateName() {
		Set<String> cateNameSet = new HashSet<String>();
		EnumSet<ExpenseCate> cateSet = EnumSet.allOf(ExpenseCate.class);
		cateSet.forEach(e -> {
			cateNameSet.add(e.name().toString());
		});
		return cateNameSet;
	}
}
