package com.kh.hehyeop.mypage.model.dto;

import lombok.Data;

@Data
public class Wallet {
	
	private String id;
	private int category;
	private int cash;
	private int cashLock;
	private String bank;
	private String bankNum;

}
