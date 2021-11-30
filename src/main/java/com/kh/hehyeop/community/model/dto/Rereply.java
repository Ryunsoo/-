package com.kh.hehyeop.community.model.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Rereply {
	
	private String reReplyIdx;
	private String replyIdx;
	private String id;
	private String nickname;
	private String content;
	private Date regDate;
	private String parseDate;
	private int isDel;

}
