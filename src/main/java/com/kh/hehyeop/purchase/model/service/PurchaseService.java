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

	List<MyPurchaseInfo> selectMyPurchaseInfo(Paging paging, String ongoing, String done, String id);
	
	String selectRegIdx();
	
	int registerInfo(RegisterForm form);
	
	int uploadFile(List<MultipartFile> files, String typeIdx);
	
	MyPurchaseInfo selectPurchaseInfoByIdx(String regIdx);
	
	List<MyPurchaseInfo> purchaseParticipantsList(String regIdx);
	
	int countMyPurchase(String ongoing, String id, String done);
	
	List<PurchaseMain> selectRegisterList(String grade, List<String> addressList, String keyword, Paging paging);
	
	MyAddress selectAddress(String id);
	
	int countRegister(String grade, List<String> addressList, String keyword);
	List<Object> selectjoinCount(String grade, List<String> addressList, String keyword, Paging paging);

	void purchaseMatch(String regIdx, int restNum, String join_idx, int matchLockedCash);
	
	void purchaseRequest(int buyNum, String id);
	
	String selectJoinIdx();
	
	void updateWallet(String id, int cash, int WalletLockedCash);
	
	int getCash(String id);

	DetailInfo selectPurchaseDetail(String regIdx);

	int selectBuyNum(String regIdx);

	void updatePoint(String id);

	List<String> selectJoinId(String regIdx);

	void updateJoinStatus(List<String> joinIdxList);

	List<String> selectJoinList(String regIdx);

	Integer ongoing(String regIdx, String id);

	int selectLockedCash(String id, String regIdx);

	void sendCashtoSeller(String sellerId, int lockedCash);

	int getTotalLockedCash(String id);

	void updateMatchLockedCashAndOngoing(String joinIdx, String regIdx);

	void updateWalletLockedCash(String id, int totalLockedcash);

	String selectMyJoinIdx(String id, String regIdx);

	void dealDone(String regIdx);

	void purchaseUpdatePoint(String id);

	void SellerUpdatePoint(String sellerId);

	String findBuyer(String regIdx);

	void buyerCancel(String joinIdx, String regIdx);

	void returnLockedCash(String id, int cash);

	void plusRestNum(String regIdx, int buyNum);

	MyPurchaseInfo detailRemoveCheck(String regIdx, String id);

	void detailRemove(String regIdx, String id);




}
