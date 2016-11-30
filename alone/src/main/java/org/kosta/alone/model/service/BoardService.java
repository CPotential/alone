package org.kosta.alone.model.service;

import java.util.List;

import org.kosta.alone.model.vo.IntroduceVO;
import org.kosta.alone.model.vo.ReviewVO;

public interface BoardService {

	public List<ReviewVO> reviewList();
	
	public List<ReviewVO> reviewTitleSearchList(String searchKeyWord);

	public  List<ReviewVO> reviewWriterSearchList(String searchKeyWord);
	
	public List<IntroduceVO> introduceList(int categoryNo);
}