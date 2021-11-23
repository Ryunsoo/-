package com.kh.hehyeop.help.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.hehyeop.help.model.dto.EstimateList;
import com.kh.hehyeop.help.model.dto.HelpRequest;
import com.kh.hehyeop.help.model.dto.HelpResponse;
import com.kh.hehyeop.help.model.dto.MyHehyeop;
import com.kh.hehyeop.help.model.dto.Review;
import com.kh.hehyeop.mypage.model.dto.MyAddress;
import com.kh.hehyeop.common.util.file.FileDTO;
import com.kh.hehyeop.common.util.paging.Paging;
import com.kh.hehyeop.company.model.dto.ProField;


public interface HelpService {


	int insertRequest(HelpRequest helpRequest);

	String selectReqIdx(HelpRequest helpRequest);

	int uploadFile(List<MultipartFile> files, String reqIdx);

	List<ProField> selectCategoryList();

	List<ProField> selectProFieldList();

	List<MyHehyeop> getHelpRequestList(String id);
	
	List<Review> selectReviewList(Paging paging, String field,List<String> addressList);

	int deleteRequest(String reqIdx);

	int refreshRequest(String reqIdx);

	void cancelRequest(String reqIdx);

	void completeRequest(String reqIdx);

	void registReview(String helpIdx, double score, String[] commentArr);

	Map<String, Object> selectHehyeopDetail(String reqIdx);

	int countReview(String field,List<String> addressList);

	MyAddress selectMyAreaList(String id);

	List<EstimateList> selectHehyeopResponse(String reqIdx);

	List<String> selectCommentsList(String helpIdx);

	List<FileDTO> selectEstimateFile(String resIdx);
	
	String choiceCompany(Map<String, Object> commandMap);

	String selectReqNameByReqIdx(String reqIdx);

}
