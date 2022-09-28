package com.pet.home.sell;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RvCommentDAO {
	
	@Autowired
	private SqlSession session;
	private final String NAMESPACE="com.pet.home.sell.RvCommentDAO.";
	
	public int setReviewCommentAllDelete(RvCommentDTO rvCommentDTO) throws Exception{
		return session.delete(NAMESPACE+"setReviewCommentAllDelete", rvCommentDTO);
	}
	
	public int setReviewCommentDelete(RvCommentDTO rvCommentDTO) throws Exception{
		return session.delete(NAMESPACE+"setReviewCommentDelete", rvCommentDTO);
	}
	
	public int setReviewCommentAdd(RvCommentDTO rvCommentDTO) throws Exception{
		return session.insert(NAMESPACE+"setReviewCommentAdd", rvCommentDTO);
	}
	
	public int setReviewCommentUpdate(RvCommentDTO rvCommentDTO) throws Exception{
		return session.update(NAMESPACE+"setReviewCommentUpdate", rvCommentDTO);
	}

}
