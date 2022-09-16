package com.pet.home.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	
	public int setJoin(MemberDTO memberDTO){
		
		int result = memberDAO.setJoin(memberDTO);
		
		return result;
	}
	

}
