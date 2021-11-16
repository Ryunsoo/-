package com.kh.hehyeop.common.chat.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class ChatRoom {

	private String roomIdx;
	private String roomNo;
	private String id;
	private String nickname;
	private Date exitDate;
	
}
