package com.pet.home.chat;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class ChatDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.pet.home.chat.ChatDAO.";
	

	public ChatRoomDTO getChatRoomByRoomNum(String roomNum) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getChatRoomByRoomNum", roomNum);
	}


	public int setSaveMessage(ChatMessageDTO chatMessageDTO) {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE+"setSaveMessage", chatMessageDTO);
	}


	public List<ChatMessageDTO> getMessageList(String roomNum) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"getMessageList", roomNum);
	}


	public int addRoom(ChatRoomDTO chatRoomDTO) {
		// TODO Auto-generated method stub
		return sqlSession.insert(NAMESPACE+"addRoom", chatRoomDTO);
	}


	public ChatRoomDTO getSearchChatRoom(ChatRoomDTO chatRoomDTO) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getSearchChatRoom", chatRoomDTO);
	}


	public List<ChatRoomDTO> getChatRoomList(String userEmail) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"getChatRoomList", userEmail);
	}


	public int getUnReadCount(ChatMessageDTO chatMessageDTO) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(NAMESPACE+"getUnReadCount", chatMessageDTO);
	}


	public int setCount(ChatMessageDTO chatMessageDTO) {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE+"setCount", chatMessageDTO);
	}
	
}
