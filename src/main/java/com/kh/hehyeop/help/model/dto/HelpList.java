package com.kh.hehyeop.help.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class HelpList {

	private String reqIdx;
	private String field;
	private String oldAddress;
	private Date regDate;
	private int reqOngoing;
	private Integer matchOngoing;
	private Integer payStatus;
	private double score;
	private String company;
	private String grade;
	private Integer resOngoing;
	
}
