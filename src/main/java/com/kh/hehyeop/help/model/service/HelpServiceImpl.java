package com.kh.hehyeop.help.model.service;

import org.springframework.stereotype.Service;

import com.kh.hehyeop.help.model.repository.HelpRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class HelpServiceImpl implements HelpService{

	private final HelpRepository helpRepository;
	
}
