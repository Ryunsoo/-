package com.kh.hehyeop.mypage.validator;

import lombok.Data;

@Data
public class JoinForm {

	private String id;
	private String password;
	private String name;
	private String tell;
	private String email;
	private String nickname;
	private String address;
	private String oldAddress;
	private String company;
	private int status;

	
}
