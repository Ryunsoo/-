package com.kh.hehyeop.purchase.model.service;

import java.util.List;

import com.kh.hehyeop.purchase.model.dto.MyPurchaseInfo;

public interface PurchaseService {

	List<MyPurchaseInfo> selectMyPurchaseInfo(String id);

}
