package com.pet.home.chat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/chat/*")
public class ChatController {
	
	@GetMapping("chatting.iu")
	public String chat(HttpServletRequest reqeust, HttpServletResponse response, HttpSession session) throws Exception{
		return "chat/chatting";
	}
	
}
