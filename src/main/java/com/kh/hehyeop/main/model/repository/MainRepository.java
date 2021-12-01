package com.kh.hehyeop.main.model.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.hehyeop.community.model.dto.Community;
import com.kh.hehyeop.help.model.dto.HelpRequest;
import com.kh.hehyeop.help.model.dto.Review;
import com.kh.hehyeop.main.model.dto.Purchase;

@Mapper
public interface MainRepository {
	
	@Select("select distinct major_key from location where city like '%성남%'")
	String test();

	@Select("select reg_idx, item_name, save_path, re_name from v_main_purchase where rnum between 1 and 6")
	List<Purchase> selectPurchaseList();

	List<Community> selectBoardList();

	List<HelpRequest> selectRequestList();

	List<Review> selectReviewList();
}
