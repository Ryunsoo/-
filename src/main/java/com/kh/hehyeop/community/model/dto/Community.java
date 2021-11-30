package com.kh.hehyeop.community.model.dto;

import java.util.Date;

import lombok.Data;

@Data
public class Community {

	private String boardIdx;
	private String boardCategory;
	private String id;
	private String title;
	private String content;
	private int viewCnt;
	private Date regDate;
	private int isDel;
	private int isPrivate;
	private String nickname;
	private String parseDate;
	
}
