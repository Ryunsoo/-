package com.kh.hehyeop.member.model.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
import com.kh.hehyeop.member.validator.FieldForm;
import com.kh.hehyeop.member.validator.JoinForm;

import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService{
	
	private final MemberRepository memberRepository;
	private final MailSender mailSender;
	private final RestTemplate http;
	private final PasswordEncoder passwordEncoder;
	Logger logger = LoggerFactory.getLogger(this.getClass());



	public void insertMember(JoinForm form) {
		form.setPassword(passwordEncoder.encode(form.getPassword()));
		memberRepository.insertMember(form);
	}

	
	public Member authenticateUser(Member member) {
		
		Member storedMember = memberRepository.selectMemberByUserId(member.getId());
		
		if(storedMember != null && passwordEncoder.matches(member.getPassword(), storedMember.getPassword())) {
			return storedMember;
		}
		return null;
	}
	
	public CMember authenticateCUser(CMember cmember) {
		
		CMember storedCMember = memberRepository.selectCMemberByUserId(cmember.getId());
		if(storedCMember != null && passwordEncoder.matches(cmember.getPassword(), storedCMember.getPassword())){
			return storedCMember;
		}
		
		return null;
	}

	
	public Member selectMemberByUserId(String id) {
		// TODO Auto-generated method stub
		return memberRepository.selectMemberByUserId(id);
	}

	
	public void selectIdByEmail(Member member, String token) {
		// TODO Auto-generated method stub
		
	}

	
	public void selectPasswordByEmail(Member member, String token) {
		// TODO Auto-generated method stub
		
	}


	
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

	
	public Member selectMemberByNickname(String nickname) {
		return memberRepository.selectMemberByNickname(nickname);
	}

	
	public void co_authenticateByEmail(CoJoinForm form, String token) {
		// TODO Auto-generated method stub
		
	}

	
	public void insertCMember(CoJoinForm coForm) {
		// TODO Auto-generated method stub
		
	}

	public ArrayList<FieldForm> selectField() {
		return memberRepository.selectField();
	}

	public ArrayList<String> selectCategory() {
		return memberRepository.selectCategory();
	}


	public void insertFields(String id, List<String> fields) {
		memberRepository.insertFields(id, fields);
	}

}
