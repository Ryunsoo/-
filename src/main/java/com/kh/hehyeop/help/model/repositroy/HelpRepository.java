package com.kh.hehyeop.help.model.repositroy;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.kh.hehyeop.common.util.file.FileDTO;
import com.kh.hehyeop.company.model.dto.ProField;
import com.kh.hehyeop.help.model.dto.HelpRequest;

@Mapper
public interface HelpRepository {

	@Insert("insert into help_request(req_idx, id, req_name, req_tell, req_address, old_address, req_time, req_pay, req_content, field) "
			+ "values(sc_request_idx.nextval, #{id}, #{reqName}, #{reqTell}, #{reqAddress}, #{oldAddress}, #{reqTime}, #{reqPay}, #{reqContent}, #{field})")
	int insertRequest(HelpRequest helpRequest);

	@Select("select req_idx from help_request where id = #{id}")
	String selectReqIdx(String id);

	@Insert("insert into file_info(file_idx, file_category, origin_name, re_name, save_path, type_idx) "
			+ "values(sc_file_idx.nextval, 'MEMBER', #{originName}, #{reName}, #{savePath}, #{typeIdx})")
	int uploadFile(FileDTO fileDTO);

	@Select("select * from pro_field")
	List<ProField> selectFieldList();

	@Select("select DISTINCT field_category from pro_field")
	List<ProField> selectCategoryList();

	@Select("select * from help_request where id = #{id} order by desc reg_date")
	List<HelpRequest> selectHelpRequestById(String id);

	
}
