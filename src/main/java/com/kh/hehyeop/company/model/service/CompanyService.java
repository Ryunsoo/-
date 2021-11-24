package com.kh.hehyeop.company.model.service;

import com.kh.hehyeop.common.util.paging.Paging;
import com.kh.hehyeop.company.model.dto.CompanyField;
import com.kh.hehyeop.company.model.dto.MyRequest;
import com.kh.hehyeop.company.model.dto.RequestDetail;

import java.util.List;

import com.kh.hehyeop.help.model.dto.HelpRequest;
public interface CompanyService {

	List<HelpRequest> selectRequestList(Paging paging, List<String> addressList, List<CompanyField> companyFieldList, String area);

	RequestDetail selectRequestDetailByReqIdx(String reqIdx);

	List<MyRequest> selectRequestListById(String id, String state);

	int countRequest(List<String> addressList, List<CompanyField> companyFieldList, String area);

	List<CompanyField> selectCompanyFieldListById(String id);
}
