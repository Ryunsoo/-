package com.kh.hehyeop.purchase.model.service;

import java.util.List;
import java.util.Map;

import com.kh.hehyeop.common.util.paging.Paging;
import com.kh.hehyeop.mypage.model.dto.MyAddress;
import com.kh.hehyeop.purchase.model.dto.MyPurchaseInfo;
import com.kh.hehyeop.purchase.model.dto.PurchaseMain;

import org.springframework.web.multipart.MultipartFile;


import com.kh.hehyeop.purchase.validator.RegisterForm;

public interface PurchaseService {

	List<MyPurchaseInfo> selectMyPurchaseInfo(String id);
	String selectRegIdx();
	int registerInfo(RegisterForm form);
	int uploadFile(List<MultipartFile> files, String typeIdx);
	MyPurchaseInfo selectPurchaseInfoByIdx(String regIdx);
	List<PurchaseMain> selectRegisterList(String grade, List<String> addressList, String keyword, Paging paging);
	MyAddress selectAddress(String id);
	int countRegister(String grade, List<String> addressList, String keyword);

}
