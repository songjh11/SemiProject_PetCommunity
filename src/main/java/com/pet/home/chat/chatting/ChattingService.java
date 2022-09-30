package com.pet.home.chat.chatting;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ChattingService {
		
	@Autowired
	private ChattingDAO chattingDAO;
	
	
	public List<ChattingDTO> getList(ChattingDTO chattingDTO) throws Exception{
		return chattingDAO.getList(chattingDTO);
	}
	
	public int setAdd(ChattingDTO chattingDTO) throws Exception{
		return chattingDAO.setAdd(chattingDTO); 
	}
}
	
