package com.kh.hehyeop.mypage.model.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kh.hehyeop.mypage.model.dto.Token;

@Mapper
public interface MypageRepository {

	@Select("select * from push_token where id = #{userId}")
	Token selectPushTokensById(String userId);

	void insertToken(Map<String, Object> tokenMap);

	void deleteToken(Map<String, Object> tokenMap);

	List<Token> selectPushTokensByManyId(List<String> userIdList);
	
}
