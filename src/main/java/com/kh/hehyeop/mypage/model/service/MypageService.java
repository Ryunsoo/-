package com.kh.hehyeop.mypage.model.service;

import java.util.List;

public interface MypageService {

	List<String> getValidTokens(String userId);
	void insertToken(String token,String device, String id);
	void deleteMobileToken(String id);
	void deletePcToken(String id);
	
}
