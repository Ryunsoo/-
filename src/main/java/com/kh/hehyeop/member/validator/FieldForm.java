package com.kh.hehyeop.member.validator;

public class FieldForm {

	private String fieldCategory;
	private String field;

	public String getFieldCategory() {
		return fieldCategory;
	}

	public void setFieldCategory(String fieldCategory) {
		this.fieldCategory = fieldCategory;
	}

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	@Override
	public String toString() {
		return "FieldForm [fieldCategory=" + fieldCategory + ", field=" + field + "]";
	}

}
