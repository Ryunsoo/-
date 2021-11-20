package com.kh.hehyeop.help.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.hehyeop.common.code.Field;
import com.kh.hehyeop.common.util.address.AddressUtil;
import com.kh.hehyeop.common.util.file.FileDTO;
import com.kh.hehyeop.common.util.file.FileUtil;
import com.kh.hehyeop.common.util.paging.Paging;
import com.kh.hehyeop.help.model.dto.HelpRequest;
import com.kh.hehyeop.help.model.dto.Review;
import com.kh.hehyeop.help.model.repositroy.HelpRepository;
import com.kh.hehyeop.company.model.dto.ProField;
import com.kh.hehyeop.help.model.dto.HelpMatch;
import com.kh.hehyeop.help.model.dto.MyHehyeop;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class HelpServiceImpl implements HelpService{

	private final HelpRepository helpRepository;

	@Override
	public List<ProField> selectCategoryList() {
		
		return helpRepository.selectCategoryList();
	}

	@Override
	public List<ProField> selectProFieldList() {
		return helpRepository.selectProFieldList();
	}
	
	@Override
	public int insertRequest(HelpRequest helpRequest) {
		return helpRepository.insertRequest(helpRequest);
	}

	@Override
	public String selectReqIdx(HelpRequest helpRequest) {
		return helpRepository.selectReqIdx(helpRequest);
	}

	@Override
	public int uploadFile(List<MultipartFile> files, String reqIdx) {
		FileUtil util = new FileUtil();
		int res = 0;
		for (MultipartFile multipartFile : files) {
			if(!multipartFile.isEmpty()) {
				res = helpRepository.uploadFile(util.fileUpload(multipartFile, reqIdx));
			}
		}
		return res;
	}

	@Override
	public List<MyHehyeop> getHelpRequestList(String id) {
		//사용자의 모든 해협을 조회해온다.
		List<HelpRequest> helpList = helpRepository.selectHelpRequestById(id);
		return getMyHehyeopList(helpList);
	}
	
	private List<MyHehyeop> getMyHehyeopList(List<HelpRequest> helpList) {
		AddressUtil util = new AddressUtil();
		List<MyHehyeop> resList = new ArrayList<MyHehyeop>();
		
		//조건에 따라 hehyeop dto를 생성해 list에 답아준다.
		for (HelpRequest req : helpList) {
			MyHehyeop my = new MyHehyeop();
			my.setReqIdx(req.getReqIdx());
			my.setField(Field.getField(req.getField()).fullName);
			my.setArea(util.getDoSiAddress(req.getOldAddress()));
			my.setRegDate(req.getRegDate());
			my = setListDate(req, my);
			resList.add(my);
		}
		System.out.println(resList);
		return resList;
	}

	private MyHehyeop setListDate(HelpRequest req, MyHehyeop my) {
		//어떤 상태던지 response 테이블에 해당 해협에 대한 참가 개수를 확인해서 estimateCnt 넣어주기
		my.setEstimateCnt(helpRepository.selectHelpResponseCntByReqIdx(req));
		int reqOngoing = req.getOngoing();
		
		//진행 여부가 0(대기중)이면 state 1로 지정
		if(reqOngoing == 0) {
			my.setState(1);
			my.setOngoing("대기중");
			return my;
		}
		
		//진행 여부가 1/2/3이면
		//매치테이블에서 response idx로 c_member 의 company를 찾아와 company 넣어주기
		//매치테이블에서 결제 상태 가져와서 payMeans 넣어주기
		HelpMatch match = helpRepository.selectHelpMatchByReqIdx(req);
		int matchOnging = match.getOngoing();
		my.setCompany(helpRepository.selectCompanyByResIdx(match));
		if(match.getPayStatus() == 2) {
			my.setPayMeans("현장");
		}else {
			my.setPayMeans("캐시");
		}
		
		//진행여부가 1(진행중)이면
		//완료/취소 버튼 -> state 2
		if(reqOngoing == 1) {
			my.setState(2);
			my.setOngoing("진행중");
			return my;
		}
		
		//진행여부가 2(완료)일때
		//매치테이블의 진행여부가
		//	 1(진행중) 일때는 완료대기중 -> state 3
		//	 2(완료) 일때는
		//		* 매치테이블의 score가 없으면 후기 작성 버튼 -> state 4
		//		* 매치테이블의 score가 있으면 score에 저장 -> state 5
		//	 3(취소) 일때는 재선택 버튼 -> state 2
		if(reqOngoing == 2) {
			if(matchOnging == 1) {
				my.setState(3);
			}else if(matchOnging == 2) {
				if(match.getScore() == 0) {
					my.setState(4);
				}else {
					my.setScore(match.getScore());
					my.setState(5);
				}
			}else {
				my.setState(2);
			}
			my.setOngoing("완료");
			return my;
		}
		
		//진행여부가 3(취소)일때
		//매치테이블의 진행여부가
		//	 1(진행중) 일때는 취소대기중 -> state 6
		//	 2(완료) 일때는 재선택 버튼 -> state 2
		//	 3(취소) 일때는 취소 -> state 7
		if(reqOngoing == 3) {
			if(matchOnging == 1) {
				my.setState(6);
			}else if(matchOnging == 2) {
				my.setState(2);
			}else {
				my.setState(7);
			}
			my.setOngoing("취소");
		}
		return my;
	}
	
	public List<Review> selectReviewList(Paging paging, String field) {
		AddressUtil util = new AddressUtil();
		List<Review> reviewList = helpRepository.selectReviewList(paging, field);
		
		for (Review review : reviewList) {
			review.setField(Field.getField(review.getField()).fullName);
			review.setOldAddress(util.getDoSiAddress(review.getOldAddress()));
		}

		return reviewList;
	}

	@Override
	public int deleteRequest(String reqIdx) {
		return helpRepository.deleteRequest(reqIdx);
	}

	@Override
	public int refreshRequest(String reqIdx) {
		return helpRepository.updateRegDate(reqIdx);
	}

	@Override
	public int countReview(String field) {
		return helpRepository.countReview(field);
	}
	
	@Override	
	public int cancelRequest(String reqIdx) {
		return helpRepository.cancelRegDate(reqIdx);
	}

	@Override
	public int completeRequest(String reqIdx) {
		return helpRepository.completeRegDate(reqIdx);
	}

	@Override
	public String getHelpIdx(String reqIdx) {
		return helpRepository.selectHelpIdx(reqIdx);
	}

	@Override
	public int registReview(String helpIdx, String score, String[] commentArr) {
		double sc = Double.parseDouble(score);
		int res1 = helpRepository.insertReviewToHelpMatch(helpIdx,sc);
		int res2 = 0;
		for (String comment : commentArr) {
			helpRepository.insertReviewToHelpReview(helpIdx,comment);
			res2++;
		}
		return res1+res2;
	}

	@Override
	public Map<String, Object> selectHehyeopDetail(String reqIdx) {
		HelpRequest helpRequest = helpRepository.selectHelpRequest(reqIdx);
		List<FileDTO> files = helpRepository.selectFiles(reqIdx);
		return Map.of("helpRequest",helpRequest,"files",files);
	}

}
