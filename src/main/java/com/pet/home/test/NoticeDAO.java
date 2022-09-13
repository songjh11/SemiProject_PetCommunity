package com.pet.home.test;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.pet.home.test.NoticeDAO.";
	
	public NoticeDTO test() throws Exception {
		return sqlSession.selectOne(NAMESPACE+"test");
	}
	
}
