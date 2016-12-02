package org.kosta.alone.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.alone.model.dao.IntroduceDAO;
import org.kosta.alone.model.dao.MeetingBoardDAO;
import org.kosta.alone.model.dao.ReviewDAO;
import org.kosta.alone.model.vo.IntroduceCategoryVO;
import org.kosta.alone.model.vo.IntroduceVO;
import org.kosta.alone.model.vo.KeyWordVO;
import org.kosta.alone.model.vo.MeetingVO;
import org.kosta.alone.model.vo.ReviewVO;
import org.springframework.stereotype.Service;

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
	/**
	 * 1)카테고리에 해당하는 게시물 리스트를 뽑는다 :introduceList
	 * 2)첫번째 소개글에 게시물 번호를 얻어와 해당 게시물에 키워드가 몇개 등록되었는지 확인 한다 :keyWordSize
	 * 3) 게시물이 가지고있는 키워드의 이름을 뽀는다
	 * introduceList.get(i).getBoardNo()게시물 번호
	 */
	@Override
	public List<IntroduceVO> introduceList(int categoryNo) {
		List<IntroduceVO> introduceList = null;
		introduceList = introduceDAO.introduceList(categoryNo);
		List<KeyWordVO> keyWordVO =null; 
		
		for (int i = 0; i < introduceList.size(); i++) {
			keyWordVO = introduceDAO.keyWordList(introduceList.get(i).getBoardNo());			
			introduceList.get(i).setKeyWordVO(keyWordVO);
		}
		
		
		return introduceList;
	}
	
	// 소개글 카테고리 리스트
	@Override
	public List<IntroduceCategoryVO> introduceCategoryList() {
		return introduceDAO.introduceCategoryList();
	}
	@Override
	public MeetingVO meetingDetail(String boardNo) {
		
		return meetingBoardDAO.meetingDetail(boardNo);
	}
}
