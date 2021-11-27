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

	Map<String, Object> selectMemberById(String id, String category);

	List<String> selectFieldListById(String id);

	void updateModify(String id);
	
	List<CMember> selectJoinFinishList(Paging paging);
	
	int selectJoinFinishListCount();

	List<CMember> selectModifyFinishList(Paging paging);

	int selectModifyFinishListCount();

	void updateJoin(String id);

	void rejectModify(String id);

	void rejectJoin(String id);

}
