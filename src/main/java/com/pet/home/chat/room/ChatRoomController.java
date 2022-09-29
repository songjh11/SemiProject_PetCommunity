package com.pet.home.chat.room;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pet.home.member.MemberDTO;
import com.pet.home.member.MemberService;

@Controller
@RequestMapping("/chatRoom/*")
public class ChatRoomController {
	
	@Autowired
	private ChatRoomService chatRoomService;

	
	@RequestMapping(value = "list")
	public ModelAndView getList(HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		List<ChatRoomDTO> list = chatRoomService.getList();
		mv.addObject("list", list);
		mv.addObject("dto", memberDTO);
		mv.setViewName("chat/list");
		return mv;
	}
	
	
	@PostMapping("add")
	public String setAdd(ModelAndView mv, ChatRoomDTO chatRoomDTO) throws Exception{
		int result = chatRoomService.setAdd(chatRoomDTO);
		return "redirect:./list";
	}
	
	
	
}
