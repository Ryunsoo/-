package com.kh.hehyeop.main.model.service;

import org.springframework.stereotype.Service;

import com.kh.hehyeop.main.model.repository.MainRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MainServiceImpl implements MainService{

	private final MainRepository mainRepository;
	
	public String test() {
		return mainRepository.test(); 
	}
	
}
