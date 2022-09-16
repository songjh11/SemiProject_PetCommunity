package com.pet.home.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.pet.home.member.MemberDAO.";
	
	public int setJoin(MemberDTO memberDTO){
		return sqlSession.insert(NAMESPACE+"setJoin", memberDTO);
	}
}
