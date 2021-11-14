package com.kh.hehyeop.mypage.model.service;

import java.util.List;

public interface MypageService {

	List<String> getValidTokens(String userId);
	List<String> getValidTokens(List<String> userIdList);
	void insertToken(String token,String device, String id);
	void deleteToken(String device,String id);
	
	
	
}
