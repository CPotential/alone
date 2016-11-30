package org.kosta.alone.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.alone.model.service.BoardService;
import org.kosta.alone.model.vo.MeetingVO;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	
	@Resource
	private BoardService boardService; 
	
	@RequestMapping("getMeetingList.do")
	public ModelAndView getMeetingList(){
		ModelAndView mv = new ModelAndView("board/meeting");
		List<MeetingVO> list = boardService.getMeetingList();
		mv.addObject("RegionList",boardService.getRegionInfo()); 
		mv.addObject("list",list);
		return mv;
	}
	
	@RequestMapping("getMeetingRegionList.do")
	@ResponseBody
	public List<MeetingVO> getMeetingRegionList(String region){
		System.out.println(region); 
		List<MeetingVO> rList = boardService.getMeetingRegionList(region);
		return rList; 
	} 
	
	@RequestMapping("findMeetingList.do")
	public ModelAndView findMeetingList(HttpServletRequest request){
		String select = request.getParameter("select");
		String search = request.getParameter("search");
		ModelAndView mv = new ModelAndView("board/meeting");
		if(select.equals("작성자")){
			List<MeetingVO> list = boardService.findNameMeetingList(search);
			request.setAttribute("list", list);
		}else{
			List<MeetingVO> list = boardService.findTitleMeetingList(search); 
			request.setAttribute("list", list); 
		}
		mv.addObject("RegionList",boardService.getRegionInfo()); 
		return mv; 
	}

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
