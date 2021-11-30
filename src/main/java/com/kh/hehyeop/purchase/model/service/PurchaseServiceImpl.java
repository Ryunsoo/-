package com.kh.hehyeop.purchase.model.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.kh.hehyeop.purchase.model.dto.DetailInfo;
import com.kh.hehyeop.purchase.model.dto.MyPurchaseInfo;
import com.kh.hehyeop.purchase.model.dto.PurchaseMain;
import com.kh.hehyeop.purchase.model.repository.PurchaseRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import com.kh.hehyeop.common.push.PushSender;
import com.kh.hehyeop.common.util.file.FileUtil;
import com.kh.hehyeop.common.util.paging.Paging;
import com.kh.hehyeop.member.model.dto.CMember;
import com.kh.hehyeop.member.model.dto.Member;
import com.kh.hehyeop.member.model.dto.User;
import com.kh.hehyeop.mypage.model.dto.MyAddress;
import com.kh.hehyeop.purchase.validator.RegisterForm;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PurchaseServiceImpl implements PurchaseService {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	private final PushSender pushSender;
	private final PurchaseRepository purchaseRepository;
	HttpSession session;

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
	public void purchaseMatch(String regIdx, int restNum, String join_idx, int matchLockedCash, String nickname, String itemName) {
		//match테이블 인서트
		purchaseRepository.purchaseMatch(regIdx,restNum,join_idx,matchLockedCash);
		
		User sellerId = purchaseRepository.sellerId(regIdx);
		
		//판매자에게 공구 신청 푸시
		pushSender.send(sellerId, "공구해협", nickname+"님이 " + itemName + " 공구를 신청 하셨습니다.");
		
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
	public void updateJoinStatus(List<String> joinIdxList, String regIdx, String sellerNickname) {
		
		//구매자들 리스트
		List<User> userList = purchaseRepository.selectJoinIdList(regIdx);
		//구매자들에게 공구 확정 푸시
		String itemName = purchaseRepository.selectItemName(regIdx);
		pushSender.send(userList, "공구해협", sellerNickname + "님이 " + itemName + " 공구를 확정 하셨습니다.");
		
		//상태 바꿔주기
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
	public void updateMatchLockedCashAndOngoing(String joinIdx, String regIdx, String buyerNickname, int LockedCash) {
		
		purchaseRepository.updateMatchLockedCashAndOngoing(joinIdx, regIdx);
		
		//판매자에게 공구 구매 완료 푸시
		User sellerId = purchaseRepository.sellerId(regIdx);
		String itemName = purchaseRepository.selectItemName(regIdx);
		pushSender.send(sellerId, "공구해협", buyerNickname + "님이 " + itemName + " 구매를 완료 하셨습니다. \n* " + LockedCash + "Cash가 입금되었습니다.");
		
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

	@Override
	public List<String> findBuyer(String regIdx) {
		return purchaseRepository.findBuyer(regIdx);
		
	}
	
	@Override
	public void buyerCancel(String joinIdx, String regIdx, String buyerNickname) {
		purchaseRepository.buyerCancelMatchTbl(joinIdx, regIdx);
		purchaseRepository.buyerCancelJoinTbl(joinIdx);
		
		//판매자에게 공구 취소 푸시
		User sellerId = purchaseRepository.sellerId(regIdx);
		String itemName = purchaseRepository.selectItemName(regIdx);
		pushSender.send(sellerId, "공구해협", buyerNickname + "님이 " + itemName + " 공구를 취소 하셨습니다.");
		
	}

	@Override
	public void returnLockedCash(String id, int cash) {
		purchaseRepository.returnLockedCash(id, cash);
		
	}

	@Override
	public void plusRestNum(String regIdx, int buyNum) {
		purchaseRepository.plusRestNum(regIdx, buyNum);
		
	}

	@Override
	public MyPurchaseInfo detailRemoveCheck(String regIdx, String id) {
		MyPurchaseInfo myPurchaseInfo = purchaseRepository.detailRemoveCheck(regIdx, id);
		return myPurchaseInfo;
	}

	@Override
	public void detailRemove(String regIdx, String id) {
		purchaseRepository.detailRemove(regIdx, id);
		purchaseRepository.detailRemoveFile(regIdx);
	}

	@Override
	public int selectCancelBuyNum(String joinIdx) {
		return purchaseRepository.selectCancelBuyNum(joinIdx);
	}

	@Override
	public void updateDone(String regIdx) {
		purchaseRepository.updateDone(regIdx);
	}

	@Override
	public List<String> findChatList(String regIdx) {
		return purchaseRepository.findChatList(regIdx);
	}


}
