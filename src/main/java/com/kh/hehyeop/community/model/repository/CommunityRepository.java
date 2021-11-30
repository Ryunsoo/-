package com.kh.hehyeop.community.model.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kh.hehyeop.common.util.paging.Paging;
import com.kh.hehyeop.community.model.dto.Community;
import com.kh.hehyeop.community.model.dto.Reply;

@Mapper
public interface CommunityRepository {

	@Insert("insert into board(board_idx, board_category, id, title, content, is_private, nickname) values(sc_board_idx.nextval, #{boardCategory}, #{id}, #{title}, #{content}, #{isPrivate}, #{nickname})")
	void insertBoard(Community community);

	@Select("select nickname from member where id = #{id}")
	String selectNickname(String id);

	List<Community> selectBoardList(@Param("paging") Paging paging);

	@Select("select count(*) from board")
	int countBoard();

	@Select("select * from board where board_idx = #{boardIdx}")
	Community selectBoardByIdx(String boardIdx);

	@Update("update board set view_cnt = view_cnt + 1 where board_idx = #{boardIdx}")
	void updateViewCnt(String boardIdx);

	@Insert("insert into reply(reply_idx, board_idx, id, content, nickname) values(sc_reply_idx.nextval, #{boardIdx}, #{id}, #{content}, #{nickname})")
	void insertReply(Reply reply);

	@Select("select * from reply where board_idx = #{boardIdx} and is_del = 0 order by reply_idx desc")
	List<Reply> selectReplyList(String boardIdx);

	@Update("update reply set content = #{content}, reg_date = current_date where reply_idx = #{replyIdx}")
	void modifyReply(Reply reply);

	@Update("update reply set is_del = 1 where reply_idx = #{replyIdx}")
	void deleteReply(String replyIdx);

}
