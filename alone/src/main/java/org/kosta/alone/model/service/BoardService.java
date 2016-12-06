package org.kosta.alone.model.service;

import java.util.List;

import org.kosta.alone.model.vo.CommentVO;
import org.kosta.alone.model.vo.IntroduceCategoryVO;
import org.kosta.alone.model.vo.IntroduceVO;
import org.kosta.alone.model.vo.ListVO;
import org.kosta.alone.model.vo.MeetingVO;
import org.kosta.alone.model.vo.MemberVO;
import org.kosta.alone.model.vo.ReviewVO;

public interface BoardService { 

	public ListVO<MeetingVO> getMeetingList(String pageNo);
	
	public List<MeetingVO> getMeetingRegionList(String region);
	
	public List<MeetingVO> findNameMeetingList(String search);
	
	public List<MeetingVO> findTitleMeetingList(String search);
	
	public List<MeetingVO> getRegionInfo();
	
	public ListVO reviewList(String nowPage); 
	
	public List<ReviewVO> reviewTitleSearchList(String searchKeyWord);
	
    public  List<ReviewVO> reviewWriterSearchList(String searchKeyWord);
    
	public List<IntroduceVO> introduceList(int categoryNo);
	
	public List<IntroduceCategoryVO> introduceCategoryList();

	
	public IntroduceVO introduceDetail(int boardNo);
	
	public void reviewWrite(ReviewVO reviewVO);
	
	public void meetingWrite(MeetingVO meetingVO);


	public MeetingVO meetingDetail(String boardNo);


	void introduceWrite(IntroduceVO introduceVO);

	
	public List<CommentVO> commentList(String boardNo);

	public void insertComment(MemberVO memberVO, String comment, String boardNo);

	public void updateComment(CommentVO commentVO);

	public ReviewVO reviewDetail(String boardNo);

}