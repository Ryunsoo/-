package com.kh.hehyeop.management.model.dto;

import lombok.Data;

@Data
public class FExpense {

	private String fExpIdx;
	private String id;
	private String content;
	private String fixedDate;
	private String startDate;
	private String endDate;
	private int price;
	private String comPrice;
	private String expDate;
	private String category;
}
