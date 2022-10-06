package com.pet.home.board.sharing;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.pet.home.MyAbstractTest;

public class SharingDAOTest extends MyAbstractTest {
	
	@Autowired
	private SharingDAO sharingDAO;
	
	@Test
	public void test() throws Exception {
		for(int i = 1; i<101; i++) {
			SharingDTO sharingDTO = new SharingDTO();
			sharingDTO.setWriter("test4");
			sharingDTO.setTitle("title"+i);
			sharingDTO.setContents("contents"+i);
			sharingDAO.setAdd(sharingDTO);
		}
		
		System.out.println("finish");
	}

}
