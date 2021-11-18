package com.kh.hehyeop.common.chat.model.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kh.hehyeop.common.chat.model.dto.ChatLog;
import com.kh.hehyeop.common.chat.model.dto.ChatRoom;


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

	@Select("select chat_data from chat_log where room_no = #{roomNo}")
	String selectChatLog(String roomNo);

	@Select("select * from chat_room where room_no = #{roomNo} and id != #{id}")
	List<ChatRoom> selectChatMemberList(@Param("id")String id, @Param("roomNo")String roomNo);

	@Delete("delete from chat_room where id = #{id} and room_no = #{roomNo}")
	int deleteIdByRoomNo(@Param("roomNo")String roomNo, @Param("id")String id);

	@Update("update chat_room set room_name = #{roomName} where id = #{id} and room_no = #{roomNo}")
	int updateRoomName(ChatRoom chatRoom);

	@Insert("insert into friend (friend_idx,id,friend_id) select sc_friend_idx.nextval, #{id}, id from member where nickname = #{nickname}")
	int insertFriendByNickname(@Param("id")String id, @Param("nickname")String nickname);

	@Select("select friend_id from friend where id = #{id} and friend_id = (select id from member where nickname = #{nickname})")
	String selectFriendIdByNickname(@Param("id")String id, @Param("nickname")String nickname);

	@Select("select id from member where id = #{friendId}")
	String selectMemberByFriendId(@Param("friendId")String friendId);


	

}
