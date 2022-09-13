package com.pet.home;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.pet.home.test.NoticeDAO;
import com.pet.home.test.NoticeDTO;

public class noticeDAOtest extends MyAbstractTest {
	
	@Autowired
	private NoticeDAO noticeDAO;
	
	@Test
	public void test() throws Exception  {
		
		NoticeDTO noticeDTO= noticeDAO.test();
		System.out.println(noticeDTO.getTitle());
		
		
	}

}
