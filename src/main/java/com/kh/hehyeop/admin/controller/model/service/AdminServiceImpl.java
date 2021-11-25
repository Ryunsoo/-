package com.kh.hehyeop.admin.controller.model.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.kh.hehyeop.admin.controller.model.dto.CMember;
import com.kh.hehyeop.admin.controller.model.repository.AdminRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService{
	
	
	private final AdminRepository adminRepository;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public CMember selectJoinRequest() {
		return adminRepository.selectJoinRequest();
	}

}
