package com.kh.hehyeop.community.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.hehyeop.common.util.paging.Paging;
import com.kh.hehyeop.community.model.dto.Community;
import com.kh.hehyeop.community.model.dto.Reply;
import com.kh.hehyeop.community.model.repository.CommunityRepository;
import com.kh.hehyeop.management.model.repository.ManagementRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CommunityServiceImpl implements CommunityService {

	private final CommunityRepository communityRepository;

	@Override
	public void insertBoard(Community community) {
		communityRepository.insertBoard(community);
	}

	@Override
	public String selectNickname(String id) {
		return communityRepository.selectNickname(id);
	}

	@Override
	public List<Community> selectBoardList(Paging paging) {
		return communityRepository.selectBoardList(paging);
	}

	@Override
	public int countBoard() {
		return communityRepository.countBoard();
	}

	@Override
	public Community selectBoardByIdx(String boardIdx) {
		return communityRepository.selectBoardByIdx(boardIdx);
	}

	@Override
	public void updateViewCnt(String boardIdx) {
		communityRepository.updateViewCnt(boardIdx);
	}

	@Override
	public void insertReply(Reply reply) {
		communityRepository.insertReply(reply);
	}

	@Override
	public List<Reply> selectReplyList(String boardIdx) {
		return communityRepository.selectReplyList(boardIdx);
	}
}
