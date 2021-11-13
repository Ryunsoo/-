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

	@Update("update push_token set mobile_token=null where id=#{id}")
	void deleteMobileToken(String id);

	@Update("update push_token set pc_token=null where id=#{id}")
	void deletePcToken(String id);


	
}
