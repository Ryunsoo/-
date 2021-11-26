package com.kh.hehyeop.admin.model.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.kh.hehyeop.admin.model.dto.CMember;
import com.kh.hehyeop.common.util.paging.Paging;

@Mapper
public interface AdminRepository {

	@Select("select * from (select v.*, rownum rnum from member_c v where is_permit = 0) where rnum between #{paging.start} and #{paging.end}")
	List<CMember> selectJoinRequest(@Param("paging") Paging paging);

	@Select("select * from (select v.*, rownum rnum from member_c v where is_permit = 2) where rnum between #{paging.start} and #{paging.end}")
	List<CMember> selectModifyRequest(@Param("paging") Paging paging);

	@Select("select count(*) from member_c where is_permit = 2")
	int selectModifyCount();

	@Select("select count(*) from member_c where is_permit = 0")
	int selectJoinCount();

	


}
