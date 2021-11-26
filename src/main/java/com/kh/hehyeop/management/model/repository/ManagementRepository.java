package com.kh.hehyeop.management.model.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.kh.hehyeop.management.model.dto.Icebox;

@Mapper
public interface ManagementRepository {

	@Select("select v.*, floor(EX_DATE - sysdate) res_day from icebox v where id = #{id} and category=#{category} and floor(EX_DATE - sysdate) > 3 order by ex_date")
	List<Icebox> selectIceboxUpList(@Param("id")String id, @Param("category") String category);

	@Select("select v.*, floor(EX_DATE - sysdate) res_day from icebox v where id = #{id} and category=#{category} and floor(EX_DATE - sysdate) <= 3 order by ex_date")
	List<Icebox> selectIceboxDownList(@Param("id")String id, @Param("category") String category);


}
