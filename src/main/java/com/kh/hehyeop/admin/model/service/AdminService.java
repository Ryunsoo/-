package com.kh.hehyeop.admin.model.service;

import java.util.List;

import com.kh.hehyeop.admin.model.dto.CMember;
import com.kh.hehyeop.common.util.paging.Paging;

public interface AdminService {

	List<CMember> selectJoinRequest();

	List<CMember> selectModifyRequest(Paging paging);

	int selectModifyCount();

}
