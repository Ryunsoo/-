package com.kh.hehyeop.company.model.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kh.hehyeop.common.util.paging.Paging;
import com.kh.hehyeop.company.model.dto.CompanyField;
import com.kh.hehyeop.company.model.dto.MyRequest;
import com.kh.hehyeop.company.model.dto.RequestDetail;
import com.kh.hehyeop.help.model.dto.HelpRequest;
import com.kh.hehyeop.help.model.dto.HelpResponse;
import com.kh.hehyeop.mypage.model.dto.MyAddress;

@Mapper
public interface CompanyRepository {
	
	@Select("select address1, address2, address3 from my_area where id = #{id}")
	MyAddress selectMyAreaList(String id);

	@Select("select field from company_field where id = #{id}")
	List<CompanyField> selectCompanyFieldListById(String id);
	
	List<HelpRequest> selectRequestList(@Param("paging")Paging paging,@Param("addressList")List<String> addressList
										, @Param("companyFieldList") List<CompanyField> companyFieldList
										, @Param("area")String area);


	@Select("select * from help_response where c_id = #{id}")
	List<HelpResponse> selectResponseList(@Param("id") String id);

	List<MyRequest> selectRequestListById(@Param("paging")Paging paging, @Param("id") String id, @Param("state") String state);


	@Select("select * from v_request_detail where req_idx = #{reqIdx}")
	RequestDetail selectRequestDetailByReqIdx(@Param("reqIdx") String reqIdx);

	int countRequest(@Param("addressList")List<String> addressList
					, @Param("companyFieldList")List<CompanyField> companyFieldList, @Param("area") String area);

	@Update("update help_request set ongoing = 1 where req_idx in (select req_idx from help_response where id = #{id})")
	void updateRequestOngoing(String id);
	
	@Update("update help_response set ongoing = 1 where id = #{id}")
	void updateResponseOngoing(String id);

	int selectRequestListCntById(@Param("id") String id, @Param("state") String state);

	@Update("update help_response set ongoing = #{state} where id = #{id} and req_idx = #{reqIdx}")
	void updateOngoing(String id, String reqIdx, int state);
	
	@Select("select ongoing from help_request where req_idx = #{reqIdx}")
	int selectOngoingByReqIdx(String reqIdx);
	
	@Select("select res_pay from help_response where req_idx = #{reqIdx}")
	int selectResPayByReqIdx(String reqIdx);
	
	@Update("update wallet set cash= cash + #{resPay} where id = #{id}")
	void completeCashByReqIdx(@Param("id") String id, @Param("resPay") int resPay);
}
