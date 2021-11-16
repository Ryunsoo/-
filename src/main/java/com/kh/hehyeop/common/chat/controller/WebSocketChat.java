package com.kh.hehyeop.common.chat.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.HttpSession;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.hehyeop.common.chat.model.service.ChatService;
import com.kh.hehyeop.member.model.dto.User;

@Controller
@ServerEndpoint(value="/chat.echo/{room}")
public class WebSocketChat {
    
	private ObjectMapper objectMapper = new ObjectMapper();
	//private static final List<Session> sessionList = new ArrayList<Session>();
    private static final ConcurrentHashMap<String, List<Session>> sessionList = new ConcurrentHashMap<String, List<Session>>();
    private static final Logger logger = LoggerFactory.getLogger(WebSocketChat.class);
    public WebSocketChat() {
        // TODO Auto-generated constructor stub
        System.out.println("웹소켓(서버) 객체생성");
    }
    
	/*
	 * @GetMapping(value = "/loginProcess.do")
	 * public String loginProcess(HttpSession session) {
	 * User user = (User) session.getAttribute("authentication");
	 * 
	 * //logger.info("Welcome " + user.getNickname());
	 * //session.setAttribute("id", user.getNickname());
	 * session.setAttribute("id", "asdf");
	 * 
	 * return "chat-room";
	 * }
	 */
    
    @OnOpen
    public void onOpen(Session session, @PathParam(value = "room") String no) {
    	System.out.println(no);
    	System.out.println(session.getId());
        logger.info("Open session id:"+session.getId());
        try {
            final Basic basic=session.getBasicRemote();
            basic.sendText("대화방에 연결 되었습니다.");
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
        
        addSessionList(session, no);
        //sessionList.add(session);
    }
    
    private void addSessionList(Session session, String no) {
    	//map.get(방번호) 아무것도 없으면 list를 만들어주고,
    	if(sessionList.get(no) == null) {
    		List<Session> list = new ArrayList<Session>();
    		list.add(session);
    		sessionList.put(no, list);
    	}else {
    		//있으면 기존에 있던 list에 담아준다.
    		List<Session> list = sessionList.get(no);
    		list.add(session);
    	}
    }
    
    /*
     * 모든 사용자에게 메시지를 전달한다.
     * @param self
     * @param sender
     * @param message
     */
    private void sendAllSessionToMessage(Session self, String sender, String message, String roomNo) {
    	List<Session> list = sessionList.get(roomNo);
    	
        try {
            for(Session session : list) {
                if(!self.getId().equals(session.getId())) {
                    session.getBasicRemote().sendText(sender+" : "+message);
                }
            }
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
    }
    
    /*
     * 내가 입력하는 메세지
     * @param message
     * @param session
     */
    @OnMessage
    public void onMessage(String message, Session session) throws JsonMappingException, JsonProcessingException {
    	Map<String, String> textMap = objectMapper.readValue(message, Map.class);
    	
    	String sender = textMap.get("sender");
    	message = textMap.get("content");
    	
        logger.info("Message From "+sender + ": "+message);
        try {
            final Basic basic=session.getBasicRemote();
            basic.sendText(":" + message);
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
        sendAllSessionToMessage(session, sender, message, textMap.get("roomNo"));
    }
    
    @OnError
    public void onError(Throwable e,Session session) {
        
    }
    
    @OnClose
    public void onClose(Session session, @PathParam(value = "room") String no) {
    	System.out.println(no);
        logger.info("Session "+session.getId()+" has ended");
        List<Session> list = sessionList.get(no);
        list.remove(session);
    }
}
