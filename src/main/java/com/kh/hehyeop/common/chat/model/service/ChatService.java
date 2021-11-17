package com.kh.hehyeop.common.chat.model.service;

import java.util.List;

import com.kh.hehyeop.common.chat.model.dto.ChatLog;

public interface ChatService {

	List<ChatLog> selectUnReadChatListById(String id);
	
	List<ChatLog> selectReadChatListById(String id);

	void updateChatLog(String roomNo, String chatData);

	void updateExitDate(String id, String no);

	ChatLog selectChatLog(String roomNo);

}
