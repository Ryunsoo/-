package com.kh.hehyeop.community.model.service;

import java.util.List;

import com.kh.hehyeop.common.util.paging.Paging;
import com.kh.hehyeop.community.model.dto.Community;

public interface CommunityService {

	void insertBoard(Community community);

	String selectNickname(String id);

	List<Community> selectBoardList(Paging paging);

	int countBoard();

}
