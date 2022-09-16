package com.pet.home.sell;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SellItemService {
	
	@Autowired
	private SellItemDAO itemDAO;
	
	public int setItemAdd(SellItemDTO itemDTO) {
		return itemDAO.setItemAdd(itemDTO);
	}

}
