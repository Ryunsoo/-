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
import com.kh.hehyeop.help.model.dto.EstimateList;
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

	void cancelRequest(String reqIdx);

	void completeRequest(String reqIdx);

	//리뷰 등록 프로시저 호출로 변경
	void insertHelpReview(@Param("reqIdx") String reqIdx, @Param("score") double score, @Param("commentArr") String[] commentArr);
	
	Map<String, Object> selectCMemberIdByReqIdx(@Param("reqIdx") String reqIdx);
	
	@Select("select * from help_request where req_idx = #{reqIdx}")
	HelpRequest selectHelpRequest(String reqIdx);
	
	@Select("select * from file_info where type_idx = #{reqIdx}")
	List<FileDTO> selectFiles(String reqIdx);

	@Select("select address1, address2, address3 from my_area where id = #{id}")
	MyAddress selectMyAreaList(String id);

	@Select("select res_idx, res_time, res_pay, res_content, ongoing, a.reg_date, address, company, b.id, tell, grade from help_response a join member_c b on(a.id = b.id) where req_idx = #{reqIdx}")
	List<EstimateList> selectResponseWithAddress(String reqIdx);

	@Select("select re_content from help_review where help_idx = #{helpIdx}")
	List<String> selectCommentsList(String helpIdx);


	@Select("select * from file_info where type_idx = #{resIdx}")
	List<FileDTO> selectEstimateFile(String resIdx);

	@Select("select cash - cash_lock from wallet where id = #{id}")
	int selectMyCash(String id);

	@Update("update wallet set cash_lock = cash_lock + #{resPay} where id = #{id}")
	void updateCash(@Param("id")String id, @Param("resPay")int resPay);

	void insertHelpMatch(@Param("reqIdx") String reqIdx,@Param("resIdx") String resIdx , @Param("payStatus") int payStatus);

	@Select("select req_name from help_request where req_idx = #{reqIdx}")
	String selectReqNameByReqIdx(String reqIdx);

	@Update("update help_match set pay_status = 1 where req_idx = #{reqIdx}")
	void updateHelpMatchPayStatus(@Param("reqIdx") String reqIdx);

	@Select("select id from help_response where req_idx = #{reqIdx} and ongoing = 2")
	String selectIdByReqIdx(@Param("reqIdx")String reqIdx);
	
	void updatePointByScore(@Param("id") String id,@Param("score")double score);
	
	@Update("update member_c set point = point + 3 where id = #{cId}")
	void updateMemberCPoint(@Param("cId") String cId);


}
