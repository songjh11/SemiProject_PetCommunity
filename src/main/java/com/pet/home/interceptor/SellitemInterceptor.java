package com.pet.home.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.pet.home.member.MemberDTO;
import com.pet.home.member.RoleDTO;
import com.pet.home.sell.SellItemDTO;
import com.pet.home.sell.SellItemService;

public class SellitemInterceptor extends HandlerInterceptorAdapter{

	@Autowired
	private SellItemService itemService;
		
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		
		boolean check = false;

		
		if(request.getMethod().equals("GET")) {
		System.out.println(request.getMethod());
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		System.out.println("Parameter : "+request.getParameter("itemNum"));
//		String query = request.getQueryString();
//		int idx = query.indexOf("="); 
//		String itemNum = query.substring(idx+1);
		String itemNum = request.getParameter("itemNum");
		System.out.println(itemNum);
		
		SellItemDTO itemDTO = new SellItemDTO();
		itemDTO.setItemNum(Long.parseLong(itemNum));
		itemDTO = itemService.getDetailOne(itemDTO);
		System.out.println(itemDTO.getUserId());
		
		System.out.println(memberDTO.getUserId());
				
		
		if(memberDTO.getRoleNum().equals(1)) {
			System.out.println("멤버번호: "+check);
			if(memberDTO.getUserId().equals(itemDTO.getUserId())) {
				System.out.println("아이디 동일: "+check);
				check = true;
				return check;
				
			}

		} else if(memberDTO.getRoleNum().equals(0)) {
			System.out.println("관리자 아이디: "+check);
			check = true;
			return check;
		
		} else {
			check = false;
		}
		
		//admin이나 seller 아닐떄
		if(!check) {
			request.setAttribute("message", "권한이 없습니다");
			request.setAttribute("url", "../../../../../");
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/result.jsp");//JSP의 경로 넣기
			view.forward(request, response);
		}
		
		System.out.println(check);
		return check;
		
		} else {
			check = true;
			return check;
		}
		
	}


	
	
	
	

}
