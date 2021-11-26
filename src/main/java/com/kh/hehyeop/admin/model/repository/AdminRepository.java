package com.kh.hehyeop.admin.model.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.hehyeop.admin.model.dto.CMember;

@Mapper
public interface AdminRepository {

	@Select("select * from member_c where is_permit = 2")
	CMember selectJoinRequest();

	


}
