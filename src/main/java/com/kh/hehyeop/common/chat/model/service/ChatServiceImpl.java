package com.kh.hehyeop.common.chat.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.hehyeop.common.chat.model.dto.ChatLog;
import com.kh.hehyeop.common.chat.model.dto.ChatRoom;
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

	@Override
	public String selectChatLog(String roomNo) {
		return chatRepository.selectChatLog(roomNo);
	}

	@Override

	public List<ChatRoom> selectChatMemberListById(String id, String roomNo) {
		return chatRepository.selectChatMemberList(id, roomNo);
	}

	public int deleteIdByRoomNo(String roomNo, String id) {
		return chatRepository.deleteIdByRoomNo(roomNo, id);

	}

	@Override
	public int insertFriendByNickname(String id, String nickname) {
		int res = chatRepository.insertFriendByNickname(id, nickname);	
		return res;
	}
	
	public int updateRoomName(ChatRoom chatRoom) {
		return chatRepository.updateRoomName(chatRoom);
	}

	@Override
	public String selectFriendIdByNickname(String id, String nickname) {
		String friendId = chatRepository.selectFriendIdByNickname(id, nickname);
		return friendId;
	}

	@Override
	public String selectMemberByFriendId(String friendId) {
		return chatRepository.selectMemberByFriendId(friendId);
	}

	@Override
	public void createChatRoom(List<String> idList) {
		chatRepository.insertChatRoom(idList);
	}


}
