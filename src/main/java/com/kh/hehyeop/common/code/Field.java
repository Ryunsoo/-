package com.kh.hehyeop.common.code;

import java.util.ArrayList;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.kh.hehyeop.company.model.dto.ProField;

public enum Field {

	BATH("욕실", "수리 | 보수", "[수리 | 보수] 욕실"),
	SINK("싱크대", "수리 | 보수", "[수리 | 보수] 싱크대"),
	APPLIANCE("가전", "수리 | 보수", "[수리 | 보수] 가전"),
	TILE("타일", "인테리어", "[인테리어] 타일"),
	PAINT("페인트", "인테리어", "[인테리어] 페인트"),
	PAPER("도배", "인테리어", "[인테리어] 도배"),
	MOVING("용달", "인테리어", "[인테리어] 용달"),
	ASSEMBLE("가구조립", "인테리어", "[인테리어] 가구조립"),
	CCTV("폐쇄회로", "보안 | 방충", "[보안 | 방충] 폐쇄회로"),
	LOCK("도어락", "보안 | 방충", "[보안 | 방충] 도어락"),
	SCREEN("방충", "보안 | 방충", "[보안 | 방충] 방충"),
	CLEANING("청소", "생활", "[생활] 청소"),
	WASHING("세탁", "생활", "[생활] 세탁"),
	FOOD("식품 정기배송", "생활", "[생활] 식품 정기배송");
	
	
	public final String field;
	public final String fieldCate;
	public final String fullName;
	
	Field(String field, String fieldCate, String fullName) {
		this.field = field;
		this.fieldCate = fieldCate;
		this.fullName = fullName;
	}
	
	public static Field getField(String fieldName) {
		EnumSet<Field> fieldSet = EnumSet.allOf(Field.class);
		for (Field field : fieldSet) {
			if(fieldName.equals(field.field)) return field;
		}
		return null;
	}
	
	public static List<Map<String, String>> getFieldList() {
		List<Map<String, String>> list = new ArrayList<Map<String,String>>();
		EnumSet<Field> fieldSet = EnumSet.allOf(Field.class);
		for (Field field : fieldSet) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("field", field.field);
			map.put("fullName", field.fullName);
			list.add(map);
		}
		
		return list;
	}
}
