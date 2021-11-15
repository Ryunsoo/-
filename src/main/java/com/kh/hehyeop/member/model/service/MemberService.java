package com.kh.hehyeop.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.kh.hehyeop.member.model.dto.CMember;
import com.kh.hehyeop.member.model.dto.Member;
import com.kh.hehyeop.member.validator.CoJoinForm;
import com.kh.hehyeop.member.validator.FieldForm;
import com.kh.hehyeop.member.validator.JoinForm;

public interface MemberService {

	void insertMember(JoinForm form);

	Member selectMemberByUserId(String id);

	void selectIdByEmail(Member member, String token);
	
	void selectPasswordByEmail(Member member, String token);

	void authenticateByEmail(JoinForm form, String token);
	
	Member selectMemberByNickname(String nickname);

	void co_authenticateByEmail(CoJoinForm form, String token);

	void insertCMember(CoJoinForm coForm);

	Member authenticateUser(Member member);
	
	CMember authenticateCUser(CMember cmember);

	ArrayList<FieldForm> selectField();

	ArrayList<String> selectCategory();

	void insertFields(String id, List<String> fields);

}
