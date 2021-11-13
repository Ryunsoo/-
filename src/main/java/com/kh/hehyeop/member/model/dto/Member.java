package com.kh.hehyeop.member.model.dto;

import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Setter;

@Data
@EqualsAndHashCode(callSuper = false)
public class Member extends User {
	
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

	public Member() {
		super();
	}

	public Member(String id, String name, String email, String nickname, String address, String oldAddress,
			String grade) {
		super(id, name, email, nickname, address, oldAddress, grade);
	}
	
}
