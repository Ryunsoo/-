package com.kh.hehyeop.purchase.model.dto;


import lombok.Data;

@Data
public class MyPurchaseInfo {
	
	private String regIdx;
	private String matchIdx;
	private String joinIdx;
	private String id;
	private String itemName;
	private String dealLoc;
	private String dealTime;
	private int joinBuyNum;
	private int price;
	private int totalNum;
	private int buyNum;
	private String content;
	private String done;
	private int restNum;
	private int ongoing;
	private String buyerId;
	private String name;
	private String tell;
	private String nickname;

}
