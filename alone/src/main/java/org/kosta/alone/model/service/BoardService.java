package org.kosta.alone.model.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.kosta.alone.model.vo.BoardVO;

import org.kosta.alone.model.vo.CommentVO;

import org.kosta.alone.model.vo.IntroduceCategoryVO;
import org.kosta.alone.model.vo.IntroduceVO;
import org.kosta.alone.model.vo.ListVO;
import org.kosta.alone.model.vo.MeetingVO;
import org.kosta.alone.model.vo.MemberVO;
import org.kosta.alone.model.vo.ReviewVO;
import org.kosta.alone.model.vo.UploadFileVO;

public interface BoardService {

	public ListVO<MeetingVO> meetingList(String pageNo);

	public List<MeetingVO> getMeetingRegionList(String region);

	public List<MeetingVO> getRegionInfo();

	public ListVO<ReviewVO> reviewList(String nowPage);

	public ListVO<IntroduceVO> introduceList(int categoryNo, String nowPage);

	public List<IntroduceCategoryVO> introduceCategoryList();

	public IntroduceVO introduceDetail(int boardNo);

	public void reviewWrite(ReviewVO reviewVO);

	public void meetingWrite(HttpServletRequest request, MeetingVO meetingVO, UploadFileVO uploadFileVO);
	void introduceWrite(IntroduceVO introduceVO, UploadFileVO vo, HttpServletRequest request);
	public MeetingVO meetingDetail(int boardNo);

	public List<CommentVO> commentList(int boardNo);

	public void insertComment(MemberVO memberVO, String comment, int boardNo);

	public void updateComment(CommentVO commentVO);

	public void imageUpload(BoardVO boardVO, UploadFileVO vo, HttpServletRequest request);

	public void deleteComment(CommentVO commentVO);

	public ReviewVO reviewDetail(int boardNo);

	public ReviewVO reviewNotHitDetail(int boardNo);

	public void reviewUPdate(ReviewVO reviewVO);

	IntroduceVO showCompanyBoard(String id);

	String deleteImage(String deleteFileName, HttpServletRequest request);

	public void introduceUpdate(IntroduceVO introduceVO, UploadFileVO vo, HttpServletRequest request);

	public ListVO<ReviewVO> reviewSerachList(String pageNo, String searchKeyWord, String command);

	public ListVO<MeetingVO> meetingSearchList(String pageNo, String searchKeyWord, String command);

	public MeetingVO meetingNoHitDetail(int boardNo);

	public void meetingUpdate(HttpServletRequest request, MeetingVO meetingVO, UploadFileVO uploadFileVO);

	public void deleteBoard(int boardNo);

	public int reviewLikeUp(BoardVO bvo);
	
	public int introduceLikeUp(BoardVO bvo);
	
	public List<IntroduceVO> rankingIntroduceList();

	void introduceDelete(String id, int boardNo);

}
