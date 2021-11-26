package com.kh.hehyeop.admin.model.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.kh.hehyeop.admin.model.dto.CMember;
import com.kh.hehyeop.admin.model.repository.AdminRepository;
import com.kh.hehyeop.common.util.paging.Paging;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService{
	
	
	private final AdminRepository adminRepository;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public List<CMember> selectJoinRequest() {
		return adminRepository.selectJoinRequest();
	}

	@Override
	public List<CMember> selectModifyRequest(Paging paging) {
		return adminRepository.selectModifyRequest(paging);
	}

	@Override
	public int selectModifyCount() {
		return adminRepository.selectModifyCount();
	}

}
