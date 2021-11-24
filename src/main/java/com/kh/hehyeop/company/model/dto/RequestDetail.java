package com.kh.hehyeop.company.model.dto;

import lombok.Data;

@Data
public class RequestDetail {

	private String reqIdx;
	private String reqName;
	private String reqTell;
	private String reqAddress;
	private String reqTime;
	private int reqPay;
	private String reqContent;
	private String reName;
	private String savePath;
	
	//formatting 한 값 저장 변수
	private String price;
}
