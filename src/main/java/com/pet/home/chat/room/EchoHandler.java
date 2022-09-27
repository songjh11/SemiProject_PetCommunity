package com.pet.home.chat.room;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import javax.servlet.http.HttpSession;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;

import org.mybatis.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.pet.home.chat.chatting.ChattingDTO;
import com.pet.home.chat.chatting.ChattingService;
import com.pet.home.member.MemberDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/echo")
@Controller
public class EchoHandler extends TextWebSocketHandler {

 	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
 	private List<MemberDTO> userSessionList = new ArrayList<MemberDTO>();
 	
 	
 	
  	// 클라이언트가 연결 되었을 때 실행
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//현재 보내는 사람 id
		MemberDTO memberDTO = this.getUserName(session);
		if(memberDTO.getUserName() != null) { //로그인 세션이 들어왔을 때

			//log.info("현재 접속한 사람 : " + memberDTO.getUserName());
			sessionList.add(session);

			//log.info("{} 연결됨", session.getId());

			userSessionList.add(memberDTO);
			

		}
		
		for(WebSocketSession sess : sessionList) {
			for(MemberDTO mDTO : userSessionList) {
				sess.sendMessage(new TextMessage(mDTO.getUserName()+":"+"접속"));
			}
		}
		
		
	}

	//클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		MemberDTO memberDTO = this.getUserName(session);
		String msg = message.getPayload();
		

		//log.info("{}로부터 {}를 받음", session.getId(), message.getPayload());

		// 실시간 알림기능 
		if(msg != null) {
			String[] strs = msg.split(",");
			//log.info(strs.toString());
			if(strs != null && strs.length == 4) {
				String target = strs[0]; //message를 받을 타겟
				String roomNum = strs[1]; 
				String content = strs[2];
				WebSocketSession targetSession = null;
				for(MemberDTO mDTO : userSessionList) {
					if(mDTO.getUserName() != memberDTO.getUserName()) {
						targetSession = (WebSocketSession) mDTO;
					}
				}
			
				if(targetSession != null) {
					TextMessage tmpMsg = new TextMessage("<a target='_blank' href='"+ roomNum +"'>[<b>" + target + "</b>] " + content + "</a>" );
					targetSession.sendMessage(tmpMsg);
				}
			}
			
			
		}
		
		//1:1 채팅
		//log.info("{}로부터 {}를 받음", session.getId(), message.getPayload());

		for(WebSocketSession sess : sessionList) {
			sess.sendMessage(new TextMessage(memberDTO.getUserName() + ":" + message.getPayload()));
			for(MemberDTO mDTO : userSessionList) {
				sess.sendMessage(new TextMessage(mDTO.getUserName() + ":" + "접속"));
			}
		}
		
		
		
	}
	
	//클라이언트 연결을 끊었을 때 실행
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		
		MemberDTO memberDTO = this.getUserName(session);

		
		sessionList.remove(session);
		//log.info("{} 연결 끊김", session.getId());
		if(memberDTO.getUserName() != null) {
			userSessionList.remove(memberDTO);
			sessionList.remove(session);
			//log.info("{} 연결 끊김", session.getId());
		}

	}
	
	
	
	
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		// TODO Auto-generated method stub
		//log.info(session.getId() + "익셉션 발생 : " + exception.getMessage());
	}

	//접속한 유저의 Http세션을 조회하여 userName을 불러옴
	private MemberDTO getUserName(WebSocketSession session) {
		Map<String, Object> map = session.getAttributes();
		MemberDTO memberDTO = (MemberDTO)map.get("member");
		if(memberDTO == null) {
			//log.info("로그인 안함");
			return null;
		}
		
		return memberDTO;
	}
	
	
	
}
