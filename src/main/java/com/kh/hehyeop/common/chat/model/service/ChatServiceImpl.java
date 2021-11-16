package com.kh.hehyeop.common.chat.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.hehyeop.common.chat.model.dto.ChatLog;
import com.kh.hehyeop.common.chat.model.repository.ChatRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ChatServiceImpl implements ChatService{
	
	private final ChatRepository chatRepository;

	@Override
	public List<ChatLog> selectUnReadChatListById(String id) {
		return chatRepository.selectUnReadChatListById(id);
	}
	
	@Override
	public List<ChatLog> selectReadChatListById(String id) {
		return chatRepository.selectReadChatListById(id);
	}

	@Override
	public void updateChatLog(String roomNo, String chatData) {
		chatRepository.updateChatLog(roomNo, chatData);
	}

	@Override
	public void updateExitDate(String id, String roomNo) {
		chatRepository.updateExitDate(id, roomNo);
	}


}
