package com.kh.hehyeop.purchase.model.dto;

import lombok.Data;

@Data
public class DetailInfo {

	private String regIdx;
	private String id;
	private String itemName;
	private String itemLink;
	private String dealLoc;
	private String endTime;
	private String dealTime;
	private int price;
	private String content;
	private int totalNum;
	private int restNum;
	private String link;
}
