package org.kosta.alone.model.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.kosta.alone.model.vo.CommentVO;
import org.kosta.alone.model.vo.IntroduceCategoryVO;
import org.kosta.alone.model.vo.IntroduceVO;
import org.kosta.alone.model.vo.MeetingVO;
import org.kosta.alone.model.vo.ReviewVO;
import org.kosta.alone.model.vo.UploadFileVO;

public interface BoardService { 
	public List<MeetingVO> getMeetingList();
	
	public List<MeetingVO> getMeetingRegionList(String region);
	
	public List<MeetingVO> findNameMeetingList(String search);
	
	public List<MeetingVO> findTitleMeetingList(String search);
	
	public List<MeetingVO> getRegionInfo();
	
	public List<ReviewVO> reviewList();
	
	public List<ReviewVO> reviewTitleSearchList(String searchKeyWord);
	
    public  List<ReviewVO> reviewWriterSearchList(String searchKeyWord);
    
	public List<IntroduceVO> introduceList(int categoryNo);
	
	public List<IntroduceCategoryVO> introduceCategoryList();
	
	public IntroduceVO introduceDetail(int boardNo);
	
	public void reviewWrite(ReviewVO reviewVO);
	
	public void meetingWrite(HttpServletRequest request, MeetingVO meetingVO, UploadFileVO uploadFileVO);

	public MeetingVO meetingDetail(int boardNo);
	
	public List<CommentVO> commentList(int boardNo);

	public void imageUpload(String originalFilename);

}