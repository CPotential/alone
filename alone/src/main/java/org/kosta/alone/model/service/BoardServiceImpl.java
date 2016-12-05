package org.kosta.alone.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.alone.model.dao.BoardDAO;
import org.kosta.alone.model.dao.IntroduceDAO;
import org.kosta.alone.model.dao.MeetingDAO;
import org.kosta.alone.model.dao.ReviewDAO;
import org.kosta.alone.model.vo.ImageVO;
import org.kosta.alone.model.vo.IntroduceCategoryVO;
import org.kosta.alone.model.vo.IntroduceVO;
import org.kosta.alone.model.vo.KeyWordVO;
import org.kosta.alone.model.vo.ListVO;
import org.kosta.alone.model.vo.MeetingVO;
import org.kosta.alone.model.vo.PagingBean;
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

	public IntroduceVO introduceDetail(int boardNo){
		return introduceDAO.introduceDetail(boardNo);  
	}
	
	@Transactional
	public void reviewWrite(ReviewVO reviewVO){
		reviewDAO.reviewBoardWrite(reviewVO); 
		reviewDAO.reviewWrite(reviewVO);
	}
	/**
	 * 모임글 작성
	 */
	@Override
	public void meetingWrite(MeetingVO meetingVO) {
		meetingDAO.boardWrite(meetingVO);
		meetingDAO.meetingWrite(meetingVO);
	}

	@Override
	public MeetingVO meetingDetail(String boardNo) {
		System.out.println(meetingDAO.meetingDetail(boardNo));
		return meetingDAO.meetingDetail(boardNo);
	}
	
	public ReviewVO reviewDetail(String boardNo){
		return reviewDAO.reviewDetail(boardNo);
	}
	
	
	@Override
	public ListVO<MeetingVO> getMeetingList(){				
		return getMeetingList("1");
	}
	@Override
	public ListVO<MeetingVO> getMeetingList(String pageNo){			
		int totalCount=meetingDAO.getTotalContentCount();
		PagingBean pagingBean=null;
		if(pageNo==null)
		pagingBean=new PagingBean(totalCount);
		pagingBean.setContentNumberPerPage(10);
		pagingBean.setPageNumberPerPageGroup(5);
		List<MeetingVO> list=new List<MeetingVO>(pageNo);

		else
      	pagingBean=new PagingBean(totalCount,Integer.parseInt(pageNo));	
		pagingBean.setContentNumberPerPage(10);
		pagingBean.setPageNumberPerPageGroup(5);

		return new ListVO<MeetingVO>(list, pagingBean);

	}
}
