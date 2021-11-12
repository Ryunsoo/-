package com.kh.hehyeop.common.push;

import org.springframework.stereotype.Component;

import com.kh.hehyeop.mypage.model.service.MypageService;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class PushSender {

	private final MypageService mypageService;
	
	public void send() {
		
	}
}
