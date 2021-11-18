package com.kh.hehyeop.mypage.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.kh.hehyeop.member.model.dto.Member;
import com.kh.hehyeop.member.validator.JoinForm;
import com.kh.hehyeop.mypage.model.dto.Token;
import com.kh.hehyeop.mypage.model.dto.Wallet;
import com.kh.hehyeop.mypage.model.repository.MypageRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MypageServiceImpl implements MypageService{

	private final MypageRepository mypageRepository;
	private final PasswordEncoder passwordEncoder;
	
	@Override
	public List<String> getValidTokens(String userId) {
		List<String> validTokens = new ArrayList<String>();
		
		Token token = mypageRepository.selectPushTokensById(userId);
		if(token.getMobileToken() != null) validTokens.add(token.getMobileToken());
		if(token.getPcToken() != null) validTokens.add(token.getPcToken());
		
		return validTokens;
	}
	
	@Override
	public List<String> getValidTokens(List<String> userIdList) {
		List<String> validTokens = new ArrayList<String>();
		List<Token> tokenList = mypageRepository.selectPushTokensByManyId(userIdList);
		System.out.println(tokenList);
		
		for (Token token : tokenList) {
			if(token.getMobileToken() != null) validTokens.add(token.getMobileToken());
			if(token.getPcToken() != null) validTokens.add(token.getPcToken());
		}
		
		return validTokens;
	}

	@Override
	public void insertToken(String token, String device, String id) {
		mypageRepository.insertToken(Map.of("token",token,"device",device,"id",id));
	}

	@Override
	public void deleteToken(String device, String id) {
		mypageRepository.deleteToken(Map.of("device",device,"id",id));
		
	}

	@Override
	public void deleterUser(Member member) {
		mypageRepository.deleterUser(member);
		
	}

	@Override
	public void updateWalletInfo(String id, String bank, String bankNum) {
		mypageRepository.updateWalletInfo(id, bank, bankNum);
	}

	@Override
	public Wallet selectWallet(String id) {
		return mypageRepository.selectWallet(id);
	}

	@Override
	public Member selectMemberByEmail(String email) {
		return mypageRepository.selectMemberByEmail(email);
	}

	@Override
	public void updateInfo(JoinForm form) {
		form.setPassword(passwordEncoder.encode(form.getPassword()));
		mypageRepository.updateInfo(form);
		
	}

	@Override
	public void insertCash(Wallet chargeWallet) {
		mypageRepository.insertCash(chargeWallet);
	}
	
	@Override
	public Member authenticateUser(Member member) {
		member.setPassword(passwordEncoder.encode(member.getPassword()));
		return mypageRepository.authenticateUser(member);
	}




	

	


}
