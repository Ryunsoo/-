package com.kh.hehyeop.company.model.service;

import java.util.List;

import com.kh.hehyeop.help.model.dto.HelpRequest;
import com.kh.hehyeop.company.model.dto.RequestDetail;

public interface CompanyService {

	List<HelpRequest> selectRequestList(String id);

	RequestDetail selectRequestDetailByReqIdx(String reqIdx);

}
