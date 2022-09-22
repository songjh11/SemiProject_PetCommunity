package com.pet.home.member;

import java.io.File;
import java.util.Calendar;
import java.util.UUID;

import javax.servlet.ServletContext;

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
		
		System.out.println("photo ser:"+photo);
		
		//저장 경로 설정 
		String path = servletContext.getRealPath("resources/upload/member");
		String fileName = fileManager.saveFile(servletContext, path, photo);
		
		if(!photo.isEmpty()) {
		
			
			MemberFileDTO memberFileDTO = new MemberFileDTO();
			memberFileDTO.setFileName(fileName);
			memberFileDTO.setOriName(photo.getOriginalFilename());
			memberFileDTO.setUserId(memberDTO.getUserId());
			memberDAO.setAddFile(memberFileDTO);
			
		}
		
		
		
		
		return result;
		
	}
	
	public int setGuest(MemberDTO memberDTO)throws Exception{
		
		return memberDAO.setGuest(memberDTO);
	}
	
	
	public int setBiz(MemberDTO memberDTO)throws Exception{
		
		return memberDAO.setBiz(memberDTO);
	}
	
	

}
