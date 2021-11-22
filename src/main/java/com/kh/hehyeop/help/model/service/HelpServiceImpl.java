package com.kh.hehyeop.help.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.hehyeop.common.code.Field;
import com.kh.hehyeop.common.util.address.AddressUtil;
import com.kh.hehyeop.common.util.file.FileDTO;
import com.kh.hehyeop.common.util.file.FileUtil;
import com.kh.hehyeop.common.util.paging.Paging;
import com.kh.hehyeop.help.model.dto.HelpRequest;
import com.kh.hehyeop.help.model.dto.HelpResponse;
import com.kh.hehyeop.help.model.dto.Review;
import com.kh.hehyeop.help.model.repositroy.HelpRepository;
import com.kh.hehyeop.mypage.model.dto.MyAddress;
import com.kh.hehyeop.company.model.dto.ProField;
import com.kh.hehyeop.help.model.dto.HelpList;
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
		List<HelpList> helpList = helpRepository.selectHelpListById(id);
		List<Map<String, Object>> estimateCntList = helpRepository.selectEstimateCntById(id);
		Map<String, Integer> reqIdxEstimateCnt = new HashMap<String, Integer>();
		estimateCntList.forEach(e -> {
			reqIdxEstimateCnt.put((String) e.get("reqIdx"), (int) e.get("estimateCnt"));
		});
		
		return getMyHehyeopList(helpList, reqIdxEstimateCnt);
	}
	
	private List<MyHehyeop> getMyHehyeopList(List<HelpList> helpList, Map<String, Integer> cntMap) {
		AddressUtil util = new AddressUtil();
		List<MyHehyeop> resList = new ArrayList<MyHehyeop>();
		
		//조건에 따라 hehyeop dto를 생성해 list에 답아준다.
		for (HelpList list : helpList) {
			MyHehyeop my = new MyHehyeop();
			my.setReqIdx(list.getReqIdx());
			my.setField(Field.getField(list.getField()).fullName);
			my.setArea(util.getDoSiAddress(list.getOldAddress()));
			my.setRegDate(list.getRegDate());
			int cnt = cntMap.get(list.getReqIdx()) == null ? 0 : cntMap.get(list.getReqIdx());
			my.setEstimateCnt(cnt);
			my.setCompany(list.getCompany());
			my.setGrade(list.getGrade());
			my.setPayMeans(getPayMeans(list.getPayStatus()));
			my.setScore(list.getScore());
			my = setState(list, my);
			resList.add(my);
		}
		System.out.println(resList);
		return resList;
	}

	private String getPayMeans(Integer payStatus) {
		if(payStatus == null) {
			return null;
		}
		if(payStatus == 0 || payStatus == 1) {
			return "캐시";
		}else {
			return "현장";
		}
	}

	private MyHehyeop setState(HelpList list, MyHehyeop my) {
		int reqOngoing = list.getReqOngoing();
		
		//진행 여부가 0(대기중)이면 state 1로 지정
		if(reqOngoing == 0) {
			my.setState(1);
			my.setOngoing("대기중");
			return my;
		}
		
		int resOngoing = list.getResOngoing();
		
		//진행여부가 1(진행중)이면
		//완료/취소 버튼 -> state 2
		if(reqOngoing == 1) {
			my.setState(2);
			my.setOngoing("진행중");
			return my;
		}
		
		//진행여부가 2(완료)일때
		//응답 해협의 진행여부가
		//	 1(진행중) 일때는 완료대기중 -> state 3
		//	 2(완료) 일때는
		//		* 매치테이블의 score가 없으면 후기 작성 버튼 -> state 4
		//		* 매치테이블의 score가 있으면 score에 저장 -> state 5
		//	 3(취소) 일때는 재선택 버튼 -> state 2
		if(reqOngoing == 2) {
			my.setOngoing("완료");
			if(resOngoing == 1) {
				my.setState(3);
			}else if(resOngoing == 2) {
				if(list.getScore() == 0) {
					my.setState(4);
				}else {
					my.setState(5);
				}
			}else if(resOngoing == 3) {
				my.setState(2);
			}
			return my;
		}
		
		//진행여부가 3(취소)일때
		//응답 해협의 진행여부가
		//	 1(진행중) 일때는 취소대기중 -> state 6
		//	 2(완료) 일때는 재선택 버튼 -> state 2
		//	 3(취소) 일때는 취소 -> state 7
		if(reqOngoing == 3) {
			my.setOngoing("취소");
			if(resOngoing == 1) {
				my.setState(6);
			}else if(resOngoing == 2) {
				my.setState(2);
			}else if(resOngoing == 3) {
				my.setState(7);
			}
			return my;
		}
		return my;
	}
	
	public List<Review> selectReviewList(Paging paging, String field, List<String> addressList) {
		AddressUtil util = new AddressUtil();
		List<Review> reviewList = helpRepository.selectReviewList(paging, field, addressList);
		
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
	public int countReview(String field,List<String> addressList) {
		return helpRepository.countReview(field, addressList);
	}
	
	@Override	
	public void cancelRequest(String reqIdx) {
		helpRepository.cancelRequest(reqIdx);
	}

	@Override
	public void completeRequest(String reqIdx) {
		helpRepository.completeRequest(reqIdx);
	}

	@Override
	public void registReview(String reqIdx, double score, String[] commentArr) {
		helpRepository.insertHelpReview(reqIdx, score, commentArr);
	}

	@Override
	public Map<String, Object> selectHehyeopDetail(String reqIdx) {
		HelpRequest helpRequest = helpRepository.selectHelpRequest(reqIdx);
		List<FileDTO> files = helpRepository.selectFiles(reqIdx);
		return Map.of("helpRequest",helpRequest,"files",files);
	}

	@Override
	public MyAddress selectMyAreaList(String id) {
		return helpRepository.selectMyAreaList(id);
	}

	public List<HelpResponse> selectHehyeopResponse(String reqIdx) {
		return helpRepository.selectHehyeopResponse(reqIdx);
	}

	@Override
	public List<String> selectCompanyAddress(List<HelpResponse> responseList) {
		List<String> addressList = new ArrayList<String>();
		for(int i = 0; i < responseList.size(); i++) {
			addressList.add(helpRepository.selectCompanyAddress(responseList.get(i).getId()));
		}
		
		return addressList;
	}


}
