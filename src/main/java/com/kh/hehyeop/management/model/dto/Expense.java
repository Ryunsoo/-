package com.kh.hehyeop.management.model.dto;

import lombok.Data;

@Data
public class Expense {
	
	private String expIdx;
	private String category;
	private String eCategory;
	private String id;
	private String content;
	private int price;
	private String expDate;
	private String comPrice;
	private int accPrice;
	private String comAccPrice;
	
}
