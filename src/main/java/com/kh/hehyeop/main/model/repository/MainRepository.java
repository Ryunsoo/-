package com.kh.hehyeop.main.model.repository;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface MainRepository {
	
	@Select("select distinct major_key from location where city like '%성남%'")
	String test();
}
