package com.kh.hehyeop.main.model.service;

import java.util.List;

import com.kh.hehyeop.community.model.dto.Community;
import com.kh.hehyeop.help.model.dto.HelpRequest;
import com.kh.hehyeop.help.model.dto.Review;
import com.kh.hehyeop.main.model.dto.Purchase;

public interface MainService {

	String test();

	List<Purchase> selectPurchaseList();

	List<Community> selectBoardList();

	List<HelpRequest> selectRequestList();

	List<Review> selectReviewList();

	String confirmWeather(String main, double temp);
}
