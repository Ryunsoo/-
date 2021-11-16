package com.kh.hehyeop.member.model.service;


import java.util.ArrayList;
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
import org.springframework.web.multipart.MultipartFile;

import com.kh.hehyeop.common.code.Config;
import com.kh.hehyeop.common.mail.MailSender;
import com.kh.hehyeop.common.util.file.FileUtil;
import com.kh.hehyeop.member.model.dto.CMember;
import com.kh.hehyeop.member.model.dto.Member;
import com.kh.hehyeop.member.model.repository.MemberRepository;
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

//	member login
	public Member authenticateUser(Member member) {
		
		Member storedMember = memberRepository.selectMember(member.getId());
		
		if(storedMember != null && passwordEncoder.matches(member.getPassword(), storedMember.getPassword())) {
			return storedMember;
		}
		return null;
	}
	
//	C member login
	public CMember authenticateCUser(CMember cmember) {
		
		CMember storedCMember = memberRepository.selectCMember(cmember.getId());
		
		if(storedCMember != null && passwordEncoder.matches(cmember.getPassword(), storedCMember.getPassword())){
			return storedCMember;
		}
		
		return null;
	}

//	member join id check
	public Member selectMemberByUserId(String id) {
		// TODO Auto-generated method stub
		return memberRepository.selectMemberByUserId(id);
	}

//	member join send email	
	public void authenticateByEmail(JoinForm form, String token) {
		
		MultiValueMap<String, String> body = new LinkedMultiValueMap<String, String>();
		body.add("mailTemplate", "join-auth-mail2");
		body.add("id", form.getId());
		body.add("persistToken", token);
		
		RequestEntity<MultiValueMap<String, String>> request = 
				RequestEntity.post(Config.DOMAIN.DESC + "/mail")
				.accept(MediaType.APPLICATION_FORM_URLENCODED)
				.body(body);
		
		String htmlTxt = http.exchange(request, String.class).getBody();
		
		mailSender.send(form.getEmail(), "자취해협 회원가입을 축하합니다.", htmlTxt);
		
	}

//	member join nickname check	
	public Member selectMemberByNickname(String nickname) {
		return memberRepository.selectMemberByNickname(nickname);
	}

	
	public void insertCMember(JoinForm form) {
		form.setPassword(passwordEncoder.encode(form.getPassword()));
		memberRepository.insertCMember(form);
		
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
	@Override
	public String selectIdByEmail(String name, String tell, String email) {
		return memberRepository.selectIdByEmail(name, tell, email);
	}
	
	@Override
	public Member changePasswordByEmail(String name, String id, String email) {
		return memberRepository.changePasswordByEmail(name, id, email);
	}

	@Override
	public void findPasswordByEmail(String email, String token) {
		MultiValueMap<String, String> body = new LinkedMultiValueMap<String, String>();
		body.add("mailTemplate", "change-password");
		body.add("persistToken", token);
		
		RequestEntity<MultiValueMap<String, String>> request = 
				RequestEntity.post(Config.DOMAIN.DESC + "/mail")
				.accept(MediaType.APPLICATION_FORM_URLENCODED)
				.body(body);
		
		String htmlTxt = http.exchange(request, String.class).getBody();
		
		mailSender.send(email, "자취해협 비빌번호 재설정", htmlTxt);
		
	}

	@Override
	public CMember C_changePasswordByEmail(String name, String id, String email) {
		return memberRepository.C_changePasswordByEmail(name, id, email);
	}

	@Override
	public void updatePassword(Member member, String newPw) {
		member.setPassword(passwordEncoder.encode(newPw));
		String id = member.getId();
		String email = member.getEmail();
		String password = member.getPassword();
		memberRepository.updatePassword(password, id, email);
		
	}
	

	@Override
	public void c_updatePassword(CMember cMember, String newPw) {
		cMember.setPassword(passwordEncoder.encode(newPw));
		String id = cMember.getId();
		String email = cMember.getEmail();
		String password = cMember.getPassword();
		memberRepository.c_updatePassword(password, id, email);
		
	}

	public CMember selectCMember(String id) {
		return memberRepository.selectCMember(id);
	}

	public void uploadFile(List<MultipartFile> files, String cIdx) {
		
		FileUtil util = new FileUtil();
		for (MultipartFile multipartFile : files) {
			if(!multipartFile.isEmpty()) {
				memberRepository.uploadFile(util.fileUpload(multipartFile, cIdx));
			}
		}
		
	}

}

