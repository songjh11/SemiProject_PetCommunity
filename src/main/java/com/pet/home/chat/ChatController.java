package com.pet.home.chat;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ChatController {
	
	@GetMapping("/chatting")
	public String getChat() {
		log.info("@ChatController, chat GET()");
		return "chat/room";
	}
	
	
}
