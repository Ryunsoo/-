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
	private String company;
	private String payMeans;
	private int score;
	private int state;
}
