package com.pet.home.error;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
@RequestMapping("/error/*")
public class FrontErrorController {
	
	//400 : paramter의 type이 틀릴 때
	 //403 : 권한
	// 404 : not found, URL이나 View 경로가 없을 때
	// 405 : method 형식이 틀릴 경우
	
	@GetMapping("error400")
	public ModelAndView error400() throws Exception{
		
		ModelAndView mv = new ModelAndView();
		System.out.println("paramter의 type이 틀림");
		mv.setViewName("error/error_400");
		return mv;
		
	}

	
	@GetMapping("error403")
	public ModelAndView error403() throws Exception{
		
		ModelAndView mv = new ModelAndView();
		System.out.println("권한이 틀림");
		mv.setViewName("error/error_403");
		return mv;
		
	}
	
	@GetMapping("error404")
	public ModelAndView error404() throws Exception{
		
		ModelAndView mv = new ModelAndView();
		System.out.println("not found, URL이나 View 경로가 없을 때");
		mv.setViewName("error/error_404");
		return mv;
		
	}
	
	@GetMapping("error405")
	public ModelAndView error405() throws Exception{
		
		ModelAndView mv = new ModelAndView();
		System.out.println("method 형식이 틀림");
		mv.setViewName("error/error_405");
		return mv;
		

	
}
}
