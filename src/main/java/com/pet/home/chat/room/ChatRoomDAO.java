package com.pet.home.chat.room;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChatRoomDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.pet.home.chat.room.ChatRoomDAO.";
	
	
	//채팅 리스트 불러오기
	public List<ChatRoomDTO> getList() throws Exception{
		return sqlSession.selectList(NAMESPACE+"getList");
	}
	//채팅방 추가하기
	public int setAdd(ChatRoomDTO chatRoomDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setAdd", chatRoomDTO);
	}
	
}
