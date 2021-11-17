package com.kh.hehyeop.common.chat.model.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kh.hehyeop.common.chat.model.dto.ChatLog;


@Mapper
public interface ChatRepository {
	
	@Select("select room_no, chat_data, room_name, log_update from chat_room inner join chat_log using(room_no) where id = #{id} and log_update > exit_date order by log_update desc")
	List<ChatLog> selectUnReadChatListById(String id);
	
	@Select("select room_no, chat_data, room_name, log_update from chat_room inner join chat_log using(room_no) where id = #{id} and log_update <= exit_date order by log_update desc")
	List<ChatLog> selectReadChatListById(String id);

	@Update("update chat_log set chat_data = #{chatData}, log_update = current_date where room_no = #{roomNo} and DBMS_LOB.COMPARE(chat_data, #{chatData}) <> 0")
	void updateChatLog(@Param("roomNo") String roomNo, @Param("chatData") String chatData);

	@Update("update chat_room set exit_date = current_date where id = #{id} and room_no = #{roomNo}")
	void updateExitDate(@Param("id")String id, @Param("roomNo")String roomNo);

	@Select("select room_name, chat_data from chat_log where room_no = #{roomNo}")
	ChatLog selectChatLog(String roomNo);
	

}
