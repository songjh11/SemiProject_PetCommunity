package com.pet.home.sell;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SellItemDAO {
	
	@Autowired
	private SqlSession session;
	private final String NAMESPACE = "com.pet.home.sell.SellItemDAO.";
	
	public int setItemAdd(SellItemDTO itemDTO) {
		return session.insert(NAMESPACE+"setItemAdd", itemDTO);
	}
	
	
}
