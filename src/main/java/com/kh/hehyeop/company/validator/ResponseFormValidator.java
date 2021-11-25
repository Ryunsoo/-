package com.kh.hehyeop.company.validator;

import java.util.regex.Pattern;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class ResponseFormValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		return ResponseForm.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ResponseForm form = (ResponseForm) target;
		
		boolean valid = true;
		
		valid = Pattern.matches("^\\d{9,11}$", form.getResTell());
		if(!valid) {
			errors.rejectValue("resTell", "error-resTell", "전화번호는 9~11 자리의 숫자만 가능합니다.");
		}
		
		valid = true;
		
		String dateReg = "^\\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12]\\d|3[01])$";
		String timeReg = "^([0-1]\\d|2[0-3]):([0-5]\\d)";
		
		String[] dateTimeArr = form.getResTime().split("T");
		if(!Pattern.matches(dateReg, dateTimeArr[0])) {
			valid = false;
		}else if(!Pattern.matches(timeReg, dateTimeArr[1])) {
			valid = false;
		}
		
		if(!valid) {
			errors.rejectValue("resTime", "error-resTime", "날짜/시간 양식에 맞게 입력해주세요.");
		}
		
		if(form.getResPrice() < 0) {
			errors.rejectValue("resPrice", "error-resPrice", "금액을 다시 입력헤주세요.");
		}
		
		if(form.getFiles().size() == 1 && form.getFiles().get(0).getSize() == 0) {
			errors.rejectValue("files", "error-files", "견적서를 업로드 해주세요.");
		}else if(form.getFiles().size() >= 2) {
			errors.rejectValue("files", "error-files", "견적서는 하나만 업로드 가능합니다.");
		}else {
			String type =form.getFiles().get(0).getContentType();
			String[] typeArr = type.split("/");
			if(!type.equals("application/pdf") && !typeArr[0].equals("image")) {
				errors.rejectValue("files", "error-files", "이미지 파일 또는 pdf 파일만 업로드 가능합니다.");
			}
		}
		
	}
	
	
}
