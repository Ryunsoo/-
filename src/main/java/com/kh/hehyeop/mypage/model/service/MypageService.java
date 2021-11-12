package com.kh.hehyeop.mypage.model.service;

import java.util.List;

public interface MypageService {

	List<String> getValidTokens(String userId);
	void insertMobileToken(String token, String id);
	void insertPcToken(String token, String id);
	
}
