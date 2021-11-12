package com.kh.hehyeop.member.model.service;

import org.springframework.http.MediaType;
import org.springframework.http.RequestEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.kh.hehyeop.common.code.Config;
import com.kh.hehyeop.common.mail.MailSender;
import com.kh.hehyeop.member.model.dto.CMember;
import com.kh.hehyeop.member.model.dto.Member;
import com.kh.hehyeop.member.model.repository.MemberRepository;
import com.kh.hehyeop.member.validator.CoJoinForm;
import com.kh.hehyeop.member.validator.JoinForm;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{
	
	private final MemberRepository memberRepository;
	private final MailSender mailSender;
	private final RestTemplate http;
	private final PasswordEncoder passwordEncoder;

	@Override
	public void insertMember(JoinForm form) {
		form.setPassword(passwordEncoder.encode(form.getPassword()));
		memberRepository.insertMember(form);
	}

	@Override
	public Member authenticateUser(Member member) {
		return memberRepository.authenticateUser(member);
	}

	@Override
	public Member selectMemberByUserId(String id) {
		// TODO Auto-generated method stub
		return memberRepository.selectMemberByUserId(id);
	}

	@Override
	public void selectIdByEmail(Member member, String token) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void selectPasswordByEmail(Member member, String token) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public CMember authenticateCUser(CMember cmember) {
		return memberRepository.authenticateCUser(cmember);
	}

	@Override
	public void authenticateByEmail(JoinForm form, String token) {
		
		MultiValueMap<String, String> body = new LinkedMultiValueMap<String, String>();
		body.add("mailTemplate", "join-auth-mail");
		body.add("id", form.getId());
		body.add("persistToken", token);
		
		RequestEntity<MultiValueMap<String, String>> request = 
				RequestEntity.post(Config.DOMAIN.DESC + "/mail")
				.accept(MediaType.APPLICATION_FORM_URLENCODED)
				.body(body);
		
		String htmlTxt = http.exchange(request, String.class).getBody();
		
		mailSender.send(form.getEmail(), "회원가입을 축하합니다.", htmlTxt);
		
	}

	@Override
	public Member selectMemberByNickname(String nickname) {
		return memberRepository.selectMemberByNickname(nickname);
	}

	@Override
	public void co_authenticateByEmail(CoJoinForm form, String token) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertCMember(CoJoinForm coForm) {
		// TODO Auto-generated method stub
		
	}

}
