package com.kh.hehyeop.management.model.dto;

import lombok.Data;

@Data
public class FExpense {

	private String fExpIdx;
	private String id;
	private String content;
	private int price;
	private int days;
	private String cycle;
	private String startDate;
	private String endDate;
	private String comPrice;
}
