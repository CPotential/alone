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
}
