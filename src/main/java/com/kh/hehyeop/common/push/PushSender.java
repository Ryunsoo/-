package com.kh.hehyeop.common.push;

import java.util.ArrayList;
import java.util.List;

import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Component;

import com.google.firebase.messaging.BatchResponse;
import com.google.firebase.messaging.FirebaseMessaging;
import com.google.firebase.messaging.FirebaseMessagingException;
import com.google.firebase.messaging.Message;
import com.google.firebase.messaging.Notification;
import com.kh.hehyeop.member.model.dto.User;
import com.kh.hehyeop.mypage.model.service.MypageService;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class PushSender {

	private final MypageService mypageService;
	
	public void send(User user, String title, String body) {
		List<String> tokenList = getTokens(user.getId());
		sendPush(title, body, tokenList);
	}
	
	public void send(List<User> userList, String title, String body) {
		List<String> userIdList = new ArrayList<String>();
		userList.stream().forEach((user) -> userIdList.add(user.getId()));
		
		List<String> tokenList = getTokens(userIdList);
		sendPush(title, body, tokenList);
	}
	
	private void sendPush(String title, String body, List<String> tokenList) {
		Notification noti = getNotification(title, body);
		if(tokenList.isEmpty()) return;
		List<Message> messageList = getMessage(noti, tokenList);
		
		try {
			BatchResponse response = FirebaseMessaging.getInstance().sendAll(messageList);
			System.out.println(response.getSuccessCount());
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
	
	private List<Message> getMessage(Notification noti, List<String> tokenList) {
		List<Message> messageList = new ArrayList<Message>();
		
		for (String token : tokenList) {
			Message message = Message.builder()
					.setNotification(noti)
					.setToken(token)
					.build();
			messageList.add(message);
		}
		return messageList;
	}
	
	private List<String> getTokens(String userId) {
		return mypageService.getValidTokens(userId);
	}
	
	private List<String> getTokens(List<String> userIdList) {
		return mypageService.getValidTokens(userIdList);
	}
	
}
