package com.kh.hehyeop.purchase.model.repository;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.kh.hehyeop.common.util.file.FileDTO;
import com.kh.hehyeop.purchase.model.dto.MyPurchaseInfo;
import com.kh.hehyeop.purchase.validator.RegisterForm;

@Mapper
public interface PurchaseRepository {

	@Insert("insert into purchase_register(reg_idx, id, item_name, item_link, deal_loc, end_time, deal_time, price, total_num, buy_num, content) "
			+ "values (sc_reg_idx.nextval, #{id}, #{itemName}, #{itemLink}, #{dealLoc}, #{endTime}, #{dealTime}, #{price}, #{totalNum}, #{buyNum}, #{content})")
	int registerInfo(RegisterForm form);

	@Select("select reg_idx from purchase_register p where rownum = 1 order by reg_idx desc")
	String selectRegIdx();

	@Insert("insert into file_info(file_idx, file_category, origin_name, re_name, save_path, type_idx) "
			+ "values(sc_file_idx.nextval, 'PURCHASE', #{originName}, #{reName}, #{savePath}, #{typeIdx})")
	int uploadFile(FileDTO fileUpload);

	@Select("select * from purchase_register where reg_idx = #{regIdx}")
	MyPurchaseInfo selectPurchaseInfoByIdx(@Param("regIdx") String regIdx);

}
