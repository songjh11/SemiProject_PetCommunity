package com.pet.home.sell;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ResponseBody;

@Repository
public class PickDAO {
	@Autowired
	private SqlSession session;
	private final String NAMESPACE="com.pet.home.sell.PickDAO.";
	
	public int setPickAdd(PickDTO pickDTO) throws Exception{
		return session.insert(NAMESPACE+"setPickAdd", pickDTO);
	}
	
	public PickDTO getPickCheck(PickDTO pickDTO) throws Exception{
		return session.selectOne(NAMESPACE+"getPickCheck", pickDTO);
	}
	
	public int setPickDelete(PickDTO pickDTO) throws Exception{
		return session.delete(NAMESPACE+"setPickDelete", pickDTO);
	}
}
