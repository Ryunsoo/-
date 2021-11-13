package com.kh.hehyeop.push;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.kh.hehyeop.common.push.PushSender;
import com.kh.hehyeop.member.model.dto.CMember;
import com.kh.hehyeop.member.model.dto.Member;
import com.kh.hehyeop.member.model.dto.User;
import com.kh.hehyeop.mypage.model.repository.MypageRepository;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*-context.xml"})
public class PushHandlerTest {

	@Autowired
	PushSender sender;
	
	@Test
	public void pushToOneUser() {
		Member member = new Member();
		member.setId("ddd");
		
		sender.send(member, "나는 자취해협이당", "무엇을 원하는가");
	}
	
	@Test
	public void pushToManyUser() {
		Member member1 = new Member();
		member1.setId("bbb");
		
		Member member2 = new Member();
		member2.setId("token");
		
		sender.send(List.of(member1, member2), "여러명한테 보낸다", "하하하하ㅏ");
	}
	
}
