package com.kh.hehyeop.purchase.model.dto;

import java.util.Date;

import lombok.Data;

@Data
public class RegisterInfo {
	
	private String regIdx;
	private String id;
	private String itemName;
	private String itemLink;
	private String dealLoc;
	private String endTime;
	private String dealTime;
	private int price;
	private int totalNum;
	private int buyNum;
	private int restNum;
	private String content;
	private char done;
	
}
