package com.kh.hehyeop.management.model.service;

import java.util.List;

import com.kh.hehyeop.management.model.dto.Icebox;

public interface ManagementService {

	List<Icebox> selectIceboxUpList(String id, String category);

	List<Icebox> selectIceboxDownList(String id, String category);

}
