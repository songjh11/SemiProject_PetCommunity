package com.pet.home.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pet.home.board.event.coupon.CouponDTO;

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
		
	public List<MemberDTO> getPickList(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getPickList", memberDTO);
	}
	
	public int setMemDelete(MemberDTO memberDTO)throws Exception{
		return sqlSession.delete(NAMESPACE+"setMemDelete", memberDTO);
	}
	
	public int setMemUpdate(MemberDTO memberDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"setMemUpdate", memberDTO);
		
	}
	
	public int setGuestUpdate(MemberDTO memberDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"setGuestUpdate", memberDTO);
		
	}
	
	public int setFileUpdate(MemberFileDTO memberFileDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"setFileUpdate", memberFileDTO);
		
	}

	public List<MemberDTO> getShopCartList(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectList(NAMESPACE+"getShopCartList", memberDTO);
	}
	
	public MemberDTO getTotalPrice(MemberDTO memberDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getTotalPrice", memberDTO);
	}

			
	public List<MemberDTO> getFolloweeList(MemberDTO memberDTO){
		return sqlSession.selectList(NAMESPACE+"getFolloweeList",memberDTO);
	}
	
	public List<MemberDTO> getFollowerList(MemberDTO memberDTO){
		return sqlSession.selectList(NAMESPACE+"getFollowerList",memberDTO);
	}

	public int getFollowerount(MemberDTO memberDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getFollowerCount", memberDTO);
	}
	
	public int getFolloweeount(MemberDTO memberDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getFolloweeCount", memberDTO);
	}
	
	public int setFollow(MemberDTO memberDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setFollow", memberDTO);
	}
	
	public int setFollowDelete(MemberDTO memberDTO)throws Exception{
		return sqlSession.delete(NAMESPACE+"setFollowDelete", memberDTO);
	}
	
	public List<CouponDTO> getCouponList(MemberDTO memberDTO){
		return sqlSession.selectList(NAMESPACE+"getCouponList", memberDTO);
	}
	
}
