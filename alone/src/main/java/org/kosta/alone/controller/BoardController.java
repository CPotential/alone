package org.kosta.alone.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.alone.model.service.BoardService;
import org.kosta.alone.model.vo.IntroduceCategoryVO;
import org.kosta.alone.model.vo.IntroduceVO;
import org.kosta.alone.model.vo.MeetingVO;
import org.kosta.alone.model.vo.MemberVO;
import org.kosta.alone.model.vo.ReviewVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	
	@Resource
	private BoardService boardService; 
	
	@RequestMapping("getMeetingList.do")
	public ModelAndView getMeetingList(){
		ModelAndView mav = new ModelAndView("board/meeting");
		List<MeetingVO> list = boardService.getMeetingList();
		mav.addObject("RegionList",boardService.getRegionInfo()); 
		mav.addObject("list",list);
		return mav;
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
		ModelAndView mav = new ModelAndView("board/meeting");
		if(select.equals("작성자")){
			List<MeetingVO> list = boardService.findNameMeetingList(search);
			request.setAttribute("list", list);
		}else{
			List<MeetingVO> list = boardService.findTitleMeetingList(search); 
			request.setAttribute("list", list); 
		}
		mav.addObject("RegionList",boardService.getRegionInfo());  
		return mav; 
	}
	
	/**
	 * 소개글 카테고리별 리스트 출력
	 * @param categoryNo
	 * @return
	 */
	@RequestMapping("introduceList.do")
	public ModelAndView introduceList(int categoryNo){
		ModelAndView mav = new ModelAndView("board/introduce");
		mav.addObject("introduceList", boardService.introduceList(categoryNo));
		return mav;
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
	
	/**
	 * 소개글 카테고리 목록 ajax
	 * @return
	 */
	@RequestMapping("introduceCategoryListAjax.do")
	@ResponseBody
	public List<IntroduceCategoryVO> introduceCategoryList(){
		return boardService.introduceCategoryList();	
	}
	
	/**
	 * 모임글 작성 페이지 이동
	 * @return
	 */
	@RequestMapping("meetingWriteForm.do")
	public String meetingWriteForm(){
		return "board/meetingWriteForm"; 
	}
	

	//소개글 상세정보
	@RequestMapping("introduceDetail.do")
	public ModelAndView introduceDetail(int boardNo){
		IntroduceVO introVO = boardService.introduceDetail(boardNo);
		return new ModelAndView("board/introduceDetail","introVO",introVO);
	}
	/**
	 * 모임글 작성 후 상세보기로 이동
	 * @param meetingVO
	 * @return
	 */
	@RequestMapping(method=RequestMethod.POST, value="meetingWrite.do")
	public String meetingWrite(HttpServletRequest request, MeetingVO meetingVO){
		HttpSession session = request.getSession(false);
		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		System.out.println(memberVO);
		MeetingVO mvo = meetingVO;
		mvo.setMemberVO(memberVO);
		System.out.println(mvo);
		boardService.meetingWrite(mvo);
		System.out.println(mvo.getBoardNo());
		return "redirect:meetingDetail.do?boardNo=" + mvo.getBoardNo();

	}
	
	//후기게시글 작성형식
	@ RequestMapping("reviewWriteForm.do")
	public String reviewWriteForm(){
		return "board/reviewWriteForm"; 
	}
	
	//후기게시글 작성 취소시 후기게시판리스트 이동 
	@RequestMapping("review.do")
	public String review(){
		return "board/review";
	}
	
	//후기게시판 작성 
	@RequestMapping("reviewWrite.do")
	public ModelAndView reviewWrite(ReviewVO reviewVO,HttpSession session){
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		reviewVO.setMemberVO(mvo);
		boardService.reviewWrite(reviewVO);
		//상세정보가 없어서 일단 review list로 보냄
		return new ModelAndView("redirect:reviewList.do");  
	}
	
	@RequestMapping("meetingDetail.do")
	public ModelAndView meetingDetail(String boardNo){
		ModelAndView mav = new ModelAndView("board/meetingDetail");
		mav.addObject("meetingVO",boardService.meetingDetail(boardNo));
		return mav;

	}
}
