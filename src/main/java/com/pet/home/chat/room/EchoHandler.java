package com.pet.home.chat.room;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpSession;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;

import org.mybatis.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.pet.home.chat.chatting.ChattingDTO;
import com.pet.home.chat.chatting.ChattingService;
import com.pet.home.member.MemberDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/echo")
public class EchoHandler extends TextWebSocketHandler {

 	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
 	
 	// 클라이언트가 연결 되었을 때 실행
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		MemberDTO memberDTO = this.getUserName(session);
		if(memberDTO != null) {	
			sessionList.add(session);
			//log.info("{} 연결됨", session.getId());
		}
	}

	//클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		MemberDTO memberDTO = this.getUserName(session);
		
		//log.info("{}로부터 {}를 받음", session.getId(), message.getPayload());
		for(WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(memberDTO.getUserName() + ":" + message.getPayload()));
		}
		
	}
	
	//클라이언트 연결을 끊었을 때 실행
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		MemberDTO memberDTO = this.getUserName(session);
		
		sessionList.remove(session);
		//log.info("{} 연결 끊김", session.getId());
	}
	
	//접속한 유저의 Http세션을 조회하여 userName을 불러옴
	private MemberDTO getUserName(WebSocketSession session) {
		Map<String, Object> map = session.getAttributes();
		MemberDTO memberDTO = (MemberDTO)map.get("member");
		return memberDTO==null? null: memberDTO;
	}
	
	
	
}
