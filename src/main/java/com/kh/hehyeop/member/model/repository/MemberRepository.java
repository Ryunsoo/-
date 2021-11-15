package com.kh.hehyeop.member.model.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.hehyeop.member.model.dto.CMember;
import com.kh.hehyeop.member.model.dto.Member;
import com.kh.hehyeop.member.validator.JoinForm;

@Mapper
public interface MemberRepository {

	@Insert("insert into member(id, password, name, tell, email, nickname, address, old_address) "
			+ "values(#{id}, #{password}, #{name}, #{tell}, #{email}, #{nickname}, #{address}, #{oldAddress})")
	void insertMember(JoinForm form);

	@Select("select * from member where id = #{id} and password = #{password}")
	Member authenticateUser(Member member);

	@Select("select id from member where name = #{name} and tell = #{tell} and email = #{email}")
	Member selectIdByEmail(String id);
	
	@Select("select password from member where name = #{name} and id = #{id} and email = #{email}")
	Member selectPasswordByEmail(String id);
	
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
	
	@Select("select id from member where name = #{name} and tell = #{tell} and email = #{email}")
	Member C_selectIdByEmail(String id);
	
	@Select("select password from member where name = #{name} and id = #{id} and email = #{email}")
	Member C_selectPasswordByEmail(String id);
	

	@Select("select * from (select id, password from member union select id, password from member_c) where id = #{id}")
	CMember selectCMemberByUserId(String id);

}
