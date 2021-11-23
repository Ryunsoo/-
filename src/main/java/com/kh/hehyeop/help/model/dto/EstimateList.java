package com.kh.hehyeop.help.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class EstimateList {
	private String resIdx;
	private String resTime;
	private int resPay;
	private String resContent;
	private int ongoing;
	private Date regDate;
	private String address;
	private String company;
	private String id;
	private String tell;
	private String grade;
}
