package com.kh.hehyeop.admin.model.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kh.hehyeop.admin.model.dto.CMember;
import com.kh.hehyeop.common.util.file.FileDTO;
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

	@Select("select * from member_c where id = #{id}")
	CMember selectInfoById(String id);
	
	@Select("select * from (select v.*, rownum rnum from member_c v where is_permit = 1 and permit_date > current_date-3 and is_modify=0) where rnum between #{paging.start} and #{paging.end}")
	List<CMember> selectJoinFinishList(@Param("paging") Paging paging);

	@Select("select count(*) from member_c where is_permit = 1 and permit_date > current_date-3 and is_modify=0")
	int selectJoinFinishListCount();

	@Select("select a.* from file_info a join member_c b on (a.type_idx = b.c_idx) where id = #{id} and file_category = 'MEMBER_C'")
	List<FileDTO> selectFileInfoById(String id);

	@Select("select field from company_field where id = #{id}")
	List<String> selectFieldListById(String id);

	@Update("update member_c set is_permit = 1, is_modify = 2, permit_date = current_date where id = #{id}")
	void updatePermit(String id);

	@Select("select * from (select v.*, rownum rnum from member_c v where is_permit = 1 and permit_date > current_date-3 and is_modify=2) where rnum between #{paging.start} and #{paging.end}")
	List<CMember> selectModifyFinishList(@Param("paging") Paging paging);

	@Select("select count(*) from member_c where is_permit = 1 and permit_date > current_date-3 and is_modify=2")
	int selectModifyFinishListCount();

	@Update("update member_c set is_permit=0, is_modify=3 where id = #{id}")
	void cancelApproval(String id);

}
