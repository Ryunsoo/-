package com.kh.hehyeop.management.validator;

import lombok.Data;

@Data
public class FixedForm {

	private String content;
	private int days;
	private String cycle;
	private String startDate;
	private String endDate;
	private int price;
	
}
