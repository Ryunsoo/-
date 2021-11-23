package com.kh.hehyeop.company.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.hehyeop.common.code.Field;
import com.kh.hehyeop.common.util.address.AddressUtil;
import com.kh.hehyeop.company.model.dto.CompanyField;
import com.kh.hehyeop.company.model.repository.CompanyRepository;
import com.kh.hehyeop.help.model.dto.HelpRequest;
import com.kh.hehyeop.mypage.model.dto.MyAddress;
import com.kh.hehyeop.company.model.dto.RequestDetail;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class CompanyServiceImpl implements CompanyService{
	
	private final CompanyRepository companyRepository;

	@Override
	public List<HelpRequest> selectRequestList(String id) {
		
		List<String> addressList = new ArrayList<String>();
		
		MyAddress myAddress = companyRepository.selectMyAreaList(id);
		List<CompanyField> companyFieldList = companyRepository.selectCompanyFieldListById(id);
		
		System.out.println("dsfsdfsdfsf : " + companyFieldList);
		
		addressList.add(myAddress.getAddress1());
		if(myAddress.getAddress2() != null) addressList.add(myAddress.getAddress2());
		if(myAddress.getAddress3() != null) addressList.add(myAddress.getAddress3());
		
		List<HelpRequest> requestList = companyRepository.selectRequestList(addressList,companyFieldList);
		
		AddressUtil util = new AddressUtil();
		for (HelpRequest helpRequest : requestList) {
			helpRequest.setField(Field.getField(helpRequest.getField()).fullName);
			helpRequest.setOldAddress(util.getDoSiAddress(helpRequest.getOldAddress()));
		}

		return requestList;
	}
	
	@Override
	public RequestDetail selectRequestDetailByReqIdx(String reqIdx) {
		return companyRepository.selectRequestDetailByReqIdx(reqIdx);
	}

}
