package com.kh.hehyeop.company.validator;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ResponseForm {

	private String resName;
	private String resTell;
	private String resTime;
	private int resPrice;
	private String resContent;
	private List<MultipartFile> files;
	
}
