package com.kh.hehyeop.help.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class MyHehyeop {

	private String reqIdx;
	private String field;
	private String area;
	private Date regDate;
	private int estimateCnt;
	private String company; //선택
	private String grade; //선택
	private String payMeans; //선택
	private double score; //선택
	private int state;
	private String ongoing;
}
