package com.kh.hehyeop.member.model.repository;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kh.hehyeop.common.util.file.FileDTO;
import com.kh.hehyeop.member.model.dto.CMember;
import com.kh.hehyeop.member.model.dto.Member;
import com.kh.hehyeop.member.validator.FieldForm;
import com.kh.hehyeop.member.validator.JoinForm;

@Mapper
public interface MemberRepository {

	@Insert("insert into member(id, password, name, tell, email, nickname, address, old_address) "
			+ "values(#{id}, #{password}, #{name}, #{tell}, #{email}, #{nickname}, #{address}, #{oldAddress})")
	void insertMember(JoinForm form);

	@Select("select * from member where id = #{id} and password = #{password} and is_leave = 0")
	Member authenticateUser(Member member);
	
	@Select("select * from member where id = #{id} and is_leave = 0")
	Member selectMember(String id);

//	find id
	@Select("select id from (select id, name, tell, email from member union select id, name, tell, email from member_c) where name = #{name} and tell = #{tell} and email = #{email} and is_leave = 0")
	String selectIdByEmail(@Param("name") String name, @Param("tell") String tell, @Param("email") String email);

//	member find password
	@Select("select * from member where name = #{name} and id = #{id} and email = #{email} and is_leave = 0")
	Member changePasswordByEmail(@Param("name") String name, @Param("id") String id, @Param("email") String email);
	
	@Select("select * from (select id, password from member union select id, password from member_c) where id = #{id}")
	Member selectMemberByUserId(String id);
	
	@Select("select nickname from member where nickname = #{nickname} and is_leave = 0")
	Member selectMemberByNickname(String nickname);
	
//	cmember
	
	@Insert("insert into member_c(id, password, name, tell, email, company, address, old_address, c_idx) "
			+ "values(#{id}, #{password}, #{name}, #{tell}, #{email}, #{nickname}, #{address}, #{oldAddress}, sc_c_idx.nextval)")
	void insertCMember(JoinForm form);
	
	@Select("select * from member_c where id = #{id} and password = #{password}")
	CMember authenticateCUser(CMember cmember);
	
	@Select("select * from member_c where name = #{name} and id = #{id} and email = #{email}")
	CMember C_changePasswordByEmail(@Param("name") String name, @Param("id") String id, @Param("email") String email);
	
	@Select("select * from member_c where id = #{id}")
	CMember selectCMember(String id);

	@Select("select * from (select id, password from member union select id, password from member_c) where id = #{id}")
	CMember selectCMemberByUserId(String id);
	
	@Select("select * from pro_field")
	ArrayList<FieldForm> selectField();
	
	@Select("select distinct field_category from pro_field")
	ArrayList<String> selectCategory();

	void insertFields(@Param("id") String id, @Param("fields") List<String> fields);
	
	@Update("update member set password = #{password} where id = #{id} and email = #{email}")
	void updatePassword(@Param("password") String password, @Param("id") String id, @Param("email") String email);
	
	@Update("update member_c set password = #{password} where id = #{id} and email = #{email}")
	void c_updatePassword(@Param("password") String password, @Param("id") String id, @Param("email") String email);

	@Insert("insert into file_info(file_idx, file_category, origin_name, re_name, save_path, type_idx) "
			+ "values(sc_file_idx.nextval, 'MEMBER_C', #{originName}, #{reName}, #{savePath}, #{typeIdx})")
	void uploadFile(FileDTO fileDTO);
	
	@Select("select * from member where id = #{id}")
	Member selectSocialMemberByUserId(String id);

	@Update("update member set is_leave = 1 where id = #{id} and password = #{password}")
	void deleterUser(Member member);

}
