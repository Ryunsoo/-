package com.kh.hehyeop.help.model.repositroy;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kh.hehyeop.common.util.file.FileDTO;
import com.kh.hehyeop.common.util.paging.Paging;
import com.kh.hehyeop.company.model.dto.ProField;
import com.kh.hehyeop.help.model.dto.HelpList;
import com.kh.hehyeop.help.model.dto.HelpMatch;
import com.kh.hehyeop.help.model.dto.HelpRequest;
import com.kh.hehyeop.help.model.dto.HelpResponse;
import com.kh.hehyeop.help.model.dto.Review;
import com.kh.hehyeop.mypage.model.dto.MyAddress;

@Mapper
public interface HelpRepository {

	@Insert("insert into help_request(req_idx, id, req_name, req_tell, req_address, old_address, req_time, req_pay, req_content, field) "
			+ "values(sc_c_idx.nextval, #{id}, #{reqName}, #{reqTell}, #{reqAddress}, #{oldAddress}, #{reqTime}, #{reqPay}, #{reqContent}, #{field})")
	int insertRequest(HelpRequest helpRequest);

	@Select("select req_idx from help_request where id = #{id} and req_name = #{reqName} and req_time=#{reqTime}")
	String selectReqIdx(HelpRequest helpRequest);

	@Insert("insert into file_info(file_idx, file_category, origin_name, re_name, save_path, type_idx) "
			+ "values(sc_c_idx.nextval, 'HELP_REQUEST', #{originName}, #{reName}, #{savePath}, #{typeIdx})")
	int uploadFile(FileDTO fileDTO);

	@Select("select * from pro_field")
	List<ProField> selectProFieldList();

	@Select("select DISTINCT field_category from pro_field")
	List<ProField> selectCategoryList();

	@Select("select * from v_help_list where id = #{id}")
	List<HelpList> selectHelpListById(String id);
	
	List<Map<String, Object>> selectEstimateCntById(@Param("id") String id);

	@Select("select company from v_company_from_response where res_idx = #{resIdx}")
	String selectCompanyByResIdx(HelpMatch match);
	
	List<Review> selectReviewList(@Param("paging")Paging paging, @Param("field") String field
								,@Param("addressList") List<String> addressList);

	@Delete("delete from help_request where req_idx = #{reqIdx}")
	int deleteRequest(String reqIdx);

	@Update("update help_request set reg_date = current_date where req_idx = #{reqIdx}")
	int updateRegDate(String reqIdx);

	int countReview(@Param("field") String field, @Param("addressList") List<String> addressList);

	@Update("update help_request set ongoing = 3 where req_idx = #{reqIdx}")
	int cancelRegDate(String reqIdx);

	@Update("update help_request set ongoing = 2 where req_idx = #{reqIdx}")
	int completeRegDate(String reqIdx);

	@Select("select help_idx from help_match where req_idx = #{reqIdx}")
	String selectHelpIdx(String reqIdx);

	@Update("update help_match set score = #{score}, review_date = current_date where help_idx = #{helpIdx}")
	int insertReviewToHelpMatch(@Param("helpIdx") String helpIdx, @Param("score") Double score);
	
	@Update("update help_match set ongoing = 2 where help_idx = #{helpIdx}")
	int updateOngoingHelpMatch(@Param("helpIdx") String helpIdx);
	
	@Insert("insert into help_review(review_idx, help_idx, re_content) values(sc_review_idx.nextval, #{helpIdx}, #{comment})")
	void insertReviewToHelpReview(@Param("helpIdx") String helpIdx, @Param("comment") String comment);

	@Select("select * from help_request where req_idx = #{reqIdx}")
	HelpRequest selectHelpRequest(String reqIdx);
	
	@Select("select * from file_info where type_idx = #{reqIdx}")
	List<FileDTO> selectFiles(String reqIdx);

	@Select("select address1, address2, address3 from my_area where id = #{id}")
	MyAddress selectMyAreaList(String id);

	@Select("select * from help_response where req_idx = #{reqIdx}")
	List<HelpResponse> selectHehyeopResponse(String reqIdx);

	@Select("select address from member_c where id = #{id}")
	String selectCompanyAddress(@Param("id") String id);




	
}
