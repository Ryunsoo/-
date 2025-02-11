package com.kh.hehyeop.admin.model.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.kh.hehyeop.admin.model.dto.CMember;
import com.kh.hehyeop.admin.model.repository.AdminRepository;
import com.kh.hehyeop.common.util.file.FileDTO;
import com.kh.hehyeop.common.util.paging.Paging;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService {

	private final AdminRepository adminRepository;
	Logger logger = LoggerFactory.getLogger(this.getClass());

	public List<CMember> selectJoinRequest(Paging paging) {
		return adminRepository.selectJoinRequest(paging);
	}

	@Override
	public List<CMember> selectModifyRequest(Paging paging) {
		return adminRepository.selectModifyRequest(paging);
	}

	@Override
	public int selectModifyCount() {
		return adminRepository.selectModifyCount();
	}

	@Override
	public int selectJoinCount() {
		return adminRepository.selectJoinCount();
	}

	public Map<String, Object> selectMemberById(String id, String category) {

		CMember member = adminRepository.selectInfoById(id);
		List<FileDTO> files = adminRepository.selectFileInfoById(id);

		return Map.of("member", member, "files", files, "cate", category);
	}

	@Override
	public List<String> selectFieldListById(String id) {
		return adminRepository.selectFieldListById(id);
	}

	@Override
	public List<CMember> selectJoinFinishList(Paging paging) {
		return adminRepository.selectJoinFinishList(paging);
	}

	@Override
	public int selectJoinFinishListCount() {
		return adminRepository.selectJoinFinishListCount();
	}

	@Override
	public List<CMember> selectModifyFinishList(Paging paging) {
		return adminRepository.selectModifyFinishList(paging);
	}

	@Override
	public int selectModifyFinishListCount() {
		return adminRepository.selectModifyFinishListCount();
	}

	@Override
	public void cancelApproval(String id) {
		 adminRepository.cancelApproval(id);
	}

	public void rejectApproval(String id) {
		//is_permit이 0인 분야는 모두 삭제
		adminRepository.deleteNotPermitField(id);
		
		//MEMBER_C의 is_permit을 1로 변경
		adminRepository.updateIsPermitById(id);
	}

	@Override
	public void modifyCancelApproval(String id) {
		adminRepository.modifyCancelApproval(id);
		
	}

	@Override
	public void updatePermitedField(String id, List<String> fields) {
		adminRepository.updatePermitedField(id, fields);
	}

}
