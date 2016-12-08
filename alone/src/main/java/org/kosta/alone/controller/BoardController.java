package org.kosta.alone.controller;



import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.alone.model.service.BoardService;
import org.kosta.alone.model.vo.CommentVO;
import org.kosta.alone.model.vo.CompanyMemberVO;
import org.kosta.alone.model.vo.IntroduceCategoryVO;
import org.kosta.alone.model.vo.IntroduceVO;
import org.kosta.alone.model.vo.ListVO;
import org.kosta.alone.model.vo.MeetingVO;
import org.kosta.alone.model.vo.MemberVO;
import org.kosta.alone.model.vo.ReviewVO;
import org.kosta.alone.model.vo.UploadFileVO;
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
	public ModelAndView getMeetingList(String pageNo){
		ModelAndView mav = new ModelAndView("board/meeting");
		ListVO<MeetingVO> list =  boardService.getMeetingList(pageNo);
		mav.addObject("RegionList",boardService.getRegionInfo()); 
		mav.addObject("list",list);
		return mav;
	}
	
	@RequestMapping("getMeetingRegionList.do")
	@ResponseBody
	public List<MeetingVO> getMeetingRegionList(String region){
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
	public ModelAndView introduceList(int categoryNo,String pageNo){
		ModelAndView mav = new ModelAndView("board/introduce");
		String nowPage = pageNo;
		mav.addObject("categoryNo",categoryNo);  
		mav.addObject("ListVO", boardService.introduceList(categoryNo,nowPage));
		return mav;
	}
	
	@RequestMapping("reviewList.do")
	public ModelAndView reviewList(String pageNo,String searchKeyWord,String command){
		ModelAndView mav = new ModelAndView("board/review");
		ListVO<ReviewVO> list = null;
		System.out.println(pageNo+"    "+searchKeyWord+"     "+command);
		if(command ==null || command.trim() ==""){
			System.out.println(pageNo);
			list = boardService.reviewList(pageNo);
		}else{
			list = boardService.reviewSerachList(pageNo,searchKeyWord,command);
			mav.addObject("keyword",searchKeyWord);
			mav.addObject("command",command);
		}
		
		
		mav.addObject("ListVO",list);
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
	public String meetingWrite(HttpServletRequest request, MeetingVO meetingVO, UploadFileVO uploadFileVO){
		HttpSession session = request.getSession(false);
		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		meetingVO.setMemberVO(memberVO);
		System.out.println(uploadFileVO + "컨트롤러 진입");
		boardService.meetingWrite(request, meetingVO, uploadFileVO);
		return "redirect:meetingDetail.do?boardNo=" + meetingVO.getBoardNo();
	}
	
	//후기게시글 작성형식
	@RequestMapping("reviewWriteForm.do")
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
	public ModelAndView reviewWrite(ReviewVO reviewVO, HttpSession session){
		MemberVO mvo = (MemberVO) session.getAttribute("memberVO");
		reviewVO.setMemberVO(mvo);
		boardService.reviewWrite(reviewVO);
		//상세정보가 없어서 일단 review list로 보냄
		return new ModelAndView("redirect:reviewList.do");  
	}
	
	/**
	 * 모임글 상세보기
	 * @param boardNo
	 * @return
	 */
	@RequestMapping("meetingDetail.do")
	public ModelAndView meetingDetail(int boardNo){

		ModelAndView mav = new ModelAndView("board/meetingDetail");
		mav.addObject("meetingVO",boardService.meetingDetail(boardNo));
		mav.addObject("commentList",boardService.commentList(boardNo));
		return mav;
	}
	
	/**
	 * 소개글작성후 소개글리스트로 이동
	 * @param request
	 * @param meetingVO
	 * @return
	 */

	@RequestMapping(method=RequestMethod.POST, value="introduceWrite.do")
	public String introduceWrite(HttpServletRequest request,IntroduceVO introduceVO, UploadFileVO vo){

		HttpSession session = request.getSession(false);
		//기업회원은 기업회원객체를 가지고있다
		CompanyMemberVO memberVO = (CompanyMemberVO) session.getAttribute("memberVO");
		//로그인한 기업회원정보 출력
		introduceVO.setMemberVO(memberVO);
		//intoduceVO에 기업회원 정보 세팅한후 출력
		//introduceVO에 기업회원 정보까지 세팅한후 전달
		//데이터베이스의  companyMember의 write가 1로 변경

	     //키워드 저장됬는지 확인하기
		//System.out.println("키워드 저장됬는지 확인하기"+introduceVO.getKeyWordVO());
		//이미지 저장하기전 boardNO 파라미터로 얻어옴
		boardService.introduceWrite(introduceVO,vo,request);

		//세션의 CompanyMember의 write도 1로 변경하여 업데이트해준도
		memberVO.setWrite("1");
		
		session.setAttribute("memberVO", memberVO);
	
		return "redirect:introduceDetail.do?boardNo="+introduceVO.getBoardNo();
	}

	@RequestMapping("sendCommentAjax.do")
	@ResponseBody
	public List<CommentVO> commentList(String comment, HttpServletRequest request, int boardNo){
		System.out.println(comment+boardNo);
		HttpSession session = request.getSession(false);
		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");	
		boardService.insertComment(memberVO,comment,boardNo);	
		return boardService.commentList(boardNo);
	}
	

	@RequestMapping("updateCommentAjax")
	@ResponseBody
	public List<CommentVO> updateComment(CommentVO commentVO){
		boardService.updateComment(commentVO);
		return boardService.commentList(commentVO.getBoardNo());
	}
	
	@RequestMapping("reviewdetail.do")
	public ModelAndView reviewDetail(int boardNo, HttpSession session){
		ModelAndView mav = new ModelAndView("board/reviewDetail");
		mav.addObject("rvo",boardService.reviewDetail(boardNo)); 
		mav.addObject("commentList",boardService.commentList(boardNo));
		return mav;
	}

	@RequestMapping("deleteCommentAjax.do")
	@ResponseBody
	public List<CommentVO> deleteComment(CommentVO commentVO){
		
		boardService.deleteComment(commentVO); 
		return boardService.commentList(commentVO.getBoardNo());  
	}
	
	@RequestMapping("reviewNotHitdetail.do")
	public ModelAndView reviewNotHitdetail(int boardNo){
		ModelAndView mav = new ModelAndView("board/reviewDetail");
		mav.addObject("rvo",boardService.reviewNotHitDetail(boardNo)); 
		return mav;
	}

	//후기게시글 수정폼
		@ RequestMapping("reviewUpdateForm.do")
		public ModelAndView reviewUpdateForm(int boardNo){
			return new ModelAndView("board/reviewUpdateForm","rvo",boardService.reviewDetail(boardNo)); 
		}
		
		//후기게시글 수정
		@RequestMapping("reviewUpdate.do")
		public ModelAndView reviewUPdate(ReviewVO reviewVO, HttpSession session){
			MemberVO mvo = (MemberVO) session.getAttribute("memberVO");
	    	reviewVO.setMemberVO(mvo);
	    	boardService.reviewUPdate(reviewVO);
			return new ModelAndView("redirect:reviewList.do");

		}
		
		//모임 게시글 수정 폼
		@RequestMapping("meetingUpdateForm.do")
		public ModelAndView meetingUpdateForm(int boardNo){
			return new ModelAndView("board/meetingUpdateForm","meetingUpdate",boardService.meetingDetail(boardNo)); 
		}
		
		//모임 게시글 수정 
		@RequestMapping("meetingUpdate.do")
		public String meetingUpdate(HttpServletRequest request, MeetingVO meetingVO){
			HttpSession session = request.getSession(false);
			MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
			meetingVO.setMemberVO(memberVO);
			System.out.println(meetingVO+"!@!@!@!@");
			boardService.meetingUpdate(request, meetingVO, null);
			return "redirect:meetingDetail.do?boardNo=" + meetingVO.getBoardNo();
			
		}
}
