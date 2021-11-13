package com.kh.hehyeop.mypage.model.repository;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface MypageRepository {

	@Select("select * from push_token where id = #{userId}")
	Map<String, String> selectPushTokensById(String userId);

	void insertToken(Map<String, Object> tokenMap);

	void deleteToken(Map<String, Object> tokenMap);

	
}
