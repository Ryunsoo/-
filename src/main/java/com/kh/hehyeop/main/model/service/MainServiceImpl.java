package com.kh.hehyeop.main.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.hehyeop.common.util.address.AddressUtil;
import com.kh.hehyeop.community.model.dto.Community;
import com.kh.hehyeop.help.model.dto.HelpRequest;
import com.kh.hehyeop.help.model.dto.Review;
import com.kh.hehyeop.main.model.dto.Purchase;
import com.kh.hehyeop.main.model.repository.MainRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MainServiceImpl implements MainService{

	private final MainRepository mainRepository;
	
	public String test() {
		return mainRepository.test(); 
	}

	@Override
	public List<Purchase> selectPurchaseList() {
		return mainRepository.selectPurchaseList();
	}

	@Override
	public List<Community> selectBoardList() {
		return mainRepository.selectBoardList();
	}

	@Override
	public List<HelpRequest> selectRequestList() {
		AddressUtil util = new AddressUtil();
		List<HelpRequest> requestList =  mainRepository.selectRequestList();
		
		for (HelpRequest helpRequest : requestList) {
			if(helpRequest.getReqContent().length() > 16) {
				helpRequest.setReqContent(helpRequest.getReqContent().substring(0, 16));
			}
			helpRequest.setOldAddress(util.getDoSiAddress(helpRequest.getOldAddress()));
		}
		
		return requestList;
	}

	@Override
	public List<Review> selectReviewList() {
		AddressUtil util = new AddressUtil();
		List<Review> reviewList = mainRepository.selectReviewList();
		
		for (Review review : reviewList) {
			review.setOldAddress(util.getDoSiAddress(review.getOldAddress()));
		}
		
		return reviewList;
	}
	
}
