package com.kh.hehyeop.help.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Review {
	private String helpIdx;
	private String field;
	private String oldAddress;
	private String company;
	private double score;
	private String nickname;
	private Date reviewDate;
}
