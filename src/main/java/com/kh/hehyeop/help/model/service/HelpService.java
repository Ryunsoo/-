package com.kh.hehyeop.help.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;
import com.kh.hehyeop.help.model.dto.HelpRequest;
import com.kh.hehyeop.help.model.dto.MyHehyeop;
import com.kh.hehyeop.help.model.dto.Review;
import com.kh.hehyeop.common.util.paging.Paging;
import com.kh.hehyeop.company.model.dto.ProField;


public interface HelpService {


	int insertRequest(HelpRequest helpRequest);

	String selectReqIdx(HelpRequest helpRequest);

	int uploadFile(List<MultipartFile> files, String reqIdx);

	List<ProField> selectCategoryList();

	List<ProField> selectProFieldList();

	List<MyHehyeop> getHelpRequestList(String id);
	
	List<Review> selectReviewList(Paging paging);

	int deleteRequest(String reqIdx);

	int refreshRequest(String reqIdx);

	int countReview();

	int cancelRequest(String reqIdx);

	int completeRequest(String reqIdx);

	String getHelpIdx(String reqIdx);

	int registReview(String helpIdx, String score, String[] commentArr);

	Map<String, Object> selectHehyeopDetail(String reqIdx);

}
