package com.kh.hehyeop.management;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.kh.hehyeop.common.code.ExpenseCate;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*-context.xml"})
public class ManagementControllerTest {

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	WebApplicationContext wac;
	MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(wac).build();
	}
	
	@Test
	public void test() {
		System.out.println(ExpenseCate.getCateName());
	}
	
	@Test
	public void savePersonalSpend() throws Exception {
		mockMvc.perform(get("/management/personal-spend")
				.param("category", "FOOD")
				.param("content", "")
				.param("expDate", "2021-11-26")
				.param("price", "50"))
		.andExpect(status().is3xxRedirection())
		.andDo(print());
	}
	
	@Test
	public void saveFixedSpend() throws Exception {
		String content = null;
		mockMvc.perform(get("/management/fixed-spend")
				.param("content", content)
				.param("days", "50.5")
				.param("cycle", "day")
				.param("startDate", "2021-11-26")
				.param("endDate", content)
				.param("price", "50"))
		.andExpect(status().is3xxRedirection())
		.andDo(print());
	}
	
}
