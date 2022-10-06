package com.pet.home.sell.check;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pet.home.member.MemberDTO;

@Repository
public class CheckDAO {

	@Autowired
	private SqlSession session;
	
	private final String NAMESPACE = "com.pet.home.sell.check.CheckDAO.";
	
	public int setCheck (CheckDTO checkDTO) {
		return session.insert(NAMESPACE+"setCheck", checkDTO);
	}
	
	public List<CheckDTO> getPurchaseList(String userId) throws Exception{
		return session.selectList(NAMESPACE+"getPurchaseList", userId);
	}
	
	public CheckDTO getPurchaseDetail(CheckDTO checkDTO) throws Exception{
		return session.selectOne(NAMESPACE+"getPurchaseDetail", checkDTO);
	}
	
	public int setPurchaseDelete(CheckDTO checkDTO) throws Exception {
		return session.delete(NAMESPACE+"setPurchaseDelete", checkDTO); 
	}
}
