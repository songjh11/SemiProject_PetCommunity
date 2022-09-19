package com.pet.home.sellItem;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.pet.home.MyAbstractTest;
import com.pet.home.sell.SellItemDAO;
import com.pet.home.sell.SellItemDTO;


public class SellItemTest extends MyAbstractTest{

	@Autowired
	private SellItemDAO sellItemDAO;
	
	@Test
	public void setItemAddTest() throws Exception {
		SellItemDTO dto = new SellItemDTO();
		dto.setUserId("m1");
		dto.setItemPrice(20000L);
		dto.setItemName("암거나");
		dto.setItemContents("암거나");
		dto.setItemZipCode(58L);
		dto.setItemAddress("sdfa");
		dto.setItemDeAddress("afaf");
		dto.setItemCatg("Hotel");
		
		sellItemDAO.setItemAdd(dto);		
	}
	

}
