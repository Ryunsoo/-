package com.kh.hehyeop.community.model.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.kh.hehyeop.community.model.dto.Community;

@Mapper
public interface CommunityRepository {

	@Insert("insert into board(board_idx, board_category, id, title, content, is_private) values(sc_board_idx.nextval, #{boardCategory}, #{id}, #{title}, #{content}, #{isPrivate})")
	void insertBoard(Community community);

}
