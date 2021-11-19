package com.kh.hehyeop.help.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class HelpResponse {

	private String resIdx;
	private String id;
	private String reqIdx;
	private String resTime;
	private int resPay;
	private String resContent;
	private int ongoing;
	private Date regDate;
	
	
}
