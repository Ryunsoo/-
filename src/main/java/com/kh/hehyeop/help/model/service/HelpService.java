package com.kh.hehyeop.help.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;
import com.kh.hehyeop.help.model.dto.HelpRequest;
import com.kh.hehyeop.company.model.dto.ProField;


public interface HelpService {


	int insertRequest(HelpRequest helpRequest);

	String selectReqIdx(String id);

	int uploadFile(List<MultipartFile> files, String reqIdx);

	List<ProField> selectCategoryList();

	List<ProField> selectFieldList();

}
