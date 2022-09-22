package com.pet.home.listtest;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.pet.home.MyAbstractTest;
import com.pet.home.member.MemberDAO;
import com.pet.home.member.MemberDTO;
import com.pet.home.sell.SellItemDTO;

public class PickListTest extends MyAbstractTest {
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Test
	public void test() {
		MemberDTO memberDTO = new MemberDTO();
		try {
			List<MemberDTO> ar = memberDAO.getPickList(null);
			System.out.println(ar.size());
			for(int i=0; i<ar.size(); i++) {
				MemberDTO memberDTO2 = ar.get(i);
				System.out.println(memberDTO2.getItemDTOs().size());
				SellItemDTO sellItemDTO = ar.get(i).getItemDTOs().get(i); 
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
