package com.kh.hehyeop.push;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.google.firebase.messaging.FirebaseMessaging;
import com.google.firebase.messaging.FirebaseMessagingException;
import com.google.firebase.messaging.Message;
import com.google.firebase.messaging.WebpushConfig;
import com.google.firebase.messaging.WebpushNotification;
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
		member.setId("test");
		
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
	
	@Test
	public void webPushNotification() throws FirebaseMessagingException {
		
		WebpushConfig config =  WebpushConfig.builder()
			.setNotification(WebpushNotification.builder()
					.setTitle("웹푸시노티")
					.setBody("으아아아아....")
					.build())
			.build();
		
		Message message = Message.builder().setWebpushConfig(config)
			.setToken("c2A2yT1g5Fw:APA91bG6LmTaiSoHRCvRztpSdUwstgvGMvCr_fkMcpq3IMtdc_dGxhZmUkpZ8J2Ravk0QrTwsBgdrsRbXuYZ1IjaA4R0TPSnS8JDubx3Fc0Ix-MUCPoFSP6ltDe0B1KsD6iwkHVCLopU")
			.build();
		
		FirebaseMessaging.getInstance().send(message);
	}
	
}
