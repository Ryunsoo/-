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
	public void updateModify(String id) {
		adminRepository.updateModify(id);
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

	public void updateJoin(String id) {
		adminRepository.updateJoin(id);
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
		//is_permit인 분야는 모두 삭제
		
		//MEMBER_C의 is_permit을 1로 변경
		
		adminRepository.rejectJoin(id);
	}

	@Override
	public void modifyCancelApproval(String id) {
		adminRepository.modifyCancelApproval(id);
		
	}

	@Override
	public void updatePermitedField(String id, List<String> fields) {
		//아이디로 is_permited가 0인 field 리스트를 가져온다
		
		
		//넘어온 field 리스트와 비교해서 일치하지 않는 분야는 DB에서 삭제하고
		
		//일치하는 분야는 is_permit 1로 바꿔준다.
		
		//MEMBER_C의 is_permit을 1로 바꿔준다.
	}

}
