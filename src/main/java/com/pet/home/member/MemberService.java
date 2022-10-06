package com.pet.home.member;


import java.io.File;
import java.util.Calendar;
import java.util.UUID;
import javax.servlet.ServletContext;
import java.util.List;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.pet.home.board.event.coupon.CouponDTO;
import com.pet.home.sell.PickDTO;
import com.pet.home.sell.ReservationDTO;
import com.pet.home.sell.ShopCartDTO;
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

	public  MemberDTO getPickList(MemberDTO memberDTO) throws Exception{
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
	
	public int getFollowerCount(MemberDTO memberDTO)throws Exception{
		return memberDAO.getFollowerCount(memberDTO);
		
	}
	
	public int getFolloweeCount(MemberDTO memberDTO)throws Exception{
		return memberDAO.getFolloweeCount(memberDTO);
		
	}
	
	public int setFollow(FollowDTO followDTO)throws Exception{
		return memberDAO.setFollow(followDTO);
	}
	
	public int setFolloweeDelete(MemberDTO memberDTO)throws Exception{
		return memberDAO.setFolloweeDelete(memberDTO);
	}
	

	public int setFollowerDelete(MemberDTO memberDTO)throws Exception{
		return memberDAO.setFollowerDelete(memberDTO);
	}
	
	public  List<CouponDTO> getCouponList(MemberDTO memberDTO) throws Exception{
		return memberDAO.getCouponList(memberDTO);

	}
	
	public  List<ReservationDTO> getRevList(MemberDTO memberDTO) throws Exception{
		return memberDAO.getRevList(memberDTO);

	}
	
	public MemberDTO getFindLogin(MemberDTO memberDTO) throws Exception{
		return memberDAO.getFindLogin(memberDTO);
	}
	
	public MemberDTO setUpdatePw(MemberDTO memberDTO) throws Exception{
		return memberDAO.setUpdatePw(memberDTO);
	}
	
	public void setEmail(MemberDTO memberDTO, String div) throws Exception{
		
		String charSet = "utf-8";
		String hostSMTP= "smtp.naver.com";
		String hostSMTPid ="네이버 아이디";
		String hostSMTPpwd = "네이버 비번 ";
		
		String fromEmail ="jiwon1789@naver.com";
		String fromName ="이지원";
		String subject = "", msg="";
		
		if(div.equals("pwEmail")){
			subject ="임시비밀번호입니다 : ";
			msg += "<div>" + memberDTO.getPassword() + "</div>";
		}
		
		String mail = memberDTO.getEmail();
		HtmlEmail email = new HtmlEmail();
		
		email.setDebug(true);
		email.setCharset(charSet);
		email.setSSL(true);
		email.setHostName(hostSMTP);
		email.setSmtpPort(587);
		
		email.setAuthentication(hostSMTPid, hostSMTPpwd);
		email.setTLS(true);
		email.addTo(mail, charSet);
		email.setFrom(fromEmail, fromName, charSet);
		email.setSubject(subject);
		email.setHtmlMsg(msg);
		email.send();
		
	}
	
	public int setPickDelete(PickDTO pickDTO)throws Exception{
		return memberDAO.setPickDelete(pickDTO);
	}
	
	public int setCartDelete(ShopCartDTO shopCartDTO)throws Exception{
		return memberDAO.setCartDelete(shopCartDTO);
	}
	
	public int getItemCount()throws Exception{
		return memberDAO.getItemCount();
	}
	
	public int getMemCount()throws Exception{
		return memberDAO.getMemCount();
	}

	public List<MemberDTO> getMemList(){
		return memberDAO.getMemList();
	}
	
	public List<MemberDTO> getFindMem(MemberDTO memberDTO){
		return memberDAO.getFindMem(memberDTO);
	}
}
