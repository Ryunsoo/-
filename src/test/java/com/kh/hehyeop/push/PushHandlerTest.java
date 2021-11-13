package com.kh.hehyeop.push;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.hehyeop.member.model.dto.CMember;
import com.kh.hehyeop.member.model.dto.Member;
import com.kh.hehyeop.member.model.dto.User;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*-context.xml"})
public class PushHandlerTest {

	@Test
	public void test() {
		Member member = new Member();
		member.setId("asd");
		member.setPoint(10);
		
		User user1 = (User) member;
		
		Member cmember = new Member();
		cmember.setId("asd");
		cmember.setPoint(10);
		
		User user2 = (User) cmember;
		
		System.out.println(member.equals(cmember));
		
	}
	
}
