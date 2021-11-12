package com.kh.hehyeop.mypage.model.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface MypageRepository {

	@Select("select * from ")
	List<String> selectValidTokensById(String userId);
	
}
