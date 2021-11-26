package com.kh.hehyeop.management.model.service;

import org.springframework.stereotype.Service;

import com.kh.hehyeop.management.model.repository.ManagementRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ManagementServiceImpl implements ManagementService{

	private final ManagementRepository managementRepository;
}
