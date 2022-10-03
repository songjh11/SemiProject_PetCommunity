package com.pet.home.sell;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SellQnaCommentDAO {
	@Autowired
	private SqlSession session;
	private final String NAMESPACE="com.pet.home.sell.SellQnaCommentDAO.";
	
	public int setSellQnaCommentAllDelete(SellQnaCommentDTO sellQnaCommentDTO) throws Exception{
		return session.delete(NAMESPACE+"setSellQnaCommentAllDelete", sellQnaCommentDTO);
	}
	
	public int setSellQnaCommentDelete(SellQnaCommentDTO sellQnaCommentDTO) throws Exception{
		return session.delete(NAMESPACE+"setSellQnaCommentDelete", sellQnaCommentDTO);
	}
	
	public int setSellQnaCommentAdd(SellQnaCommentDTO sellQnaCommentDTO) throws Exception{
		return session.insert(NAMESPACE+"setSellQnaCommentAdd", sellQnaCommentDTO);
	}
	
	public int setSellQnaCommentUpdate(SellQnaCommentDTO sellQnaCommentDTO) throws Exception{
		return session.update(NAMESPACE+"setSellQnaCommentUpdate", sellQnaCommentDTO);
	}
}
