package com.kh.hehyeop.member.model.service;

import org.springframework.stereotype.Service;

import com.kh.hehyeop.main.model.repository.MainRepository;
import com.kh.hehyeop.member.model.dto.Member;
import com.kh.hehyeop.member.validator.JoinForm;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{

	@Override
	public void insertMember(JoinForm form) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Member authenticateUser(Member member) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Member selectMemberByUserId(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void selectIdByEmail(Member member, String token) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void selectPasswordByEmail(Member member, String token) {
		// TODO Auto-generated method stub
		
	}

}
