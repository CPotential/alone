package org.kosta.alone.controller;

import javax.annotation.Resource;

import org.kosta.alone.model.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	
	@Resource
	private BoardService service;
	
	@RequestMapping("reviewList.do")
	public ModelAndView reviewList(){
		ModelAndView mav = new ModelAndView("board/review");
		mav.addObject("reviewList",service.reviewList());
		return mav;
	}
	
	@RequestMapping("findByTitle.do")
	public ModelAndView findByTitle(String searchKeyWord){
		ModelAndView mav = new ModelAndView("board/review");
		mav.addObject("reviewList",service.reviewTitleSearchList(searchKeyWord));
		return mav;
	}
	
	@RequestMapping("findByWriter.do")
	public ModelAndView findByWriter(String searchKeyWord){
		ModelAndView mav = new ModelAndView("board/review");
		mav.addObject("reviewList",service.reviewWriterSearchList(searchKeyWord));
		return mav;
	}
	

}
