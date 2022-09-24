package com.pet.home.chat;

import java.io.IOException;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;

import lombok.extern.slf4j.Slf4j;

@Controller
public class ChatController {
	
	@GetMapping("/chatting")
	public String getChat() {
		System.out.println("@ChatController, chat GET()");
		return "chat/chatting";
	}
	
	@Autowired
	private ChattingService chattingService;
	@Autowired
	private ChatSession chatSession;
	
	/**
	 * 
	 * @param roomNum
	 * @param userEmail
	 * @param model
	 * @param response
	 * @throws JsonIOException
	 * @throws IOException
	 */
	
	
	@RequestMapping(value = "{roomNum}")
	public void getMessageList(@PathVariable String roomNum, String userEmail, Model model, HttpServletResponse response) throws JsonIOException, IOException {
		
		List<ChatMessageDTO> mList = chattingService.getMessageList(roomNum);
		response.setContentType("application/json; charset=utf-8");
		
		//안 읽은 메세지 숫자 0으로 바꾸기
		ChatMessageDTO message = new ChatMessageDTO();
		message.setEmail(userEmail);
		message.setRoomNum(roomNum);
		chattingService.setCount(message);

		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(mList, response.getWriter());
		
	}
	@ResponseBody
	@RequestMapping("createChat.do")
	public String createChat(ChatRoomDTO chatRoomDTO, String userName, String userEmail, String masterNickName) {
		
		chatRoomDTO.setUserEmail(userEmail);
		chatRoomDTO.setUserEmail(userName);
		
		ChatRoomDTO exist = chattingService.getSearchChatRoom(chatRoomDTO);
		
		if(exist == null) {
			System.out.println("방이 없습니다.");
			int result = chattingService.addRoom(chatRoomDTO);
			if(result == 1) {
				System.out.println("방 생성!");
				return "new";
			}else {
				return "fail";
			}
			//DB에 방이 있으면
		}else {
			System.out.println("방이 있습니다");
			return "exist";
		}
	}
	
	@RequestMapping("chatRoomList")
	public void getChatRoom(ChatRoomDTO chatRoomDTO, ChatMessageDTO chatMessageDTO, String userEmail, HttpServletResponse response) throws Exception{
		List<ChatRoomDTO> cList = chattingService.getChatRoomList(userEmail);
		
		for(int i = 0 ; i < cList.size(); i++) {
			chatMessageDTO.setRoomNum(cList.get(i).getRoomNum());
			chatMessageDTO.setEmail(userEmail);
			Long count = chattingService.getUnReadCount(chatMessageDTO);
			cList.get(i).setUnReadCount(count);
		}
		
		response.setContentType("application/json; charset=utf-8");
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(cList,response.getWriter());
	}
	
	@RequestMapping("chatSession")
	public void chatSession(HttpServletResponse response) throws Exception{
		ArrayList<String> chatSessionList = chatSession.getLoginUser();
		
		response.setContentType("application/json; charset=utf-8");
		
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(chatSessionList,response.getWriter());
	}
}
