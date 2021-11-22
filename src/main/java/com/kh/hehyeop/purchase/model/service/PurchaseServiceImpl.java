package com.kh.hehyeop.purchase.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.hehyeop.purchase.model.dto.MyPurchaseInfo;
import com.kh.hehyeop.purchase.model.repository.PurchaseRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PurchaseServiceImpl implements PurchaseService {
	private final PurchaseRepository purchaseRepository;
	
	@Override
	public List<MyPurchaseInfo> selectMyPurchaseInfo(String id) {
		return purchaseRepository.selectMyPurchaseInfo(id);
	}

}
