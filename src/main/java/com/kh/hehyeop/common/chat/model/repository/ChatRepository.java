package com.kh.hehyeop.common.chat.model.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.hehyeop.common.chat.model.dto.ChatLog;


@Mapper
public interface ChatRepository {
	
	@Select("select room_no, chat_data, room_name, log_update from chat_room inner join chat_log using(room_no) where id = #{id} order by log_update desc")
	List<ChatLog> selectChatListById(String id);
	

}
