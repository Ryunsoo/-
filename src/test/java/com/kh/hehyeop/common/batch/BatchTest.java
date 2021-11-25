package com.kh.hehyeop.common.batch;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.hehyeop.purchase.model.repository.PurchaseRepository;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*-context.xml"})
public class BatchTest {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private PurchaseRepository purchaseRepository;
	
	@Test
	public void autoUpdateTest() {
		
		List<String> regIdxList = purchaseRepository.selectRegIdxList();
		System.out.println(regIdxList.toString());
		purchaseRepository.updateOngoing(regIdxList);
		
	}
}
