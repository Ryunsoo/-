package com.kh.hehyeop.management.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.hehyeop.management.model.dto.Icebox;
import com.kh.hehyeop.management.model.repository.ManagementRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ManagementServiceImpl implements ManagementService{

	private final ManagementRepository managementRepository;

	@Override
	public List<Icebox> selectIceboxUpList(String id, String category) {
		return managementRepository.selectIceboxUpList(id, category);
	}

	@Override
	public List<Icebox> selectIceboxDownList(String id, String category) {
		return managementRepository.selectIceboxDownList(id, category);
	}
}
