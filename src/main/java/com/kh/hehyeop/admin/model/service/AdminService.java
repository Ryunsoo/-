package com.kh.hehyeop.admin.model.service;

import java.util.List;
import java.util.Map;

import com.kh.hehyeop.admin.model.dto.CMember;
import com.kh.hehyeop.common.util.paging.Paging;

public interface AdminService {

	List<CMember> selectJoinRequest(Paging paging);

	List<CMember> selectModifyRequest(Paging paging);

	int selectModifyCount();

	int selectJoinCount();

	Map<String, Object> selectMemberById(String id);

	List<String> selectFieldListById(String id);

	void updatePermit(String id);

}
