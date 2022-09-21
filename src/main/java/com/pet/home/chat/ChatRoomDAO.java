package com.pet.home.chat;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChatRoomDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.pet.home.chat.ChatRoomDAO.";
	
	
	public List<ChatRoomDTO> findAllRoom(){
		return sqlSession.selectList(NAMESPACE+"findAllRoom");
	}
	
	public ChatRoomDTO findRoomById(ChatRoomDTO chatRoomDTO) {
		return sqlSession.selectOne(NAMESPACE+"findRoomById", chatRoomDTO);
	}
	
	public int createChatRoom(ChatRoomDTO chatRoomDTO) {
		return sqlSession.insert(NAMESPACE+"createChatRoom", chatRoomDTO);
	}
	
}
