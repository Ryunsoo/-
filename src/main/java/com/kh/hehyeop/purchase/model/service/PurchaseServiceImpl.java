package com.kh.hehyeop.purchase.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kh.hehyeop.purchase.model.dto.DetailInfo;
import com.kh.hehyeop.purchase.model.dto.MyPurchaseInfo;
import com.kh.hehyeop.purchase.model.dto.PurchaseMain;
import com.kh.hehyeop.purchase.model.repository.PurchaseRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import com.kh.hehyeop.common.util.file.FileUtil;
import com.kh.hehyeop.common.util.paging.Paging;
import com.kh.hehyeop.mypage.model.dto.MyAddress;
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
	public List<MyPurchaseInfo> selectMyPurchaseInfo(Paging paging, String ongoing, String done, String id) {
		return purchaseRepository.selectMyPurchaseInfo(paging, ongoing, done, id);
	}

	@Override
	public MyPurchaseInfo selectPurchaseInfoByIdx(String regIdx) {
		return purchaseRepository.selectPurchaseInfoByIdx(regIdx);
	}

	@Override
	public List<MyPurchaseInfo> purchaseParticipantsList(String regIdx) {
		return purchaseRepository.purchaseParticipantsList(regIdx);
	}
	
	@Override
	public List<PurchaseMain> selectRegisterList(String grade, List<String> addressList, String keyword, Paging paging) {
		return purchaseRepository.selectRegisterList(grade, addressList, keyword, paging);
	}

	@Override
	public MyAddress selectAddress(String id) {
		return purchaseRepository.selectAddress(id);
	}

	@Override
	public int countMyPurchase(String ongoing, String id, String done) {
		System.out.println("ongoing : " + ongoing);
		return purchaseRepository.countMyPurchase(ongoing, id, done);
	}

	@Override
	public int countRegister(String grade, List<String> addressList, String keyword) {
		return purchaseRepository.countRegister(grade, addressList, keyword);
	}

	@Override
	public void purchaseRequest(int buyNum, String id) {
		purchaseRepository.purchaseRequest(buyNum, id);
	}

	@Override
	public void purchaseMatch(String regIdx, int restNum, String join_idx, int matchLockedCash) {
		purchaseRepository.purchaseMatch(regIdx,restNum,join_idx,matchLockedCash);
		
	}

	@Override
	public String selectJoinIdx() {
		return purchaseRepository.selectJoinIdx();
	}

	@Override
	public void updateWallet(String id, int cash, int WalletLockedCash) {
		purchaseRepository.updateWallet(id, cash, WalletLockedCash);
		
	}

	@Override
	public int getCash(String id) {
		return purchaseRepository.getCash(id);
	}
	
	@Override
	public List<Object> selectjoinCount(String grade, List<String> addressList, String keyword, Paging paging) {
		return purchaseRepository.selectjoinCount(grade, addressList, keyword);
	}

	@Override
	public DetailInfo selectPurchaseDetail(String regIdx) {
		return purchaseRepository.selectPurchaseDetail(regIdx);
	}

	@Override
	public int selectBuyNum(String regIdx) {
		return purchaseRepository.selectBuyNum(regIdx);
	}

	@Override
	public void updatePoint(String id) {
		purchaseRepository.updatePoint(id);
	}

	@Override
	public List<String> selectJoinId(String regIdx) {
		return purchaseRepository.selectJoinId(regIdx);
	}

	@Override
	public void updateJoinStatus(List<String> joinIdxList) {
		purchaseRepository.updateJoinStatus(joinIdxList);
	}

	@Override
	public List<String> selectJoinList(String regIdx) {
		return purchaseRepository.selectJoinList(regIdx);
	}

	@Override
	public Integer ongoing(String regIdx, String id) {
		return purchaseRepository.ongoing(regIdx, id);
	}

	@Override
	public int selectLockedCash(String id, String regIdx) {
		return purchaseRepository.selectLockedCash(id, regIdx);
	}

	@Override
	public void sendCashtoSeller(String sellerId, int lockedCash) {
		purchaseRepository.sendCashtoSeller(sellerId, lockedCash);
		
	}
	
	@Override
	public int getTotalLockedCash(String id) {
		return purchaseRepository.getTotalLockedCash(id);
		
	}
	
	@Override
	public void updateMatchLockedCashAndOngoing(String joinIdx, String regIdx) {
		purchaseRepository.updateMatchLockedCashAndOngoing(joinIdx, regIdx);
		
	}
	
	@Override
	public void updateWalletLockedCash(String id,int totalLockedcash) {
		purchaseRepository.updateWalletLockedCash(id, totalLockedcash);
		
	}

	@Override
	public String selectMyJoinIdx(String id, String regIdx) {
		return purchaseRepository.selectMyJoinIdx(id, regIdx);
	}

	@Override
	public void dealDone(String regIdx) {
		purchaseRepository.dealDone(regIdx);
	}

	@Override
	public void purchaseUpdatePoint(String id) {
		purchaseRepository.purchaseUpdatePoint(id);
	}

	@Override
	public void SellerUpdatePoint(String sellerId) {
		purchaseRepository.SellerUpdatePoint(sellerId);
	}


}
