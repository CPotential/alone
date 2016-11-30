package org.kosta.alone.model.service;

import java.util.List;

import org.kosta.alone.model.vo.ReviewBoardVO;

public interface BoardService {

	public List<ReviewBoardVO> reviewList();
	
	public List<ReviewBoardVO> reviewTitleSearchList(String searchKeyWord);

	public  List<ReviewBoardVO> reviewWriterSearchList(String searchKeyWord);

}