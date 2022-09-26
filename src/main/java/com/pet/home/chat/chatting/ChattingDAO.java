package com.pet.home.chat.chatting;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ChattingDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.pet.home.chat.chatting.ChattingDAO.";
	
	public List<ChattingDTO> getList(ChattingDTO chattingDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getList", chattingDTO);
	}
	
	public int setAdd(ChattingDTO chattingDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"setAdd", chattingDTO);
	}
}
