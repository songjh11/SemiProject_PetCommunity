package com.pet.home.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE="com.pet.home.member.MemberDAO.";
	
	public MemberDTO getLogin(MemberDTO memberDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getLogin", memberDTO);
		}
		
	
	public int setJoin(MemberDTO memberDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setJoin", memberDTO);
	}
	
	public int setGuest(MemberDTO memberDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setGuest", memberDTO);
	}
	
	public int setBiz(MemberDTO memberDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setBiz", memberDTO);
	}

	public int setAddFile(MemberFileDTO memberFileDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setAddFile", memberFileDTO);
	}
	
	public MemberDTO getGuestPage(MemberDTO memberDTO) {
		return sqlSession.selectOne(NAMESPACE+"getGuestPage", memberDTO);
		
	}
	
	public MemberDTO getBizPage(MemberDTO memberDTO) {
		return sqlSession.selectOne(NAMESPACE+"getBizPage", memberDTO);
		
	}
	
	public MemberDTO getMyPage(MemberDTO memberDTO) {
		return sqlSession.selectOne(NAMESPACE+"getMyPage", memberDTO);
		
	}
		
	public MemberDTO getPickList(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getPickList", memberDTO);
	}
	
	public int setMemDelete(MemberDTO memberDTO)throws Exception{
		return sqlSession.delete(NAMESPACE+"setMemDelete", memberDTO);
	}

	
}
