package com.kh.hehyeop.company.model.service;

import java.util.List;

import com.kh.hehyeop.help.model.dto.HelpRequest;
public interface CompanyService {

	List<HelpRequest> selectRequestList(String id);

}
