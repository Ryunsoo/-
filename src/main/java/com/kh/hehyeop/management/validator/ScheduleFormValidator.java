package com.kh.hehyeop.management.validator;

import java.util.Set;
import java.util.regex.Pattern;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.kh.hehyeop.common.code.ExpenseCate;

@Component
public class ScheduleFormValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		if(PersonalForm.class.equals(clazz) || FixedForm.class.equals(clazz)) {
			return true;
		}
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
		if(target instanceof PersonalForm) {
			validatePersonalForm((PersonalForm) target, errors);
		}else if(target instanceof FixedForm) {
			validateFixedForm((FixedForm) target, errors);
		}
	}

	private void validatePersonalForm(PersonalForm form, Errors errors) {
		System.out.println("personalForm: " + form);
		System.out.println("validator 제목 : " + form.getContent());
		if(form.getContent().equals("")) {
			errors.rejectValue("content", "error-content", "error");
		}
		
		if(!hasCategory(form.getCategory())) {
			errors.rejectValue("category", "error-category", "error");
		}
		
		if(!Pattern.matches("^\\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12]\\d|3[01])$", form.getExpDate())) {
			errors.rejectValue("expDate", "error-expDate", "error");
		}
		
		if(form.getPrice() < 0) {
			errors.rejectValue("price", "error-price", "error");
		}
		
	}
	
	private void validateFixedForm(FixedForm form, Errors errors) {
		System.out.println("FixedForm: " + form);
		if(form.getContent() == null) {
			errors.rejectValue("content", "error-content");
		}
		
		if(form.getDays() < 0 || form.getDays() % 1 != 0) {
			errors.rejectValue("days", "error-days");
		}
		
		if(!form.getCycle().equals("day") && !form.getCycle().equals("month") && !form.getCycle().equals("year")) {
			errors.rejectValue("cycle", "error-cycle");
		}
		
		if(!Pattern.matches("^\\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12]\\d|3[01])$", form.getStartDate())) {
			errors.rejectValue("startDate", "error-startDate");
		}
		
		if(!Pattern.matches("^\\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12]\\d|3[01])$", form.getEndDate()) && form.getEndDate() != null) {
			errors.rejectValue("endDate", "error-endDate");
		}
		
		if(form.getPrice() < 0) {
			errors.rejectValue("price", "error-price");
		}
		
	}
	
	private boolean hasCategory(String category) {
		boolean valid = false;
		Set<String> cateNameSet = ExpenseCate.getCateName();
		
		if(category == null) return valid;
		
		for (String string : cateNameSet) {
			if(category.equals(string)) {
				valid = true;
			}
		}
		return valid;
	}


}
