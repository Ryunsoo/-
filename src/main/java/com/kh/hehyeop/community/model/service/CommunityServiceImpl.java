package com.kh.hehyeop.community.model.service;

import org.springframework.stereotype.Service;

import com.kh.hehyeop.community.model.dto.Community;
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
}
