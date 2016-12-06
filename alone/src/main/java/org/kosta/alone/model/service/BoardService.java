package org.kosta.alone.model.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.kosta.alone.model.vo.CommentVO;
import org.kosta.alone.model.vo.IntroduceCategoryVO;
import org.kosta.alone.model.vo.IntroduceVO;
import org.kosta.alone.model.vo.ListVO;
import org.kosta.alone.model.vo.MeetingVO;
import org.kosta.alone.model.vo.MemberVO;
import org.kosta.alone.model.vo.ReviewVO;
import org.kosta.alone.model.vo.UploadFileVO;

public interface BoardService { 

	public ListVO<MeetingVO> getMeetingList(String pageNo);
	
	public List<MeetingVO> getMeetingRegionList(String region);
	
	public List<MeetingVO> findNameMeetingList(String search);
	
	public List<MeetingVO> findTitleMeetingList(String search);
	
	public List<MeetingVO> getRegionInfo();
	
	public ListVO<ReviewVO> reviewList(String nowPage); 
	
    
	public List<IntroduceVO> introduceList(int categoryNo);
	
	public List<IntroduceCategoryVO> introduceCategoryList();

	public IntroduceVO introduceDetail(int boardNo);
	
	public void reviewWrite(ReviewVO reviewVO);
	
	public void meetingWrite(HttpServletRequest request, MeetingVO meetingVO, UploadFileVO uploadFileVO);
	
	public MeetingVO meetingDetail(int boardNo);

	void introduceWrite(IntroduceVO introduceVO);

	public List<CommentVO> commentList(int boardNo);

	public void insertComment(MemberVO memberVO, String comment, int boardNo);

	public void updateComment(CommentVO commentVO);

	public ReviewVO reviewDetail(int boardNo);

	public ListVO<ReviewVO> reviewSerachList(String pageNo, String searchKeyWord, String command);

	public ReviewVO reviewNotHitDetail(int boardNo);


}


