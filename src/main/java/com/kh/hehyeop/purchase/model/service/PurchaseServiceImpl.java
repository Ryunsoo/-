package com.kh.hehyeop.purchase.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import com.kh.hehyeop.purchase.model.dto.MyPurchaseInfo;
import com.kh.hehyeop.purchase.model.repository.PurchaseRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import com.kh.hehyeop.common.util.file.FileDTO;
import com.kh.hehyeop.common.util.file.FileUtil;

import com.kh.hehyeop.purchase.model.dto.RegisterInfo;
import com.kh.hehyeop.purchase.validator.RegisterForm;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PurchaseServiceImpl implements PurchaseService {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	private final PurchaseRepository purchaseRepository;

	@Override
	public int registerInfo(RegisterForm form) {
		logger.debug(form.toString());
		return purchaseRepository.registerInfo(form);
	}

	@Override
	public String selectRegIdx() {
		return purchaseRepository.selectRegIdx();
	}

	@Override
	public int uploadFile(List<MultipartFile> files, String typeIdx) {
		FileUtil util = new FileUtil();
		int res = 0;
		for (MultipartFile multipartFile : files) {
			if (!multipartFile.isEmpty()) {
				res = purchaseRepository.uploadFile(util.fileUpload(multipartFile, typeIdx));
			}
		}

		return res;
	}

	@Override
	public List<MyPurchaseInfo> selectMyPurchaseInfo(String id) {
		return purchaseRepository.selectMyPurchaseInfo(id);
	}

	@Override
	public MyPurchaseInfo selectPurchaseInfoByIdx(String regIdx) {
		return purchaseRepository.selectPurchaseInfoByIdx(regIdx);
	}

	@Override
	public List<Map<String, Object>> selectRegisterList() {
		List<RegisterInfo> regInfoList = purchaseRepository.selectRegisterList();
		List<FileDTO> regFileList = purchaseRepository.selectRegisterFileList();
		List<Map<String, Object>> mainList = new ArrayList<Map<String, Object>>();

		for (int i = 0; i < regInfoList.size(); i++) {
			mainList.add(Map.of("regInfo", regInfoList.get(i), "fileInfo", regFileList.get(i)));
		}

		return mainList;
	}

}
