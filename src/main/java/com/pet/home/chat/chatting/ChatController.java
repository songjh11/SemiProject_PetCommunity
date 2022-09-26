package com.pet.home.chat.chatting;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.socket.TextMessage;

import com.pet.home.chat.room.EchoHandler;
import com.pet.home.member.MemberDTO;
import com.pet.home.member.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ChatController {
	
	@Autowired
	private ChattingService chattingService;
	
	@Autowired
	private MemberService memberService;
	
	
	@RequestMapping("/chat")
	public String chat(Model model, ChattingDTO chattingDTO, HttpServletRequest request) throws Exception {
		log.info("[Controller] : chat");
		
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
		chattingDTO.setUserName(memberDTO.getUserName());
		List<ChattingDTO> chattingDTOs= chattingService.getList(chattingDTO);
		model.addAttribute("dto", chattingDTO);
		model.addAttribute("list", chattingDTOs);
		
		return "chat/chatting";
	}
	
	
	@PostMapping("/chat/add")
	@ResponseBody
	public void addChat(ChattingDTO chattingDTO) throws Exception{
		
		int result = chattingService.setAdd(chattingDTO);
	}
	
	
	
}
