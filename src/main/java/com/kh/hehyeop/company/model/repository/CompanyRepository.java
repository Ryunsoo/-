package com.kh.hehyeop.company.model.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.kh.hehyeop.company.model.dto.CompanyField;
import com.kh.hehyeop.help.model.dto.HelpRequest;
import com.kh.hehyeop.mypage.model.dto.MyAddress;

import com.kh.hehyeop.company.model.dto.RequestDetail;

@Mapper
public interface CompanyRepository {

	@Select("select address1, address2, address3 from my_area where id = #{id}")
	MyAddress selectMyAreaList(String id);

	@Select("select field from company_field where id = #{id}")
	List<CompanyField> selectCompanyFieldListById(String id);
	
	List<HelpRequest> selectRequestList(@Param("addressList")List<String> addressList
										, @Param("companyFieldList") List<CompanyField> companyFieldList);


	@Select("select * from v_request_detail where req_idx = #{reqIdx}")
	RequestDetail selectRequestDetailByReqIdx(@Param("reqIdx") String reqIdx);

}
