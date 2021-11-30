package com.kh.hehyeop.community.model.service;

import java.util.List;

import com.kh.hehyeop.common.util.paging.Paging;
import com.kh.hehyeop.community.model.dto.Community;
import com.kh.hehyeop.community.model.dto.Reply;

public interface CommunityService {

	void insertBoard(Community community);

	String selectNickname(String id);

	List<Community> selectBoardList(Paging paging);

	int countBoard();

	Community selectBoardByIdx(String boardIdx);

	void updateViewCnt(String boardIdx);

	void insertReply(Reply reply);

	List<Reply> selectReplyList(String boardIdx);

	void modifyReply(Reply reply);

	void deleteReply(String replyIdx);

	void modifyBoard(Community community);

}
