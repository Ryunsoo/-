package com.kh.hehyeop.member.model.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Member {
	
	private String id;
	private String password;
	private String name;
	private String tell;
	private String email;
	private String nickname;
	private String address;
	private String oldAddress;
	private int point;
	private String grade;
	private Date regDate;
	private int isLeave;
	
}
