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
import com.kh.hehyeop.community.model.dto.Rereply;

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
	
	@Update("Update board set board_category=#{boardCategory}, title=#{title}, content=#{content}, is_private=#{isPrivate} where board_idx = #{boardIdx}")
	void modifyBoard(Community community);

	@Insert("insert into re_reply(re_reply_idx, reply_idx, id, content, nickname) values(sc_re_reply_idx.nextval, #{replyIdx}, #{id}, #{content}, #{nickname})")
	void insertReReply(Rereply reReply);

	@Select("select * from re_reply where is_del = 0 order by re_reply_idx desc")
	List<Rereply> selectReReplyList();

	@Update("update re_reply set is_del = 1 where re_reply_idx = #{reReplyIdx}")
	void deleteReReply(String reReplyIdx);
	
	@Select("select count(*) from (select rownum rnumm, B.* from board B) where rnumm in (select rnum from (select rownum rnum, replace(title, ' ', '') title from board) where TITLE LIKE '%' || #{searchKeyword} || '%') and board_category LIKE '%' || #{boardCategory} || '%'")
	Integer countBoardSearchList(@Param("boardCategory") String boardCategory, @Param("searchKeyword")String searchKeyword);

	@Update("update board set is_del = 1 where board_idx = #{boardIdx}")
	void deleteBoard(String boardIdx);
	
	@Select("select * from (select rownum rnum, v.* from ("
			+ " select * from (select rownum rnumm, B.* from board B) where rnumm in "
			+ " (select rnum from (select rownum rnum, replace(title, ' ', '') title from board) where TITLE LIKE '%' || #{searchKeyword} || '%') and board_category LIKE '%' || #{boardCategory} || '%' order by board_idx desc"
			+ " ) v) where rnum between #{paging.start} and #{paging.end}")
	List<Community> selectSearchList(@Param("boardCategory") String boardCategory, @Param("searchKeyword")  String searchKeyword, @Param("paging") Paging paging);

}
