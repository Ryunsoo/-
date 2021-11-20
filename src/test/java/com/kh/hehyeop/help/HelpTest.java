package com.kh.hehyeop.help;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.hehyeop.common.code.Field;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*-context.xml"})
public class HelpTest {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Test
	public void test() {
		System.out.println(Field.getFieldList());
	}
	
}
