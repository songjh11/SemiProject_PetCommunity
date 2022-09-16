package com.pet.home.notice;

import static org.junit.Assert.*;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.pet.home.MyAbstractTest;
import com.pet.home.board.notice.NoticeDAO;
import com.pet.home.board.notice.NoticeDTO;
import com.pet.home.util.Pager;

public class NoticeDAOTest extends MyAbstractTest {

	@Autowired
	private NoticeDAO noticeDAO;
	
	@Test
	public void getListTest() throws Exception {
		
		for(int i = 1 ; i <101; i++) {
		NoticeDTO noticeDTO = new NoticeDTO();
		noticeDTO.setWriter("writer"+i);
		noticeDTO.setTitle("title"+i);
		noticeDTO.setContents("contents"+i);
		noticeDAO.setAdd(noticeDTO);
		}
		
		System.out.println("finish");
	}

}
