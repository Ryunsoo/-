package com.kh.hehyeop.company.model.service;


import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Service;

import com.kh.hehyeop.company.model.dto.RequestDetail;
import com.kh.hehyeop.company.model.repository.CompanyRepository;
import com.kh.hehyeop.common.code.Field;
import com.kh.hehyeop.common.util.address.AddressUtil;
import com.kh.hehyeop.common.util.paging.Paging;
import com.kh.hehyeop.company.model.dto.CompanyField;
import com.kh.hehyeop.company.model.dto.MyRequest;
import com.kh.hehyeop.help.model.dto.HelpRequest;
import com.kh.hehyeop.mypage.model.dto.MyAddress;
import com.kh.hehyeop.help.model.dto.HelpResponse;
import com.kh.hehyeop.help.model.repositroy.HelpRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CompanyServiceImpl implements CompanyService{
	
	private final CompanyRepository companyRepository;

	@Override
	public List<HelpRequest> selectRequestList(Paging paging, List<String> addressList, List<CompanyField> companyFieldList, String area) {
			
		List<HelpRequest> requestList = companyRepository.selectRequestList(paging,addressList,companyFieldList,area);
		
		AddressUtil util = new AddressUtil();
		for (HelpRequest helpRequest : requestList) {
			helpRequest.setField(Field.getField(helpRequest.getField()).fullName);
			helpRequest.setOldAddress(util.getDoSiAddress(helpRequest.getOldAddress()));
			helpRequest.setReqTime(helpRequest.getReqTime().substring(0, helpRequest.getReqTime().indexOf("T")));
		}

		return requestList;
	}
	
	@Override
	public RequestDetail selectRequestDetailByReqIdx(String reqIdx) {
		return companyRepository.selectRequestDetailByReqIdx(reqIdx);
	}
	
	public List<MyRequest> selectRequestListById(String id, String state) {
		//ongoing 상황에 맞는 신청해협 리스트
		List<MyRequest> requestList = companyRepository.selectRequestListById(id,state);
		for (MyRequest helpRequest: requestList) {
			helpRequest.setField(Field.getField(helpRequest.getField()).fullName);
			helpRequest.setOldAddress(convertAddress(helpRequest.getOldAddress()));
			helpRequest.setReqTime(convertTime(helpRequest.getReqTime()));
			helpRequest.setStatus(setStatus(state,helpRequest));
		}
		return requestList;
	}
	
	//ex) 서울시 강남구 역삼동 까지만 반환
	private String convertAddress(String oldAddress) {
		String[] tempArr = oldAddress.split(" ");
		String address = tempArr[0] + " " + tempArr[1] + " " + tempArr[2];
		return address;
	}
	@Override
	public int countRequest(List<String> addressList, List<CompanyField> companyFieldList, String area) {
		return companyRepository.countRequest(addressList, companyFieldList, area);
	}

	@Override
	public List<CompanyField> selectCompanyFieldListById(String id) {
		return companyRepository.selectCompanyFieldListById(id);
	}

	//reqTime에 T없애주기
	private String convertTime(String reqTime) {
		String[] tempArr = reqTime.split("T");
		String time = tempArr[0] + " " + tempArr[1];
		return time;
	}
	//status 설정해주기
	private int setStatus(String state, MyRequest helpRequest) {
		//대기중에서 사용자가 업체를 선택한 경우
		//if(state.equals("1"))
		
		
		
		
		return 0;
	}

}
