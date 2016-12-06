package org.kosta.alone.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.alone.model.dao.BoardDAO;
import org.kosta.alone.model.dao.IntroduceDAO;
import org.kosta.alone.model.dao.MeetingDAO;
import org.kosta.alone.model.dao.ReviewDAO;
import org.kosta.alone.model.vo.BoardVO;
import org.kosta.alone.model.vo.CommentVO;
import org.kosta.alone.model.vo.ImageVO;
import org.kosta.alone.model.vo.IntroduceCategoryVO;
import org.kosta.alone.model.vo.IntroduceVO;
import org.kosta.alone.model.vo.KeyWordVO;
import org.kosta.alone.model.vo.ListVO;
import org.kosta.alone.model.vo.MeetingVO;
import org.kosta.alone.model.vo.PagingBean;

import org.kosta.alone.model.vo.MemberVO;

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

/*	public List<MeetingVO> getMeetingList() {
		return meetingDAO.getMeetingList();
	}*/

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
	public ListVO<ReviewVO> reviewList(String nowPage) {
		int totalCount = reviewDAO.getTotalContentCount();

		if (nowPage == null) {
			PagingBean pagingBean = new PagingBean(totalCount);
			pagingBean.setContentNumberPerPage(10);
			pagingBean.setPageNumberPerPageGroup(5);
			List<ReviewVO> list = reviewDAO.reviewList(pagingBean);
			ListVO<ReviewVO> vo = new ListVO<ReviewVO>(list, pagingBean);
			return vo;
		} else {
			PagingBean pagingBean = new PagingBean(totalCount, Integer.parseInt(nowPage));
			pagingBean.setContentNumberPerPage(10);
			pagingBean.setPageNumberPerPageGroup(5);
			List<ReviewVO> list = reviewDAO.reviewList(pagingBean);
			ListVO<ReviewVO> vo = new ListVO<ReviewVO>(list, pagingBean);
			return vo;
		}
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
	 * 1)카테고리에 해당하는 게시물 리스트를 뽑는다 :introduceList 2)첫번째 소개글에 게시물 번호를 얻어와 해당 게시물에
	 * 키워드가 몇개 등록되었는지 확인 한다 :keyWordSize 3) 게시물이 가지고있는 키워드의 이름을 뽀는다
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

	public IntroduceVO introduceDetail(int boardNo) {
		return introduceDAO.introduceDetail(boardNo);
	}

	@Transactional
	public void reviewWrite(ReviewVO reviewVO) {
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
		return boardDAO.commentList(boardNo);
	}

	@Override
	public void insertComment(MemberVO memberVO, String comment, String boardNo) {
		CommentVO commentVO = new CommentVO();
		commentVO.setMemberVO(memberVO);
		commentVO.setContent(comment);
		commentVO.setBoardNo(Integer.parseInt(boardNo));

		boardDAO.insertComment(commentVO);

	}

	@Override
	public void updateComment(CommentVO commentVO) {
		boardDAO.updateComment(commentVO);
	}
	
	public ReviewVO reviewDetail(String boardNo){
		return reviewDAO.reviewDetail(boardNo);
	}
	
	

	@Override
	public ListVO<MeetingVO> getMeetingList(String pageNo){			
		int totalCount=meetingDAO.getTotalContentCount();
		PagingBean pagingBean=null;
		if(pageNo==null){
		pagingBean=new PagingBean(totalCount);
		pagingBean.setContentNumberPerPage(10);
		pagingBean.setPageNumberPerPageGroup(5);
		List<MeetingVO> list = meetingDAO.getMeetingList(pagingBean);
		ListVO<MeetingVO> mtvo = new ListVO<MeetingVO>(list, pagingBean);
		return mtvo;
		}
		else{
      	pagingBean=new PagingBean(totalCount,Integer.parseInt(pageNo));	
		pagingBean.setContentNumberPerPage(10);
		pagingBean.setPageNumberPerPageGroup(5);
		List<MeetingVO> list = meetingDAO.getMeetingList(pagingBean);
		ListVO<MeetingVO> mtvo = new ListVO<MeetingVO>(list, pagingBean);	
		return mtvo;
		}
	}	
	
}
