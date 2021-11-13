package com.kh.hehyeop.member.model.dto;

import lombok.Data;

@Data
public class User {

	private String id;
	private String name;
	private String email;
	private String nickname;
	private String address;
	private String oldAddress;
	private String grade;

	public User() {
		
	}
	
	public User(String id, String name, String email, String nickname, String address, String oldAddress,
			String grade) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.nickname = nickname;
		this.address = address;
		this.oldAddress = oldAddress;
		this.grade = grade;
	}
	
	
}
