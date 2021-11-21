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
import com.kh.hehyeop.help.model.dto.Review;

@Mapper
public interface HelpRepository {

	@Insert("insert into help_request(req_idx, id, req_name, req_tell, req_address, old_address, req_time, req_pay, req_content, field) "
			+ "values(sc_c_idx.nextval, #{id}, #{reqName}, #{reqTell}, #{reqAddress}, #{oldAddress}, #{reqTime}, #{reqPay}, #{reqContent}, #{field})")
	int insertRequest(HelpRequest helpRequest);

	@Select("select req_idx from help_request where id = #{id} and req_name = #{reqName} and req_time=#{reqTime}")
	String selectReqIdx(HelpRequest helpRequest);

	@Insert("insert into file_info(file_idx, file_category, origin_name, re_name, save_path, type_idx) "
			+ "values(sc_c_idx.nextval, 'MEMBER', #{originName}, #{reName}, #{savePath}, #{typeIdx})")
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
	
	List<Review> selectReviewList(@Param("paging")Paging paging, @Param("field") String field);

	@Delete("delete from help_request where req_idx = #{reqIdx}")
	int deleteRequest(String reqIdx);

	@Update("update help_request set reg_date = current_date where req_idx = #{reqIdx}")
	int updateRegDate(String reqIdx);

	int countReview(@Param("field") String field);

	@Update("update help_request set ongoing = 3 where req_idx = #{reqIdx}")
	int cancelRegDate(String reqIdx);

	@Update("update help_request set ongoing = 2 where req_idx = #{reqIdx}")
	int completeRegDate(String reqIdx);

	@Select("select help_idx from help_match where req_idx = #{reqIdx}")
	String selectHelpIdx(String reqIdx);

	@Insert("insert into help_match(score) values(#{sc}) where help_idx = #{helpIdx}")
	int insertReviewToHelpMatch(String helpIdx, Double sc);

	@Insert("insert into help_review(help_idx, re_content) values(#{helpIdx}, #{comment}")
	void insertReviewToHelpReview(String helpIdx, String comment);

	@Select("select * from help_request where req_idx = #{reqIdx}")
	HelpRequest selectHelpRequest(String reqIdx);
	
	@Select("select * from file_info where type_idx = #{reqIdx}")
	List<FileDTO> selectFiles(String reqIdx);



	
}
