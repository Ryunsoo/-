package com.kh.hehyeop.management.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Icebox {

	private String iceIdx;
	private String id;
	private String item;
	private int category;
	private Date exDate;
	private Date regDate;
	private int resDay;
}
