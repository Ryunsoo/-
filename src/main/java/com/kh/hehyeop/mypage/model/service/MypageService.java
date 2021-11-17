package com.kh.hehyeop.mypage.model.service;

import java.util.List;

import com.kh.hehyeop.member.model.dto.Member;
import com.kh.hehyeop.member.validator.JoinForm;
import com.kh.hehyeop.mypage.model.dto.Wallet;

public interface MypageService {

	List<String> getValidTokens(String userId);
	List<String> getValidTokens(List<String> userIdList);
	void insertToken(String token,String device, String id);
	void deleteToken(String device,String id);
	void deleterUser(Member member);
	void updateWalletInfo(String id, String bank, String bankNum);
	Wallet selectWallet(String id);
	Member selectMemberByEmail(String email);
	void updateInfo(JoinForm form);
	
	
	
}
