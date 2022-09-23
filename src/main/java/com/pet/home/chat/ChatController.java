package com.pet.home.chat;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.json.GsonBuilderUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
public class ChatController {
	
//	@GetMapping("/chatting")
	public String getChat() {
		System.out.println("@ChatController, chat GET()");
		return "chat/room";
	}
	
	@Autowired
	private ChattingService chattingService;
	@Autowired
	private ChatSession chatSession;
	
	@RequestMapping(value = "{roomNum}")
	public void getMessageList(@PathVariable String roomNum, String userEmail, Model model, HttpServletResponse response) {
		
		List<ChatMessageDTO> mList = chattingService.getMessageList(roomNum);
		response.setContentType("application/json; charset=utf-8");
		
		//안 읽은 메세지 숫자 0으로 바꾸기
		ChatMessageDTO message = new ChatMessageDTO();
		message.setEmail(userEmail);
		message.setRoomNum(roomNum);
		chattingService.setCount(message);
		
		
		
	}
	
}
