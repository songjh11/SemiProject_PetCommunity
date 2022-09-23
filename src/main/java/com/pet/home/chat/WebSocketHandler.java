package com.pet.home.chat;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;

@Controller
public class WebSocketHandler extends TextWebSocketHandler implements InitializingBean {
	
	@Autowired
	private ChattingService chattingService;
	
	private final ObjectMapper objectMapper = new ObjectMapper();
	
	//채팅방 목록<방번호 (스트링), ArrayList<session> >
	private Map<String, ArrayList<WebSocketSession>> roomList = new ConcurrentHashMap<String, ArrayList<WebSocketSession>>();
	// session, 방 번호
	private Map<WebSocketSession, String> sessionList = new ConcurrentHashMap<WebSocketSession, String>();
	
	private static int i;
	
	/**
	 * 연결 성공 했을 때
	 */
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		// TODO Auto-generated method stub
		i++;
		System.out.println(session.getId() + "연결 성공 = > 총 접속 인원 :" + i + "명");
		//log.info("{} 연결됨", session.getId());
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		// TODO Auto-generated method stub
		//전달 받은 메시지
		String msg = message.getPayload();
		
		//Json 객체 - > Java 객체
		ChatMessageDTO chatMessageDTO = objectMapper.readValue(msg, ChatMessageDTO.class);
		
		//받은 메시지에 담긴 roomNum으로 해당 채팅방 찾기
		ChatRoomDTO chatRoomDTO = chattingService.getChatRoomByRoomNum(chatMessageDTO.getRoomNum());
		
		//만약 채팅 세션 목록에 채팅방 존재 x , 처음 방문 , DB에서 채팅방이 있을때
		//채팅방 생성함
		if(roomList.get(chatRoomDTO.getRoomNum()) == null && chatMessageDTO.getMessage().equals("ENTER-CHAT") && chatRoomDTO != null) {
			
			//채팅방에 들어갈 session 들
			ArrayList<WebSocketSession> sessionTwo = new ArrayList<WebSocketSession>();
			//session 추가
			sessionTwo.add(session);
			//sessionList에 추가
			sessionList.put(session, chatRoomDTO.getRoomNum());
			//roomList에도 추가
			roomList.put(chatRoomDTO.getRoomNum(), sessionTwo);
			//확인
			System.out.println("채팅방 생성완료");
		}else if(roomList.get(chatRoomDTO.getRoomNum()) != null && chatMessageDTO.getMessage().equals("ENTER-CHAT") && chatRoomDTO != null) {
			
			//메세지에 이름, 이메일 ,내용 담음
			TextMessage textMessage = new TextMessage(chatMessageDTO.getUserName()+"," + chatMessageDTO.getEmail() + "," + chatMessageDTO.getMessage());
			
			//현재 session 수
			int sessionCount = 0;
			
			for(WebSocketSession sess : roomList.get(chatRoomDTO.getRoomNum())) {
				sess.sendMessage(textMessage);
				sessionCount++;
			}
			
			//동적 쿼리에서 사용할 sessionCount 저장?
			//sessionCount == 2일 떄 unReadCount = 0 저장
			//sessionCount == 1 일 때 unReadCount = 1 저장함
			chatMessageDTO.setSessionCount(sessionCount);
			
			//db에 저장
			int a = chattingService.setSaveMessage(chatMessageDTO);
			
			if(a==1) {
				System.out.println("메세지 전송 성공");
			}else {
				System.out.println("메세지 전송 실패");
			}
			
		}	
		
		
	}
	
	
	/**
	 * 
	 * 연결 종료 시
	 */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		i--;
		System.out.println(session.getId() + "연결 종료 = > 총 접속 인원 :" + i + "명");
		
		//sessionList에 session이 있으면
		if(sessionList.get(session) != null) {
			roomList.get(sessionList.get(session)).remove(session);
			sessionList.remove(session);
		}
		
		
		//log.info("{} 연결 끊김", session.getId());
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	
	
}
