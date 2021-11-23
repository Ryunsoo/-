package com.kh.hehyeop.purchase.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.hehyeop.common.util.paging.Paging;
import com.kh.hehyeop.mypage.model.dto.MyAddress;
import com.kh.hehyeop.purchase.model.dto.DetailInfo;
import com.kh.hehyeop.purchase.model.dto.MyPurchaseInfo;
import com.kh.hehyeop.purchase.model.dto.PurchaseMain;
import com.kh.hehyeop.purchase.validator.RegisterForm;

public interface PurchaseService {

	List<MyPurchaseInfo> selectMyPurchaseInfo(Paging paging, String ongoing, String id);
	
	String selectRegIdx();
	
	int registerInfo(RegisterForm form);
	
	int uploadFile(List<MultipartFile> files, String typeIdx);
	
	MyPurchaseInfo selectPurchaseInfoByIdx(String regIdx);
	
	List<MyPurchaseInfo> purchaseParticipantsList(String regIdx);
	
	int countMyPurchase(String ongoing, String id);
	
	List<PurchaseMain> selectRegisterList(String grade, List<String> addressList, String keyword, Paging paging);
	
	MyAddress selectAddress(String id);
	
	int countRegister(String grade, List<String> addressList, String keyword);
	List<Object> selectjoinCount(String grade, List<String> addressList, String keyword, Paging paging);

	void purchaseMatch(String regIdx, int restNum, String join_idx);
	
	void purchaseRequest(int buyNum, String id);
	
	String selectJoinIdx();
	
	void usedPoint(String id, int cash);
	
	int getCash(String id);

	DetailInfo selectPurchaseDetail(String regIdx);

	int selectBuyNum(String regIdx);

	void updatePoint(String id);

	List<String> selectJoinId(String regIdx);

	void updateJoinPoint(List<String> joinList);

}
