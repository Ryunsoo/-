package com.kh.hehyeop.member.model.repository;

import java.util.ArrayList;
import java.util.List;


import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.kh.hehyeop.member.model.dto.CMember;
import com.kh.hehyeop.member.model.dto.Member;
import com.kh.hehyeop.member.validator.FieldForm;
import com.kh.hehyeop.member.validator.JoinForm;

@Mapper
public interface MemberRepository {

	@Insert("insert into member(id, password, name, tell, email, nickname, address, old_address) "
			+ "values(#{id}, #{password}, #{name}, #{tell}, #{email}, #{nickname}, #{address}, #{oldAddress})")
	void insertMember(JoinForm form);

	@Select("select * from member where id = #{id} and password = #{password}")
	Member authenticateUser(Member member);

//	member find id
	@Select("select id from (select id, name, tell, email from member union select id, name, tell, email from member_c) where name = #{name} and tell = #{tell} and email = #{email}")
	String selectIdByEmail(@Param("name") String name, @Param("tell") String tell, @Param("email") String email);

//	member find password
	@Select("select email from (select name, id, email from member union select name, id, email from member_c) where name = 'test' and id = 'test' and email = 'alssgo70051@gmail.com'")
	String selectPasswordByEmail(String name, String id, String email);
	
	@Select("select * from (select id, password from member union select id, password from member_c) where id = #{id}")
	Member selectMemberByUserId(String id);
	
	@Select("select nickname from member where nickname = #{nickname}")
	Member selectMemberByNickname(String nickname);
	
//	cmember
	
	@Insert("insert into member(id, password, name, tell, email, nickname, address, old_address, point, grade, reg_date, is_leave) "
			+ "values(#{id}, #{password}, #{name}, #{tell}, #{email}, #{nickname}, #{address}, #{oldAddress}, #{point}, #{grade}, #{reg_date}, #{is_leave})")
	void insertCMember(Member member);
	
	@Select("select * from member_c where id = #{id} and password = #{password}")
	CMember authenticateCUser(CMember cmember);
	
	@Select("select password from c_member where name = #{name} and id = #{id} and email = #{email}")
	CMember C_selectPasswordByEmail(CMember cmember);
	

	@Select("select * from (select id, password from member union select id, password from member_c) where id = #{id}")
	CMember selectCMemberByUserId(String id);
	
	@Select("select * from pro_field")
	ArrayList<FieldForm> selectField();
	
	@Select("select distinct field_category from pro_field")
	ArrayList<String> selectCategory();

	void insertFields(@Param("id") String id, @Param("fields") List<String> fields);
	


}
