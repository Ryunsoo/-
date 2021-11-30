package com.kh.hehyeop.community.model.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Reply {
	
	private String replyIdx;
	private String boardIdx;
	private String id;
	private String content;
	private Date regDate;
	private String parseDate;
	private int isDel;
	private String nickname;

}
