package org.kosta.alone.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.alone.model.dao.IntroduceDAO;
import org.kosta.alone.model.dao.MeetingBoardDAO;
import org.kosta.alone.model.dao.ReviewDAO;
import org.kosta.alone.model.vo.IntroduceCategoryVO;
import org.kosta.alone.model.vo.IntroduceVO;
import org.kosta.alone.model.vo.MeetingVO;
import org.kosta.alone.model.vo.ReviewVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class BoardServiceImpl implements BoardService {
	@Resource
	private MeetingBoardDAO meetingBoardDAO;
	@Resource
	private IntroduceDAO introduceDAO;
	@Resource
	private ReviewDAO reviewDAO;


	public List<MeetingVO> getMeetingList() {
		return meetingBoardDAO.getMeetingList();
	}

	@Override
	public List<MeetingVO> getMeetingRegionList(String region) {
		return meetingBoardDAO.getMeetingRegionList(region);
	}

	@Override
	public List<MeetingVO> findNameMeetingList(String search) {
		return meetingBoardDAO.findNameMeetingList(search);
	}

	@Override
	public List<MeetingVO> findTitleMeetingList(String search) {
		return meetingBoardDAO.findTitleMeetingList(search);
	}
	
	@Override
	public List<MeetingVO> getRegionInfo() {
		return meetingBoardDAO.getRegionInfo();
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
		introduceList = introduceDAO.introduceList(categoryNo);
		int keyWordSize = introduceDAO.keyWordSize(introduceDAO.introduceList(categoryNo).get(0).getBoardNo());
		for (int i = 0; i < introduceList.size(); i++) {
			for (int j = 0; j < keyWordSize; j++) {
				introduceList.get(j).setKeyWordVO(introduceDAO.keyWordList(introduceList.get(j).getBoardNo()));
			}
		}
		System.out.println(introduceList);
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
}
