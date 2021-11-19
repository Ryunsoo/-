package com.kh.hehyeop.help.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class HelpMatch {

	private String helpIdx;
	private String reqIdx;
	private String resIdx;
	private int ongoing;
	private double score;
	private int payStatus;
	private Date regdate;
	private Date reviewDate;
}
