package com.kh.hehyeop.community.model.repository;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.kh.hehyeop.common.util.paging.Paging;
import com.kh.hehyeop.community.model.dto.Community;

@Mapper
public interface CommunityRepository {

	@Insert("insert into board(board_idx, board_category, id, title, content, is_private, nickname) values(sc_board_idx.nextval, #{boardCategory}, #{id}, #{title}, #{content}, #{isPrivate}, #{nickname})")
	void insertBoard(Community community);

	@Select("select nickname from member where id = #{id}")
	String selectNickname(String id);

	List<Community> selectBoardList(@Param("paging") Paging paging);

	@Select("select count(*) from board")
	int countBoard();

}
