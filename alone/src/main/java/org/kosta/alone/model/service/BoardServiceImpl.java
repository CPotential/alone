package org.kosta.alone.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.alone.model.dao.ReviewDAO;
import org.kosta.alone.model.vo.ReviewBoardVO;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Resource
	private ReviewDAO reviewDAO;

	@Override
	public List<ReviewBoardVO> reviewList() {
		
		return reviewDAO.reviewList();
	}

	@Override
	public List<ReviewBoardVO> reviewTitleSearchList(String searchKeyWord) {
		// TODO Auto-generated method stub
		return reviewDAO.reviewTitleSearchList(searchKeyWord);
	}

	@Override
	public List<ReviewBoardVO> reviewWriterSearchList(String searchKeyWord) {
		// TODO Auto-generated method stub
		return reviewDAO.reviewWriterSearchList(searchKeyWord);
	}
	

	

}
