package com.kh.hehyeop.member.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.kh.hehyeop.member.model.dto.Admin;
import com.kh.hehyeop.member.model.dto.CMember;
import com.kh.hehyeop.member.model.dto.Member;
import com.kh.hehyeop.member.validator.FieldForm;
import com.kh.hehyeop.member.validator.JoinForm;

public interface MemberService {

	void insertMember(JoinForm form);

	Member selectMemberByUserId(String id);

	String selectIdByEmail(String name, String tell, String email);

	Member changePasswordByEmail(String name, String id, String email);

	CMember C_changePasswordByEmail(String name, String id, String email);

	void authenticateByEmail(JoinForm form, String token);

	Member selectMemberByNickname(String nickname);

	void insertCMember(JoinForm form);

	Member authenticateUser(Member member);

	Member authenticateSocialUser(Member member);

	CMember authenticateCUser(CMember cmember);

	ArrayList<FieldForm> selectField();

	ArrayList<String> selectCategory();

	void insertFields(String id, List<String> fields);

	void findPasswordByEmail(String email, String token);

	void updatePassword(Member member, String newPw);

	void c_updatePassword(CMember cMember, String newPw);

	CMember selectCMember(String id);

	void uploadFile(List<MultipartFile> files, String cIdx);

	void deleterUser(Member member);

	void deleteCUser(CMember cmember);

	void linkMember(String id, String cid, String password);

	Member selectMember(String id);

	Admin authenticateAdmin(Admin admin);

}
