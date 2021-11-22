package com.kh.hehyeop.purchase.model.service;

import java.util.List;

import com.kh.hehyeop.purchase.model.dto.MyPurchaseInfo;
import org.springframework.web.multipart.MultipartFile;


import com.kh.hehyeop.purchase.validator.RegisterForm;

public interface PurchaseService {

	List<MyPurchaseInfo> selectMyPurchaseInfo(String id);
	String selectRegIdx();
	int registerInfo(RegisterForm form);
	int uploadFile(List<MultipartFile> files, String typeIdx);
	MyPurchaseInfo selectPurchaseInfoByIdx(String regIdx);

}
