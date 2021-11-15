package com.kh.hehyeop.common.chat.model.service;

import java.util.List;

import com.kh.hehyeop.common.chat.model.dto.ChatLog;

public interface ChatService {

	List<ChatLog> selectChatListById(String id);

}
