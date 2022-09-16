package com.pet.home.error;

import java.sql.SQLException;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class BackErrorController {
	
	//예외 처리 메서드 
			@ExceptionHandler(Exception.class)
			public ModelAndView getException() {
				ModelAndView mv = new ModelAndView();
				mv.setViewName("error/backError");
				return mv;
			}
			
			@ExceptionHandler(SQLException.class)
			public ModelAndView getSQLException() {
				ModelAndView mv = new ModelAndView();
				mv.setViewName("error/backError");
				return mv;
			}
			
			@ExceptionHandler(NullPointerException.class)
			public ModelAndView getNullPointerException() {
				ModelAndView mv = new ModelAndView();
				mv.setViewName("error/backError");
				return mv;
			}

}
