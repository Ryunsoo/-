package com.kh.hehyeop.help.validator;

import java.util.regex.Pattern;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.kh.hehyeop.help.model.repositroy.HelpRepository;

@Component
public class RequestFormValidator implements Validator{
	
	private HelpRepository helpRepository;
	
	public RequestFormValidator(HelpRepository helpRepository) {
		this.helpRepository = helpRepository;
	}
	
	@Override
	public boolean supports(Class<?> clazz) {
		return RequestForm.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		RequestForm form = (RequestForm) target;
		boolean valid = true;
		
		if(form.getReqTell() != null) {
			valid = Pattern.matches("^\\d{9,11}$", form.getReqTell());
			
			if (!valid) {
				errors.rejectValue("reqTell", "error-reqTell", "전화번호는 9~11자리의 숫자입니다.");
			}
		}

		String reqPay = String.valueOf(form.getReqPay());  
		if(reqPay != null) {
			valid = Pattern.matches("^[0-9]*$", reqPay);
			
			if (!valid) {
				errors.rejectValue("reqPay", "error-reqPay", "희망금액은 숫자만 입력 가능합니다.");
			}
		}
		
		
		
		
		
		
		
	}

}
