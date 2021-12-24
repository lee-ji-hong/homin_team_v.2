package com.care.homin;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class ExceptionController {
//	@ExceptionHandler(Exception.class)
//	private ModelAndView errormv(Exception ex) {
//		ModelAndView modelAndView = new ModelAndView();
//		modelAndView.setViewName("/error/errorpage");
//		modelAndView.addObject("exception", ex);
//		
//		return modelAndView;
//	}
}
