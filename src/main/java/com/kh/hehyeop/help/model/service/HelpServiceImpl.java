package com.kh.hehyeop.help.model.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import com.kh.hehyeop.common.util.file.FileUtil;
import com.kh.hehyeop.help.model.dto.HelpRequest;
import com.kh.hehyeop.help.model.repositroy.HelpRepository;
import com.kh.hehyeop.company.model.dto.ProField;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class HelpServiceImpl implements HelpService{

	private final HelpRepository helpRepository;

	@Override
	public List<ProField> selectCategoryList() {
		
		return helpRepository.selectCategoryList();
	}

	@Override
	public List<ProField> selectFieldList() {
		return helpRepository.selectFieldList();
	}
	
	@Override
	public int insertRequest(HelpRequest helpRequest) {
		return helpRepository.insertRequest(helpRequest);
	}

	@Override
	public String selectReqIdx(String id) {
		return helpRepository.selectReqIdx(id);
	}

	@Override
	public int uploadFile(List<MultipartFile> files, String reqIdx) {
		FileUtil util = new FileUtil();
		int res = 0;
		for (MultipartFile multipartFile : files) {
			if(!multipartFile.isEmpty()) {
				res = helpRepository.uploadFile(util.fileUpload(multipartFile, reqIdx));
			}
		}
		return res;
	}

}
