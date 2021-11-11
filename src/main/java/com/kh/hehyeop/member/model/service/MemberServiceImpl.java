package com.kh.hehyeop.member.model.service;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.kh.hehyeop.common.mail.MailSender;
import com.kh.hehyeop.member.model.dto.Member;
import com.kh.hehyeop.member.model.repository.MemberRepository;
import com.kh.hehyeop.member.validator.JoinForm;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{
	
	private final MemberRepository memberRepository;
	private final MailSender mailSender;
	private final RestTemplate restTemplate;
	private final PasswordEncoder passwordEncoder;

	@Override
	public void insertMember(JoinForm form) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Member authenticateUser(Member member) {
		return memberRepository.authenticateUser(member);
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
