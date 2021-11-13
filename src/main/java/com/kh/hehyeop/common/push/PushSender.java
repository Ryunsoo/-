package com.kh.hehyeop.common.push;

import java.util.List;

import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Component;

import com.google.firebase.messaging.FirebaseMessaging;
import com.google.firebase.messaging.FirebaseMessagingException;
import com.google.firebase.messaging.Message;
import com.google.firebase.messaging.Notification;
import com.kh.hehyeop.member.model.dto.Member;
import com.kh.hehyeop.member.model.dto.User;
import com.kh.hehyeop.mypage.model.service.MypageService;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class PushSender {

	private final MypageService mypageService;
	
	public void send(String userId, String title, String body) {
		Notification noti = getNotification(title, body);
		Message message = getMessage(noti, userId);
		
		
		
		
		
		
		try {
			FirebaseMessaging.getInstance().send(message);
		} catch (FirebaseMessagingException e) {
			e.setStackTrace(new StackTraceElement[0]);
		}
	}
	
	private Notification getNotification(String title, String body) {
		ClassPathResource resource = new ClassPathResource("static/logo-icon.png");
		
		Notification noti = Notification.builder()
				.setTitle(title)
				.setBody(body)
				.setImage(resource.getPath())
				.build();
		
		return noti;
	}
	
	private Message getMessage(Notification noti, String userId) {
		Message message = Message.builder()
				.setNotification(noti)
				.setToken("")
				.build();
		return message;
	}
	
	private String getToken(String userId) {
		//mypageService.getValidTokens();
		return null;
	}
	
}
