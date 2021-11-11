package com.kh.hehyeop.member.model.service;

import com.kh.hehyeop.member.model.dto.Member;

public interface MemberService {

	void insertMember(Member member);

	Member authenticateUser(Member member);

	Member selectMemberByUserId(String userId);

	void selectIdByEmail(Member member, String token);
	
	void selectPasswordByEmail(Member member, String token);
}
