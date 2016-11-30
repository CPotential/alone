package org.kosta.alone.controller;

import javax.annotation.Resource;

import org.kosta.alone.model.service.BoardService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {

	@Resource
	private BoardService boardService;
	
	@RequestMapping("introduceList.do")
	public ModelAndView introduceList(int categoryNo){
		ModelAndView mv = new ModelAndView("board/introduce");
		mv.addObject("introduceList", boardService.introduceList(categoryNo));
		return mv;
	}
	
	@RequestMapping("reviewList.do")
	public ModelAndView reviewList(){
		ModelAndView mav = new ModelAndView("board/review");
		mav.addObject("reviewList",boardService.reviewList());
		return mav;
	}
	
	@RequestMapping("findByTitle.do")
	public ModelAndView findByTitle(String searchKeyWord){
		ModelAndView mav = new ModelAndView("board/review");
		mav.addObject("reviewList",boardService.reviewTitleSearchList(searchKeyWord));
		return mav;
	}
	
	@RequestMapping("findByWriter.do")
	public ModelAndView findByWriter(String searchKeyWord){
		ModelAndView mav = new ModelAndView("board/review");
		mav.addObject("reviewList",boardService.reviewWriterSearchList(searchKeyWord));
		return mav;
	}

}
