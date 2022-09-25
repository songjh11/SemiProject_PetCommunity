package com.pet.home.chat.chatting;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.TextMessage;

import com.pet.home.chat.room.EchoHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ChatController {
	
	@GetMapping("/chat")
	public String chat(Model model) {
		log.info("[Controller] : chat");
		
//		memberDTO = memberService.getLogin(memberDTO);
//		model.addAttribute("dto", memberDTO);	
		return "chat/chatting";
	}
	
	
}
