package com.pet.home.member;


import java.io.File;
import java.util.Calendar;
import java.util.UUID;
import javax.servlet.ServletContext;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.pet.home.util.FileManager;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private FileManager fileManager;
	
	
	
	public MemberDTO getLogin(MemberDTO memberDTO)throws Exception{
		return memberDAO.getLogin(memberDTO);
	}
	
	
	public int setJoin(MemberDTO memberDTO, MultipartFile photo, ServletContext servletContext)throws Exception{
		
		int result = memberDAO.setJoin(memberDTO);
		
		System.out.println("롤 "+memberDTO.getRoleNum());
		
		if(memberDTO.getRoleNum()==2){ 
			//저장 경로 설정 
			String path = "resources/upload/member";
			String fileName = fileManager.saveFile(servletContext, path, photo);
			
			if(!photo.isEmpty()) {
			
				
				MemberFileDTO memberFileDTO = new MemberFileDTO();
				memberFileDTO.setFileName(fileName);
				memberFileDTO.setOriName(photo.getOriginalFilename());
				memberFileDTO.setUserId(memberDTO.getUserId());
				memberDAO.setAddFile(memberFileDTO);
				
			}
		}
		return result;
		
		}
	
	public int setGuest(MemberDTO memberDTO)throws Exception{
		
		return memberDAO.setGuest(memberDTO);
	}
	
	
	public int setBiz(MemberDTO memberDTO)throws Exception{
		
		return memberDAO.setBiz(memberDTO);
	}
	

	public MemberDTO getGuestPage(MemberDTO memberDTO)throws Exception{
		return memberDAO.getGuestPage(memberDTO);
	}
	
	public MemberDTO getBizPage(MemberDTO memberDTO)throws Exception{
		return memberDAO.getBizPage(memberDTO);
	}
	
	public MemberDTO getMyPage(MemberDTO memberDTO)throws Exception{
		return memberDAO.getMyPage(memberDTO);
		
	}
	
	public int setMemDelete(MemberDTO memberDTO)throws Exception{
		return memberDAO.setMemDelete(memberDTO);
	}
	
	public int setMemUpdate(MemberDTO memberDTO)throws Exception{
		return memberDAO.setMemUpdate(memberDTO);
		
	}
	
	public int setGuestUpdate(MemberDTO memberDTO)throws Exception{
		return memberDAO.setGuestUpdate(memberDTO);
		
	}
	
	public int setFileUpdate(MemberFileDTO memberFileDTO, MultipartFile photo, ServletContext servletContext)throws Exception{
		return memberDAO.setFileUpdate(memberFileDTO);
		
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
	
	public List<MemberDTO> getFolloweeList(MemberDTO memberDTO){
		return memberDAO.getFolloweeList(memberDTO);
	}
	
	public List<MemberDTO> getFollowerList(MemberDTO memberDTO){
		return memberDAO.getFollowerList(memberDTO);
	}
	
	public int getFollowerount(MemberDTO memberDTO)throws Exception{
		return memberDAO.getFollowerount(memberDTO);
		
	}
	
	public int getFolloweeount(MemberDTO memberDTO)throws Exception{
		return memberDAO.getFolloweeount(memberDTO);
		
	}
	
	public int setFollow(MemberDTO memberDTO)throws Exception{
		return memberDAO.setFollow(memberDTO);
	}
	
	public int setFollowDelete(MemberDTO memberDTO)throws Exception{
		return memberDAO.setFollowDelete(memberDTO);
	}
	

}
