package com.pet.home.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	
	
	public MemberDTO getLogin(MemberDTO memberDTO)throws Exception{
		return memberDAO.getLogin(memberDTO);
	}
	
	
	public int setJoin(MemberDTO memberDTO)throws Exception{
		
		return memberDAO.setJoin(memberDTO);
	}
	
	public int setGuest(MemberDTO memberDTO)throws Exception{
		
		return memberDAO.setGuest(memberDTO);
	}
	
	
	public int setBiz(MemberDTO memberDTO)throws Exception{
		
		return memberDAO.setBiz(memberDTO);
	}
	
	public MemberDTO getPickList(MemberDTO memberDTO) throws Exception{
		return memberDAO.getPickList(memberDTO);
	}
	
	public MemberDTO getShopCartList(MemberDTO memberDTO) throws Exception{
		return memberDAO.getShopCartList(memberDTO);
	}
	
	public MemberDTO getTotalPrice(MemberDTO memberDTO) throws Exception{
		return memberDAO.getTotalPrice(memberDTO);
	}
	

}
