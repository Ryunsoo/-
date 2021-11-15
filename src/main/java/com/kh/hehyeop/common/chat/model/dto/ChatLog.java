package com.kh.hehyeop.common.chat.model.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class ChatLog {

	private String roomNo;
	private String roomName;
	private String chatData;
	private Date logUpdate;
	
}
