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
	public List<HelpRequest> selectRequestList(Paging paging, List<String> addressList, List<CompanyField> companyFieldList) {
			
		List<HelpRequest> requestList = companyRepository.selectRequestList(paging,addressList,companyFieldList);
		
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
	
	public List<HelpRequest> selectRequestListById(String id, String state) {
		List<HelpRequest> requestList = companyRepository.selectRequestListById(id,state);
		
		for (HelpRequest helpRequest: requestList) {
			helpRequest.setField(Field.getField(helpRequest.getField()).fullName);
			helpRequest.setOldAddress(convertAddress(helpRequest.getOldAddress()));
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
	public int countRequest(List<String> addressList, List<CompanyField> companyFieldList) {
		return companyRepository.countRequest(addressList, companyFieldList);
	}

	@Override
	public List<CompanyField> selectCompanyFieldListById(String id) {
		return companyRepository.selectCompanyFieldListById(id);
	}

}
