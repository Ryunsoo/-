package com.kh.hehyeop.admin.controller.model.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.hehyeop.admin.controller.model.dto.CMember;

@Mapper
public interface AdminRepository {

	@Select("select * from member_c where is_permit = 2")
	CMember selectJoinRequest();

	


}
