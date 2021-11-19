package com.kh.hehyeop.help.model.repositroy;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.kh.hehyeop.common.util.file.FileDTO;
import com.kh.hehyeop.company.model.dto.ProField;
import com.kh.hehyeop.help.model.dto.HelpMatch;
import com.kh.hehyeop.help.model.dto.HelpRequest;
import com.kh.hehyeop.help.model.dto.Review;

@Mapper
public interface HelpRepository {

	@Insert("insert into help_request(req_idx, id, req_name, req_tell, req_address, old_address, req_time, req_pay, req_content, field) "
			+ "values(sc_request_idx.nextval, #{id}, #{reqName}, #{reqTell}, #{reqAddress}, #{oldAddress}, #{reqTime}, #{reqPay}, #{reqContent}, #{field})")
	int insertRequest(HelpRequest helpRequest);

	@Select("select req_idx from help_request where id = #{id} and req_name = #{reqName} and req_time=#{reqTime}")
	String selectReqIdx(HelpRequest helpRequest);

	@Insert("insert into file_info(file_idx, file_category, origin_name, re_name, save_path, type_idx) "
			+ "values(sc_file_idx.nextval, 'MEMBER', #{originName}, #{reName}, #{savePath}, #{typeIdx})")
	int uploadFile(FileDTO fileDTO);

	@Select("select * from pro_field")
	List<ProField> selectFieldList();

	@Select("select DISTINCT field_category from pro_field")
	List<ProField> selectCategoryList();

	@Select("select * from help_request where id = #{id} order by reg_date desc")
	List<HelpRequest> selectHelpRequestById(String id);

	@Select("select count(*) from help_response where req_idx = #{reqIdx}")
	int selectHelpResponseCntByReqIdx(HelpRequest req);

	@Select("select * from help_match where req_idx = ${reqIdx}")
	HelpMatch selectHelpMatchByReqIdx(HelpRequest req);

	@Select("select company from v_company_from_response where res_idx = #{resIdx}")
	String selectCompanyByResIdx(HelpMatch match);
	
	@Select("select * from v_review")
	List<Review> selectReviewList();

	@Delete("delete from help_request where req_idx = #{reqIdx}")
	int deleteRequest(String reqIdx);

	@Update("update help_request set reg_date = current_date where req_idx = #{reqIdx}")
	int updateRegDate(String reqIdx);


	
}
