package com.kh.hehyeop.admin.model.service;

import java.util.List;

import com.kh.hehyeop.admin.model.dto.CMember;

public interface AdminService {

	List<CMember> selectJoinRequest();

	List<CMember> selectModifyRequest();

}
