package com.pet.home.sell.purchase;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PurchaseCancelDAO {
	
	@Autowired
	private SqlSession session;
	private final String NAMESPACE = "com.pet.home.sell.purchase.PurchaseDAO."; 
	
	public int setPurchaseCancelOne (PurchaseCancelDTO cancelDTO) {
		return session.insert(NAMESPACE+"setPurchaseCancelOne", cancelDTO);
	}
	
	public List<PurchaseDTO> getPurchaseCancleList (String userId) {
		return session.selectList(NAMESPACE+"getPurchaseCancleList", userId);
	}
	
	public List<PurchaseDTO> getSellerPurchaseCancleList(String userId) throws Exception{
		return session.selectList(NAMESPACE+"getSellerPurchaseCancleList", userId);
	}
}
