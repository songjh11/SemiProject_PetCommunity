package com.pet.home.chat.room;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.pet.home.member.MemberDTO;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/echo")
@Controller
public class EchoHandler extends TextWebSocketHandler {

// 	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
 	private Map<String, WebSocketSession> users = new ConcurrentHashMap<String, WebSocketSession>();
 	
 	
 	
  	// 클라이언트가 연결 되었을 때 실행
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//현재 보내는 사람 id
		String m_id = this.getUserName(session);
		if(m_id != null) { //로그인 세션이 들어왔을 때

			//log.info("현재 접속한 사람 : " + memberDTO.getUserName());
			System.out.println("현재 접속한 사람 : " + m_id);

			//log.info("{} 연결됨", session.getId());

			users.put(m_id, session);
		
		
//			for(WebSocketSession sess : sessionList) {
//				for(MemberDTO mDTO : userSessionList) {
//					sess.sendMessage(new TextMessage(mDTO.getUserName()+":"+"접속"));
//				}	
//			}
		}
		
	}

	//클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		String m_id = this.getUserName(session);
		String msg = message.getPayload();
		

		//log.info("{}로부터 {}를 받음", session.getId(), message.getPayload());

		// 실시간 알림기능 
		if(msg != null && m_id != null) {
			String[] strs = msg.split(",");
			//log.info(strs.toString());
			if(strs != null && strs.length == 4) {
				String target = strs[0]; //message를 받을 타겟
				System.out.println("target:"+target);
				String url = strs[1]; // 현재 url
				System.out.println("url:"+url);
				String writer = strs[2]; //writer
				System.out.println("writer:"+writer);
				String content = strs[3]; //contents
				System.out.println("content:"+content);
				WebSocketSession targetSession = users.get(target);
				
			
				if(targetSession != null) {
					TextMessage tmpMsg = new TextMessage("<a target='_blank' href='"+ url +"'>[<b>" + writer + "</b>] " + content + "</a>" );
					targetSession.sendMessage(tmpMsg);
				}
			}
			
			
		
		
		//1:1 채팅
		//log.info("{}로부터 {}를 받음", session.getId(), message.getPayload());
//			System.out.println("{}로부터 {}를 받음"+ session.getId()+":"+ message.getPayload());
//
//			for(WebSocketSession sess : sessionList) {
//				sess.sendMessage(new TextMessage(memberDTO.getUserName() + ":" + message.getPayload()));
//			}	
			
		}
		
	}
	
	//클라이언트 연결을 끊었을 때 실행
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		String m_id = this.getUserName(session);

		
//		sessionList.remove(session);
		//log.info("{} 연결 끊김", session.getId());
		System.out.println("{} 연결 끊김"+ m_id);
		
		users.remove(m_id);


	}
	
	
	
	
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		// TODO Auto-generated method stub
//		log.info(session.getId() + "익셉션 발생 : " + exception.getMessage());
	}

	//접속한 유저의 Http세션을 조회하여 userName을 불러옴
	private String getUserName(WebSocketSession session) {
		Map<String, Object> map = session.getAttributes();
		MemberDTO memberDTO = (MemberDTO)map.get("member");
		String m_id = memberDTO.getUserName();
		return m_id==null? null : m_id;
	}
	
	
	
}