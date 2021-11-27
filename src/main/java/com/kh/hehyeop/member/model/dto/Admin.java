package com.kh.hehyeop.member.model.dto;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class Admin extends User{

	private String id;
	private String password;
	private String grade;
}
