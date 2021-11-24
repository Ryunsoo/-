package com.kh.hehyeop.company.model.dto;

import java.sql.Date;

import lombok.Data;
@Data
public class MyRequest {

	private String reqIdx;
	private String id;
	private String reqName;
	private String reqTell;
	private String reqAddress;
	private String oldAddress;
	private String reqTime;
	private int reqPay;
	private String reqContent;
	private Date regDate;
	private String field;
	private int ongoing;
	private int status;
}
