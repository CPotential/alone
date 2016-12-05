package org.kosta.alone.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.alone.model.dao.BoardDAO;
import org.kosta.alone.model.dao.IntroduceDAO;
import org.kosta.alone.model.dao.MeetingDAO;
import org.kosta.alone.model.dao.ReviewDAO;
import org.kosta.alone.model.vo.CommentVO;
import org.kosta.alone.model.vo.ImageVO;
import org.kosta.alone.model.vo.IntroduceCategoryVO;
import org.kosta.alone.model.vo.IntroduceVO;
import org.kosta.alone.model.vo.KeyWordVO;
import org.kosta.alone.model.vo.MeetingVO;
import org.kosta.alone.model.vo.ReviewVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class BoardServiceImpl implements BoardService {
	@Resource
	private MeetingDAO meetingDAO;
	@Resource
	private IntroduceDAO introduceDAO;
	@Resource
	private ReviewDAO reviewDAO;
	@Resource
	private BoardDAO boardDAO;

	public List<MeetingVO> getMeetingList() {
		return meetingDAO.getMeetingList();
	}

	@Override
	public List<MeetingVO> getMeetingRegionList(String region) {
		return meetingDAO.getMeetingRegionList(region);
	}

	@Override
	public List<MeetingVO> findNameMeetingList(String search) {
		return meetingDAO.findNameMeetingList(search);
	}

	@Override
	public List<MeetingVO> findTitleMeetingList(String search) {
		return meetingDAO.findTitleMeetingList(search);
	}

	@Override
	public List<MeetingVO> getRegionInfo() {
		return meetingDAO.getRegionInfo();
	}

	@Override
	public List<ReviewVO> reviewList() {
		return reviewDAO.reviewList();
	}

	@Override
	public List<ReviewVO> reviewTitleSearchList(String searchKeyWord) {
		return reviewDAO.reviewTitleSearchList(searchKeyWord);
	}

	@Override
	public List<ReviewVO> reviewWriterSearchList(String searchKeyWord) {
		return reviewDAO.reviewWriterSearchList(searchKeyWord);
	}

	// 소개글 리스트
	/**
	 * 1)카테고리에 해당하는 게시물 리스트를 뽑는다 :introduceList
	 * 2)첫번째 소개글에 게시물 번호를 얻어와 해당 게시물에 키워드가 몇개 등록되었는지 확인 한다 :keyWordSize
	 * 3) 게시물이 가지고있는 키워드의 이름을 뽀는다
	 * introduceList.get(i).getBoardNo()게시물 번호
	 */
	@Override
	public List<IntroduceVO> introduceList(int categoryNo) {
		List<IntroduceVO> introduceList = null;
		List<ImageVO> imageList = null;
		List<KeyWordVO> keyWordVO = null;
		introduceList = introduceDAO.introduceList(categoryNo);

		


		for (int i = 0; i < introduceList.size(); i++) {

			keyWordVO = introduceDAO.keyWordList(introduceList.get(i).getBoardNo());
			introduceList.get(i).setKeyWordVO(keyWordVO);
			imageList = boardDAO.introduceFirstImage(introduceList.get(i).getBoardNo());
			introduceList.get(i).setImageVO(imageList);

		}

		


		return introduceList;
	}

	// 소개글 카테고리 리스트
	@Override
	public List<IntroduceCategoryVO> introduceCategoryList() {
		return introduceDAO.introduceCategoryList();
	}

	/**
	 * 소개글 작성
	 */
	@Override
	@Transactional
	public void introduceWrite(IntroduceVO introduceVO) {
		introduceDAO.boardWrite(introduceVO);
		introduceDAO.introduceWrite(introduceVO);
		introduceDAO.updateWrite(introduceVO.getMemberVO().getId());
	}
	

	public IntroduceVO introduceDetail(int boardNo){
		return introduceDAO.introduceDetail(boardNo);  
	}
	
	@Transactional
	public void reviewWrite(ReviewVO reviewVO){
		reviewDAO.reviewBoardWrite(reviewVO); 
		reviewDAO.reviewWrite(reviewVO);
	}

	@Override
	public void meetingWrite(MeetingVO meetingVO) {
		meetingDAO.boardWrite(meetingVO);
		meetingDAO.meetingWrite(meetingVO);
	}

	@Override
	public MeetingVO meetingDetail(String boardNo) {

		return meetingDAO.meetingDetail(boardNo);

	}

	@Override
	public List<CommentVO> commentList(String boardNo) {
		// TODO Auto-generated method stub
		return boardDAO.commentList(boardNo);
	}
}
