package com.kh.hehyeop.purchase.model.dto;


import com.kh.hehyeop.member.model.dto.User;

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
	private String endTime;
	private int joinBuyNum;
	private int price;
	private int totalNum;
	private int buyNum;
	private String content;
	private String done;
	private int restNum;
	private Integer ongoing;
	private String buyerId;
	private String name;
	private String tell;
	private int cash;
	private String savePath;
	private String reName;
	private String itemLink;
	private String sellerId;
	private int cashLock;
	private User nickname;
}
