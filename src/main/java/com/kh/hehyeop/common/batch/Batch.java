package com.kh.hehyeop.common.batch;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.kh.hehyeop.purchase.model.repository.PurchaseRepository;

@Component
public class Batch {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private PurchaseRepository purchaseRepository;
	

	@Scheduled(cron = "0 0 12 * * *")
	public void autoUpdate() {
		
		List<String> regIdxList = purchaseRepository.selectRegIdxList();
		purchaseRepository.updateOngoing(regIdxList);
	}
}
