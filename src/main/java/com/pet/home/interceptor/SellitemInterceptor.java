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
		
		HttpSession session = request.getSession();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		
		String query = request.getQueryString();
		int idx = query.indexOf("="); 
		String itemNum = query.substring(idx+1);
		System.out.println(itemNum);
		
		SellItemDTO itemDTO = new SellItemDTO();
		itemDTO.setItemNum(Long.parseLong(itemNum));
		itemDTO = itemService.getDetailOne(itemDTO);
		System.out.println(itemDTO.getUserId());
		
		System.out.println(memberDTO.getUserId());
				
		boolean check = false;
		
		if(memberDTO.getRoleNum().equals("1")) {
			if(memberDTO.getUserId().equals(itemDTO.getUserId())) {
				check = true;
			}

		} else if(memberDTO.getRoleNum().equals("0")) {
			check = true;
		
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
		
		return check;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

	}
	
	
	
	

}
