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
	public void updatePermit(String id) {
		adminRepository.updatePermit(id);
	}
	
	@Override
	public List<CMember> selectFinishList(Paging paging) {
		return adminRepository.selectFinishList(paging);
	}

	@Override
	public int selectFinishListCount() {
		return adminRepository.selectFinishListCount();
	}


}
